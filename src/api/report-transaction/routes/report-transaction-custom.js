module.exports = {
  routes: [
    { // Path defined with a URL parameter
      method: 'POST',
      path: '/report-transaction-custom/webhook',
      handler: 'report-transaction.handleWebhook',
    }
  ]
}
