'use strict';

/**
 *  elevation-grid controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::elevation-grid.elevation-grid', ({ strapi }) => ({

    async find(ctx) {
        let results = await super.find(ctx);

        const data = results.data;
        const meta = results.meta;

        data.forEach(element => {
            if (element.attributes.ImagePath != null && element.attributes.ImagePath != "") {
                element.attributes.imageUrl = strapi.getObjectPresignedUrl(element.attributes.ImagePath);
            }
            else {
                element.attributes.imageUrl = null;
            }
            if (element.attributes.AnnotatedImagePath != null && element.attributes.AnnotatedImagePath != "") {
                element.attributes.annotatedImageUrl = strapi.getObjectPresignedUrl(element.attributes.AnnotatedImagePath);
            }
            else {
                element.attributes.annotatedImageUrl = null;
            }
        });

        return { data, meta };
    },


}));

