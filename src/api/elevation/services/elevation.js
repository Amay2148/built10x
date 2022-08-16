'use strict';

/**
 * elevation service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::elevation.elevation');
