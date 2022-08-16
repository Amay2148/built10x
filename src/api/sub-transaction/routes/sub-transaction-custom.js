module.exports = {
  routes: [
    {
      // Path defined with a URL parameter
      method: "POST",
      path: "/sub-transaction-custom/webhooks/invoice",
      handler: "sub-transaction.handleInvoiceWebhook",
    },
  ],
};
