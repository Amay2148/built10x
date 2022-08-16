'use strict';

/**
 * sub-transaction service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::sub-transaction.sub-transaction');
