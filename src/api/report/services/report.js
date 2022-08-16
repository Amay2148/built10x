"use strict";

const PDFDocument = require("pdfkit-table");
const fs = require("fs");
const moment = require("moment/moment");
const axios = require("axios");
/**
 * report service.
 */

const { createCoreService } = require("@strapi/strapi").factories;

module.exports = createCoreService("api::report.report", ({ strapi }) => ({
  async generateReport(projectId) {
    console.log("generateReport called: " + projectId);
    const elevation = await strapi.db
      .query("api::elevation.elevation")
      .findMany({
        where: { project_id: projectId },
      });

    const project = await strapi.db.query("api::project.project").findOne({
      where: { id: projectId },
    });

    const allAnnotations = [];
    const allAcAnnotations = [];
    await Promise.all(
      elevation.map(async (element) => {
        try {
          //get annotations for this elevation
          const annotationsAc = await strapi.db
            .query("api::annotation.annotation")
            .findMany({
              where: {
                elevation_id: element.id,
                ConditionDescription: { $containsi: "WINDOW AC" },
              },
              populate: {
                Elevation: {
                  select: ["name"],
                },
              },
            });

          const annotations = await strapi.db
            .query("api::annotation.annotation")
            .findMany({
              where: {
                elevation_id: element.id,
                ConditionDescription: { $notContainsi: "WINDOW AC" },
              },

              populate: {
                Elevation: {
                  select: ["name"],
                },
              },
            });

          annotationsAc.forEach(function (al) {
            allAcAnnotations.push(al);
          });

          annotations.forEach(function (al) {
            allAnnotations.push(al);
          });
        } catch (error) {
          console.log("error" + error);
        }
      })
    );

    const timestamp = Date.now();
    const filePaths = [];
    if (allAcAnnotations.length > 0) {
      filePaths.push(await this._generateMainReportPDF(
        project,
        allAcAnnotations,
        `WindowAc${timestamp}.pdf`
      ));
      filePaths.push(await this._generateAnnotationsPDF(
        projectId,
        allAcAnnotations,
        `WindowAc${timestamp}_annotations.pdf`
      ));
    }

    if (allAnnotations.length > 0) {
      filePaths.push(await this._generateMainReportPDF(
        project,
        allAnnotations,
        `${timestamp}.pdf`
      ));

      filePaths.push(await this._generateAnnotationsPDF(
        projectId,
        allAnnotations,
        `${timestamp}_annotations.pdf`
      ));
    }

    return filePaths;
  },

  async _generateMainReportPDF(project, annotations, fileName) {
    const doc = new PDFDocument({ margin: 30, size: "A4" });
    doc.pipe(fs.createWriteStream(`public/uploads/${fileName}`));
    doc
      .font("Times-Bold")
      .text("TABLE OF CONDITIONS OBSERVED", { align: "center" });

    doc.moveDown();
    doc.moveDown(1);
    doc.moveDown(2);

    const t1 = {
      headers: [
        {
          label: `DEVELOPMENT NAME:${project.Name}`,
          property: "name",
          width: 150,
        },

        {
          label: `BUILDING:${project.BuildingAddress}`,
          property: "block",
          width: 150,
        },
        {
          label: `ADDRESS:${project.ProjectAddress}`,
          property: "lot",
          width: 220,
        },
      ],
      datas: [
        {
          name: `BIN: ${project.BIN}`,
          block: `BLOCK No.: ${project.Block}`,
          lot: `LOT No.: ${project.LOT}`,
        },
        {
          name: `INSPECTION DATE:${moment(project.ProjectDate).format(
            "MM/DD/yyyy"
          )}`,
          block: `DOB CONTROL No.: ${project.DOBControlNumber}`,
          lot: `INSPECTING A/E: ${project.AEConsultingInspector}`,
        },
      ],
    };

    doc.table(t1, {
      prepareHeader: () => doc.font("Helvetica-Bold").fontSize(8),
      prepareRow: (_) => {
        doc.font("Helvetica").fontSize(8);
      },
    });

    doc.moveDown(1);
    const table = {
      headers: [
        "Location",
        "Photo No",
        "Condition Description",
        "Causes",
        "Recommendation",
        "Unit",
        "QTY",
      ],

      rows: annotations.map((al) => [
        "EL:" + al.Elevation.Name + "," + al.AnnotationObject.position.position,
        al.AnnotationNumber,
        al.ConditionDescription,
        al.Causes,
        al.Recommendation,
        al.Unit,
        al.Quantity,
      ]), //apply map here
    };

    await doc.table(table, {
      columnsSize: [100, 60, 125, 80, 90, 50, 50],
    });
    doc.end();

    const fileContent = fs.createReadStream(`public/uploads/${fileName}`);

    const params = {
      Bucket: "build10x-dev",
      Key: `projects/${project.id}/reports/${fileName}`,
      Body: fileContent,
    };

    await strapi.s3.upload(params).promise();

    await strapi.query("api::report.report").create({
      where: {
        where: { id: project.id },
      },
      data: {
        projectId: project.id,
        name: fileName,
      },
    });
    return `projects/${project.id}/reports/${fileName}`;
  },

  async _generateAnnotationsPDF(projectId, annotations, fileName) {
    let doc = new PDFDocument({ margin: 30, size: "A4" });

    doc.pipe(fs.createWriteStream(`public/uploads/${fileName}`));

    for (let i = 0; i < annotations.length; i++) {
      let element = annotations[i];
      const imageURL = strapi.getObjectPresignedUrl(element.ImagesPath[0]);
      let image = await axios.get(imageURL, {
        responseType: "arraybuffer",
      });
      doc.image(image.data, {
        width: 500,
        height: 200,
      });
      doc.moveDown();
      doc.moveDown(1);
      doc.moveDown(2);
      const t1 = {
        headers: [
          {
            label: `Photo:${element.AnnotationNumber}`,
            property: "name",
            width: 210,
          },

          {
            label: `Date:${moment(element.createdAt).format("MM/DD/yyyy")}`,
            property: "block",
            width: 150,
          },
          {
            label: `Location:EL:${element.Elevation.Name},${element.AnnotationObject.position.position}`,
            property: "lot",
            width: 180,
          },
        ],
        datas: [
          {
            name: `Condition Description: ${element.ConditionDescription}`,

            lot: `Recommendation: ${element.Recommendation}`,
          },
          {
            name: `Causes: ${element.Causes}`,

            lot: `Quantity: ${element.Quantity}`,
          },
        ],
      };

      doc.table(t1, {
        prepareHeader: () => doc.font("Helvetica-Bold").fontSize(8),
        prepareRow: (indexColumn) => {
          doc.font("Helvetica").fontSize(8);
        },
      });

      doc.addPage();
    }

    doc.end();

    const fileContent = fs.createReadStream(`public/uploads/${fileName}`);

    const params = {
      Bucket: "build10x-dev",
      Key: `projects/${projectId}/reports/${fileName}`,
      Body: fileContent,
    };

    await strapi.s3.upload(params).promise();

    await strapi.query("api::report.report").create({
      where: {
        where: { id: projectId },
      },
      data: {
        projectId: projectId,
        name: fileName,
      },
    });
    return `projects/${projectId}/reports/${fileName}`;
  },
}));
