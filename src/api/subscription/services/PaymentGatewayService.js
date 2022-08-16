'use strict';

/**
 * PaymentGatewayService service.
 */
const Stripe = require('stripe');
const stripe = Stripe(process.env.STRIPE_KEY);
const {DateTime} = require('luxon');

module.exports = () => ({
  async createStripeCustomer(name, email, phone) {
    return await stripe.customers.create({
      "name": name,
      "email": email,
      "phone": phone,
    });
  },


  //used to save CC cards in Stripe after creating customer (CI)
  async setupPaymentIntent(stripeCustomerId) {
    const setupIntent = await stripe.setupIntents.create({
      customer: stripeCustomerId,
      payment_method_types: ['card'],
    });

    return setupIntent.client_secret;
  },

  async getPaymentMethods(stripeCustomerId) {
    const paymentMethods = await stripe.paymentMethods.list({
      customer: stripeCustomerId,
      type: 'card',
    });
    return paymentMethods.data;
  },

  async getStripeReportPaymentUrl(projectId, customerId) {
    const session = await stripe.checkout.sessions.create({
      line_items: [
        {
          // Provide the exact Price ID (for example, pr_1234) of the product you want to sell
          price: process.env.STRIPE_REPORT_PRICE_ID,
          quantity: 1,
        },
      ],
      client_reference_id: projectId,
      customer: customerId,
      mode: 'payment',
      success_url: `${process.env.NUXT_URL}/projects/report-payment-success`,
      cancel_url: `${process.env.NUXT_URL}/projects/report-payment-cancelled`,
      automatic_tax: {enabled: false},
    });

    return session.url;
  },

  //DEPRECATED
  async attachSubscription(stripeCustomerId) {
    return await stripe.subscriptions.create({
      customer: stripeCustomerId,
      items: [{price: process.env.STRIPE_PRICE_ID}],
      billing_cycle_anchor: DateTime.utc().endOf('month').toUnixInteger()
    });
  },

  //DEPRECATED
  async createUsageRecord(subscriptionId, qty) {
    await stripe.subscriptionItems.createUsageRecord(
      subscriptionId,
      {quantity: qty}
    );
  }
});
