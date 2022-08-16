"use strict";

/**
 *  annotation controller
 */
var axios = require("axios");
const {createCoreController} = require("@strapi/strapi").factories;
const moment = require("moment");
const fs = require("fs");
const PDFDocument = require("pdfkit-table");
const AWS = require("aws-sdk");

module.exports = createCoreController(
  "api::annotation.annotation",
  ({strapi}) => ({
    async create(ctx) {
      const sql = `select max(annotation_number) from annotations where elevation_id = ${ctx.request.body.data.ElevationId}`;
      const data = await strapi.db.connection.raw(sql);
      ctx.request.body.data.AnnotationNumber =
        data.rows[0].max == null ? 1 : ++data.rows[0].max;
      const response = await super.create(ctx);
      return response;
    },

    async find(ctx) {
      let results = await super.find(ctx);

      const elevationId = ctx.request.query.filters.Elevation;

      const data = results.data;
      const meta = results.meta;

      const sql = `select max(annotation_number) from annotations where elevation_id = ${elevationId}`;
      const countResult = await strapi.db.connection.raw(sql);
      meta.annotationCount =
        countResult.rows[0].max == null ? 0 : countResult.rows[0].max;

      data.forEach((element) => {
        if (element.attributes.ImagesPath != null) {
          element.attributes.ImageUrls = [];
          element.attributes.ImagesPath.forEach((image, index) => {
            element.attributes.ImageUrls.push(
              strapi.getObjectPresignedUrl(image)
            );
          });
        }
      });

      return {data, meta};
    },

    async findOne(ctx) {
      let results = await super.findOne(ctx);

      const data = results.data;
      const meta = results.meta;
      data.attributes.ImageUrls = [];

      data.attributes.ImagesPath.forEach((image, _) => {
        data.attributes.ImageUrls.push(strapi.getObjectPresignedUrl(image));
      });

      return {data, meta};
    },

    async getMainReport(ctx) {
      const projectId = ctx.query.id;
      const reportService = strapi.service('api::report.report');
      await reportService.generateReport(projectId);
      ctx.send({});
    },
  })
);
