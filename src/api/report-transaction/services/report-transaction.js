'use strict';

/**
 * report-transaction service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::report-transaction.report-transaction');
