'use strict';
const AWS = require('aws-sdk');
const { DateTime } = require('luxon')
const utils = require('@strapi/utils');
const { ApplicationError } = utils.errors;

const credentials = {
  accessKeyId: process.env.MINIO_ACCESS_ID,
  secretAccessKey: process.env.MINIO_SECRET_KEY,
  endpoint: process.env.MINIO_END_POINT,
  s3ForcePathStyle: true, // needed with minio?
  signatureVersion: 'v4'
};
AWS.config.update(credentials);

module.exports = {
  /**
   * An asynchronous register function that runs before
   * your application is initialized.
   *
   * This gives you an opportunity to extend code.
   */
  register(/*{ strapi }*/) { },

  /**
   * An asynchronous bootstrap function that runs before
   * your application gets started.
   *
   * This gives you an opportunity to set up your data model,
   * run jobs, or perform some special logic.
   */
  bootstrap({ strapi }) {
    strapi.s3 = new AWS.S3();
    strapi.getObjectPresignedUrl = function (fileName) {
      return strapi.s3.getSignedUrl("getObject", { Bucket: 'build10x-dev', Key: fileName, Expires: 100000, ResponseCacheControl: `max-age=31536000`, });
    }

    strapi.db.lifecycles.subscribe({
      models: ['plugin::users-permissions.user'],

      // your lifecycle hooks
      //this will assign role `field inspector` to newly registered user,
      //if they are registering from the app
      async afterCreate(event) {
        const { result, model, params } = event;
        if (result.chief_inspector_id == -1) {
          await strapi.query('plugin::users-permissions.user').update({
            where: {
              id: result.id
            },
            data: {
              role: 5
            }
          });
        }

        //CI is registering from the webapp
        else if (result.chief_inspector_id == -2) {
          //TODO: put relevant try/catch to handle
          let stripeCustomer, stripeSubscription;
          try {
            stripeCustomer = await strapi.service('api::subscription.payment-gateway-service').createStripeCustomer(result.name, result.email, result.phone);
            await strapi.query('plugin::users-permissions.user').update({
              where: {
                id: result.id
              },
              data: {
                role: 4,
                stripe_customer_id: stripeCustomer.id,
                
              }
            });
          } catch (e) {
            console.log(e);
            //TODO: delete strapi user here?
            await strapi.query('plugin::users-permissions.user').delete({
              where: {
                id: result.id
              }
            });
            throw new ApplicationError("Unable to create customer on payment gaateway");
          }


        }


      },
    })
  },
};
