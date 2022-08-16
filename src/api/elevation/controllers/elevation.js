'use strict';

/**
 *  elevation controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::elevation.elevation', ({ strapi }) => ({

    async find(ctx) {
        let results = await super.find(ctx);

        const data = results.data;
        const meta = results.meta;

        data.forEach(element => {
            if (element.attributes.ImagePath != null && element.attributes.ImagePath != "") {
                element.attributes.imageUrl = strapi.getObjectPresignedUrl(element.attributes.ImagePath);
            }
            else {
                element.attributes.imageUrl = strapi.getObjectPresignedUrl("projects/placeholder.png");
            }
        });

        return { data, meta };
    },

    async findOne(ctx) {
        let results = await super.findOne(ctx);
        const data = results.data;
        console.log(data);
        
        //ideally this should not happen
        if(data.attributes.AnnotatedImagePath == null){
            data.attributes.AnnotatedImagePath = data.attributes.ImagePath;
            data.attributes.annotatedImageUrl = strapi.getObjectPresignedUrl(data.attributes.ImagePath);
        }
        else {
            data.attributes.annotatedImageUrl = strapi.getObjectPresignedUrl(data.attributes.AnnotatedImagePath);
        }

        if (data.attributes.ImagePath != null && data.attributes.ImagePath != "") {
            data.attributes.imageUrl = strapi.getObjectPresignedUrl(data.attributes.ImagePath);
        }
        else {
            data.attributes.imageUrl = strapi.getObjectPresignedUrl("projects/placeholder.png");
        }
        
        return { data };
    },

    async create(ctx) {
        const response = await super.create(ctx);
        response.data.attributes.imageUrl = strapi.getObjectPresignedUrl(response.data.attributes.ImagePath);
        return response;
    }

}));
