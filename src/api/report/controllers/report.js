"use strict";

/**
 *  report controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::report.report", ({ strapi }) => ({
  async getStripeReportPaymentUrl(ctx) {
    const projectId = ctx.request.query.project_id;
    const customerId = ctx.state.user.stripe_customer_id;

    const paymentGatewayService = strapi.service(
      "api::subscription.payment-gateway-service"
    );

    const url = await paymentGatewayService.getStripeReportPaymentUrl(
      projectId,
      customerId
    );
    return ctx.send({ url: url });
  },

  async generateReport(ctx) {
    const reportService = strapi.service("api::report.report");
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

    await strapi.plugins["email"].services.email.send({
      to: "amay@citrusleaf.in",
      from: "no-reply@mg.cldev.xyz",
      replyTo: "no-reply@mg.cldev.xyz",
      subject: "Generate reports",
      html: html,
    });

    ctx.send(html);
  },

  async sendEmail(ctx) {
    const projectId = ctx.query.projectId;
    const pdfFilePath = `projects/${projectId}/reports/${fileName}`;
    const imageURL = strapi.getObjectPresignedUrl(pdfFilePath);
    let image = await axios.get(imageURL, {
      responseType: "arraybuffer",
    });

    await strapi.plugins["email"].services.email.send({
      to: "amay@citrusleaf.in",
      from: "no-reply@mg.cldev.xyz",
      cc: "helenedarroze@strapi.io",
      bcc: "ghislainearabian@strapi.io",
      replyTo: "no-reply@mg.cldev.xyz",
      subject: "Use strapi email provider successfully",
      text: "Hello xyz!",
      html: "Hello xyz!",
    });

    ctx.send({});
  },
}));
