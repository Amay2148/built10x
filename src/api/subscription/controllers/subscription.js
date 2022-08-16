'use strict';

/**
 *  subscription controller
 */

const { DateTime } = require('luxon')
const utils = require('@strapi/utils');
const { ApplicationError, ValidationError } = utils.errors;

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::subscription.subscription', ({ strapi }) => ({


  async deactivate(ctx) {
    const invoiceService = strapi.service('api::subscription.invoice-service');

    const fi = ctx.request.body.data.field_inspector_id;
    const sql = `select * from subscriptions where stopped_at is null and field_inspector_id = ${fi}`;
    const subscriptions = await strapi.db.connection.raw(sql);
    if (subscriptions.rows.length > 0) {
      const subscription = subscriptions.rows[0];
      try {
        console.log(subscription.started_at);
        const startedAt = DateTime.fromJSDate(subscription.started_at);
        console.log(startedAt);
        const days = startedAt.diffNow("days").toObject().days ?? 1;
        console.log(days);
        const qty = Math.ceil(Math.abs(days));
        console.log(qty);
        const ci = await strapi.query('plugin::users-permissions.user').findOne({
          where: {
            id: subscription.chief_inspector_id
          }
        });

        console.log(ci);


        await strapi.db.connection.transaction(async (transacting) => {
          await invoiceService.createInvoiceLineItem(ci.stripe_customer_id, qty, process.env.STRIPE_FI_PRICE_ID);
          await strapi.query('api::subscription.subscription').update({
            where: {
              id: subscription.id
            },
            data: {
              stopped_at: new Date().toISOString()
            }
          }, {transacting});

          await strapi.query('plugin::users-permissions.user').update({
            where: {id: fi},
            data: {blocked: true}
          }, {transacting});
        });


      } catch (e) {
        console.log(e);
        throw new ApplicationError("Unable to fulfill request at payment gateway. Please try again later");
      }

    }
    ctx.send({});
  },

  async activate(ctx) {

    const fi = ctx.request.body.data.field_inspector_id;
    const ci = ctx.state.user.id;
    const date = new Date().toISOString();
    await strapi.query('api::subscription.subscription').create({

      data: {
        'field_inspector': fi,
        'field_inspector_id': fi,
        'chief_inspector': ci,
        'chief_inspector_id': ci,
        'started_at': date
      }
    });
    await strapi.query('plugin::users-permissions.user').update({
      where: {id: fi},
      data: {blocked: false}
    });
    return ctx.send({});
  },

  async getPaymentIntent(ctx) {
    const paymentGatewayService = strapi.service('api::subscription.payment-gateway-service');

    const user = ctx.state.user; //CI
    const clientSecret = await paymentGatewayService.setupPaymentIntent(user.stripe_customer_id);
    ctx.send({client_secret: clientSecret});
  },

  async getPaymentMethods(ctx) {
    const paymentGatewayService = strapi.service('api::subscription.payment-gateway-service');
    const user = ctx.state.user;
    try {
      const paymentMethods = await paymentGatewayService.getPaymentMethods(user.stripe_customer_id);
      return ctx.send({data: paymentMethods});
    } catch (e) {
      throw new ApplicationError("No payment methods attached to customer");
    }
  },

  //this is temporary route, this will be done inside a cron job
  //TODO: send email
  async performPayment(ctx) {
    const invoiceService = strapi.service('api::subscription.invoice-service');

    const user = ctx.state.user;
    try {
      const invoice = await invoiceService.createInvoice(user.stripe_customer_id);
      if (invoice != null) {
        const transaction = await strapi.entityService.create('api::sub-transaction.sub-transaction', {
          data: {
            chief_inspector_id: user.id,
            chief_inspector: user,
            stripe_invoice_id: invoice.id,
            amount_paid: invoice.amount_paid,
            paid: false,
            line_items: invoice.lines.data,
            raw_data: invoice
          },
        });

        await invoiceService.payInvoice(invoice.id);

        ctx.send({data: transaction});
      }

    } catch (e) {
      console.log(e.type);
      console.log(e.message);
      switch (e.type) {
        case 'StripeCardError':
          //TODO: check if the payment was declined and send email to the customer
          //e.message => get exact error message

          break;
        case 'StripeRateLimitError':
          // Too many requests made to the API too quickly
          break;
        case 'StripeInvalidRequestError':
          // Invalid parameters were supplied to Stripe's API
          break;
        case 'StripeAPIError':
          // An error occurred internally with Stripe's API
          break;
        case 'StripeConnectionError':
          // Some kind of error occurred during the HTTPS communication
          break;
        case 'StripeAuthenticationError':
          // You probably used an incorrect API key
          break;
        default:
          // Handle any other types of unexpected errors
          break;
      }

      console.log(e);
      throw new ApplicationError("Unable to perform payment. Please try again later.");
    }
  },

  //Test route
  // async saveInvoice(ctx) {
  //     const user = ctx.state.user;
  //     const invoiceService = strapi.service('api::subscription.invoice-service');
  //     const invoice = await invoiceService.getInvoice("in_1L6pdIC6RzKl2vklgyW85A9x");
  //     const transaction = await strapi.entityService.create('api::sub-transaction.sub-transaction', {
  //         data: {
  //             chief_inspector_id: user.id,
  //             chief_inspector: user,
  //             stripe_invoice_id: invoice.id,
  //             amount_paid: invoice.amount_paid,
  //             paid: false,
  //             line_items: invoice.lines.data
  //         },
  //     });
  //     ctx.send({ data: transaction });
  // }

}));


