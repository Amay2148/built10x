"use strict";
const Stripe = require("stripe");
const stripe = Stripe(process.env.STRIPE_KEY);
const { DateTime } = require("luxon");

/**
 * InvoiceService service.
 */

module.exports = () => ({
  async createInvoiceLineItem(customerId, qty, priceId) {
    const lineItem = await stripe.invoiceItems.create({
      customer: customerId,
      quantity: qty,
      price: priceId,
    });

    return lineItem;
  },

  async createInvoice(customerId) {
    let invoice = await stripe.invoices.create({
      customer: customerId,
      collection_method: "charge_automatically",
    });

    invoice = await stripe.invoices.finalizeInvoice(invoice.id);

    return invoice;
  },

  async payInvoice(invoiceId) {
    return await stripe.invoices.pay(invoiceId);
  },

  async getInvoice(invoiceId) {
    const invoice = await stripe.invoices.retrieve(invoiceId);
    return invoice;
  },
});
