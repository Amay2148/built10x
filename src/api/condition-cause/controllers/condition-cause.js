'use strict';

/**
 *  condition-cause controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::condition-cause.condition-cause', ({ strapi }) => ({

    async find(ctx) {
        ctx.request.query.pagination = {
            page: 1,
            pageSize: 100,
        };
        const { data, meta } = await super.find(ctx);
        return { data, meta };
    }

}));
