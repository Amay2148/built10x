"use strict";

/**
 *  sub-transaction controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController(
  "api::sub-transaction.sub-transaction",
  ({ strapi }) => ({
    async handleInvoiceWebhook(ctx) {
      const {
        type,
        data: { object },
      } = ctx.request.body; //request
      const { id, paid, amount_paid } = object; //invoice

      //Handling only these event types for now
      if (
        type === "invoice.payment_succeeded" ||
        type === "invoice.payment_failed"
      ) {
        const row = await strapi
          .query("api::sub-transaction.sub-transaction")
          .update({
            where: {
              stripe_invoice_id: id,
            },
            data: {
              paid: paid,
              raw_data: object,
              amount_paid: amount_paid,
            },
          });
        if (type === "invoice.payment_failed") {
          //TODO: send email to customer that they need to pay manually
        }
      } else if (type === "invoice.payment_action_required") {
        //TODO: send email to customer that they need to pay manually
      }

      return ctx.send({});
    },

    async find(ctx) {
      const user = ctx.state.user;
      const userId = user.id;
      ctx.query.filters = {
        ...ctx.query.filters,
        chief_inspector_id: userId,
      };
     let { data, meta } = await super.find(ctx);
      data = data.map((item) => ({
        id: item.id,
        chief_inspector_id: item.attributes.chief_inspector_id,
        amount_paid: item.attributes.amount_paid,
        paid: item.attributes.paid,
        hosted_invoice_url: item.attributes.raw_data.hosted_invoice_url,
        invoice_pdf: item.attributes.raw_data.invoice_pdf,
        createdAt: item.attributes.createdAt,
        stripe_invoice_id: item.attributes.stripe_invoice_id,
        total: item.attributes.raw_data.total
      }));

      return { data, meta };
    },
  })
);
