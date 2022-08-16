'use strict';

/**
 *  report-transaction controller
 */

const {createCoreController} = require('@strapi/strapi').factories;

module.exports = createCoreController('api::report-transaction.report-transaction', ({strapi}) => ({

  async handleWebhook(ctx) {
    const event = ctx.request.body;
    const session = event.data.object;
    console.log(event);
    const projectId = parseInt(session.client_reference_id);
    console.log(session.client_reference_id);
    switch (event.type) {

      case 'checkout.session.async_payment_succeeded':
      case 'checkout.session.completed':
        console.log(event.type);
        await strapi.query("api::project.project").update({
          where: {
            id: projectId
          },
          data: {
            Status: "PaymentDone"
          }
        });

        const reportService = strapi.service('api::report.report');
        const files = await reportService.generateReport(ctx.request.query.project_id);

        const urls = [];
        files.forEach((file, _) => {
          urls.push(strapi.getObjectPresignedUrl(file));
        });

        let html = `
          Hi!\n
          Your reports are available at: \n`;

        urls.forEach((url, _) => {
          html += `${url}\n`
        });

        await strapi.query("api::project.project").update({
          where: {
            id: projectId
          },
          data: {
            Status: "ReportsGenerated"
          }
        });

        await strapi.plugins["email"].services.email.send({
          to: "amay@citrusleaf.in", //TODO: send email to CI of the project
          from: "no-reply@mg.cldev.xyz",
          replyTo: "no-reply@mg.cldev.xyz",
          subject: "Generate reports",
          html: html,
        });


        break;
      case 'checkout.session.async_payment_failed':
      case 'checkout.session.expired':
        // Then define and call a function to handle the event checkout.session.expired
        break;
      // ... handle other event types
      default:
        console.log(`Unhandled event type ${event.type}`);
    }


    ctx.send({});
  }

}));
