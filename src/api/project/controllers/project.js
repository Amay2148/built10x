'use strict';

/**
 *  project controller
 */
const utils = require('@strapi/utils');
const {ApplicationError} = utils.errors;
const {createCoreController} = require('@strapi/strapi').factories;

//TODO: implement https://advancedweb.hu/cacheable-s3-signed-urls/
function generatePresignedUrl(fileName) {
  return strapi.s3.getSignedUrl("getObject", {
    Bucket: 'build10x-dev',
    Key: fileName,
    Expires: 100000,
    ResponseCacheControl: `max-age=31536000`,
  });
}

async function getAssociatedFI(strapi, ci) {
  return await strapi.query('plugin::users-permissions.user').findMany({
    where: {
      chief_inspector_id: ci
    },
    select: ['id']
  });
}

module.exports = createCoreController('api::project.project', ({strapi}) => ({

  async getUploadPresignedUrl(ctx) {
    const fileName = ctx.query.fileName;

    const presignedPutURL = strapi.s3.getSignedUrl("putObject", {
      Bucket: 'build10x-dev',
      Key: fileName,
      Expires: 100000
    });

    return ctx.send({
      url: presignedPutURL
    })
  },

  async getDownloadPresignedUrl(ctx) {

    return ctx.send({
      url: generatePresignedUrl(ctx.query.fileName)
    })
  },
  async create(ctx) {
    const response = await super.create(ctx);
    const projectId = response.data.id;
    const user = ctx.state.user;
    const chiefInspectorId = user.role.type === "chief_inspector" ? user.id : user.chief_inspector_id;

    const toUpdate = {
      APICreatedByUser: ctx.state.user.id,
      APICreatedById: ctx.state.user.id,
      ChiefInspectorId: chiefInspectorId
    }
    if (ctx.state.user.role.type === 'field_inspector') {
      toUpdate.FieldInspectors = [ctx.state.user.id]
    }

    await strapi
      .query("api::project.project")
      .update({
        where: {
          id: projectId
        },
        data: toUpdate
      });

    return response;
  },

  async find(ctx) {
    const user = ctx.state.user;

    if (user.role.type === 'chief_inspector') {
      if (ctx.query.filters === undefined) {
        ctx.query.filters = {};
      }
      const fis = await getAssociatedFI(strapi, user.id);
      ctx.query.filters.APICreatedByUser = [user.id].concat(fis.map(fi => fi.id));
    } else if (user.role.type === 'field_inspector') {
      if (ctx.query.filters === undefined) {
        ctx.query.filters = {};
      }
      ctx.query.filters.FieldInspectors = [user.id];
    }
    ctx.query.filters.DeletedAt = {'$null': 'false'};

    let results = await super.find(ctx);

    const data = results.data;
    const meta = results.meta;

    data.forEach(element => {
      if (element.attributes.ImagePath != null && element.attributes.ImagePath !== "") {
        element.attributes.imageUrl = generatePresignedUrl(element.attributes.ImagePath);
      } else {
        element.attributes.imageUrl = generatePresignedUrl("projects/placeholder.png");
      }
    });

    return {data, meta};
  },
  async findOne(ctx) {
    const {data, meta} = await super.findOne(ctx);

    if (data.attributes.ImagePath != null && data.attributes.ImagePath !== "") {
      data.attributes.imageUrl = generatePresignedUrl(data.attributes.ImagePath);
    } else {
      data.attributes.imageUrl = generatePresignedUrl("projects/placeholder.png");
    }

    return {data, meta};
  },

  async updateProjectStatus(ctx) {
    const newStatus = ctx.request.body.data.Status;
    const user = ctx.state.user;
    const projectId = ctx.params.id;

    const project = await strapi.query('api::project.project').findOne({
      where: {
        id: projectId
      }
    });

    if (!project) {
      throw new ApplicationError("Invalid project");
    }

    if (user.role.type === 'field_inspector') {
      if (newStatus === "ApprovalPending") {
        if (project.Status === newStatus) {
          throw new ApplicationError("Project already submitted for approval");
        } else {
          const data = await super.update(ctx);
          return ctx.send(data);
        }
      } else {
        throw new ApplicationError("Insufficient permissions");
      }
    } else if (user.role.type === 'chief_inspector') {
      if (project.Status === newStatus) {
        throw new ApplicationError("Project status is already set");
      } else {
        const data = await super.update(ctx);
        return ctx.send(data);
      }
    } else {
      throw new ApplicationError("Insufficient permissions");
    }
  },

}));
