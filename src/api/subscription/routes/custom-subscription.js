module.exports = {
    routes: [
      { // Path defined with a URL parameter
        method: 'POST',
        path: '/subscriptions-custom/deactivate',
        handler: 'subscription.deactivate',
      },
      { // Path defined with a URL parameter
        method: 'POST',
        path: '/subscriptions-custom/activate',
        handler: 'subscription.activate',
      },
      { // Path defined with a URL parameter
        method: 'GET',
        path: '/subscriptions-custom/payment-intent',
        handler: 'subscription.getPaymentIntent',
      },
      { // Path defined with a URL parameter
        method: 'GET',
        path: '/subscriptions-custom/payment-methods',
        handler: 'subscription.getPaymentMethods',
      },
      { // Path defined with a URL parameter
        method: 'POST',
        path: '/subscriptions-custom/perform-payment',
        handler: 'subscription.performPayment',
      },
      
    ]
  }