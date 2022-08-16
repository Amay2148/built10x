'use strict';

/**
 * sub-transaction router.
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::sub-transaction.sub-transaction');
