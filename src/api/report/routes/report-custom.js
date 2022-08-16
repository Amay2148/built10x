module.exports = {
  routes: [
    { // Path defined with a URL parameter
      method: 'GET',
      path: '/report-custom/report-payment-url',
      handler: 'report.getStripeReportPaymentUrl',
    },
    { // Path defined with a URL parameter
      method: 'GET',
      path: '/report-custom/generate-report',
      handler: 'report.generateReport',
      config: {
        auth: false
      }
    },

    { // Path defined with a URL parameter
      method: 'POST',
      path: '/report-custom/sendEmail',
      handler: 'report.sendEmail',
      // config: {
      //   auth: false,
      // },
    }


  ]
}
