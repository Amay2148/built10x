const _ = require('lodash');
const utils = require('@strapi/utils');
const { ApplicationError, ValidationError } = utils.errors;
const bcrypt = require("bcryptjs");

const { sanitize } = utils;

//const auth = require("@strapi/plugin-users-permissions/server/controllers/auth");

const sanitizeUser = (user, ctx) => {
    const { auth } = ctx.state;
    const userSchema = strapi.getModel('plugin::users-permissions.user');
    console.log(userSchema);

    return sanitize.contentAPI.output(user, userSchema, { auth });
};
//async function addCommodity(ctx)

module.exports = (plugin) => {

    const sanitizeOutput = (user) => {
        const {
            password, resetPasswordToken, confirmationToken, ...sanitizedUser
        } = user; // be careful, you need to omit other private attributes yourself
        return sanitizedUser;
    };

    plugin.controllers.user.updateLoggedInUser = async (ctx) => {

        const { password, confirmPassword } = ctx.request.body.data;

        if (password != null) {
            const params = {
                ..._.omit(ctx.request.body, ['confirmed', 'confirmationToken', 'resetPasswordToken']),
                provider: 'local',
            };
            if (password != confirmPassword) throw new ApplicationError("Passwords do not match");
            ctx.request.body.data.password = await strapi.admin.services.auth.hashPassword(password);
            ctx.request.body.data.resetPasswordToken = null;
        }
        const user = await strapi.query('plugin::users-permissions.user').update({
            where: { id: ctx.state.user.id },
            data: ctx.request.body.data
        });
        return ctx.send(user);
    }

    plugin.routes["content-api"].routes.push(
        {
            method: "POST",
            path: "/users-custom/update",
            handler: "user.updateLoggedInUser",
            config: {
                prefix: "",
                policies: []
            }
        });

    plugin.controllers.user.find = async (ctx) => {

        const user = ctx.state.user;
        console.log(ctx.query.filters);
        //if current role is chief inspector, return only field inspectors assigned
        if (user.role.type == 'chief_inspector') {
            if (ctx.query.filters == undefined) {
                ctx.query.filters = {};
            }
            ctx.query.filters.role = { type: 'field_inspector' };
            ctx.query.filters.chief_inspector_id = user.id;
        }


        const users = await strapi.entityService.findMany(
            'plugin::users-permissions.user',
            { ...ctx.query, populate: ['chief_inspector', 'role', 'subscription'] }
        );
        // console.log(users);
        //FIXME: remove password from chief_inspector objects
        ctx.body = users.map(user => sanitizeOutput(user));
    };

    plugin.controllers.user.create = async (ctx) => {
        const user = ctx.state.user;
        ctx.request.body.provider = 'local';
        if (user && user.role.type == 'chief_inspector') {
            ctx.request.body.chief_inspector_id = user.id;
            ctx.request.body.chief_inspector = user.id;
            ctx.request.body.confirmed = true;
            ctx.request.body.blocked = false;
            const roles = await strapi
                .service("plugin::users-permissions.role")
                .getRoles();
            const _fi = await strapi
                .service("plugin::users-permissions.role")
                .getRole(roles.filter((role) => role.type === "field_inspector")[0].id);
            if (_fi) ctx.request.body.role = _fi.id;
        }

        const newUser = await strapi.entityService.create(
            'plugin::users-permissions.user',
            { data: ctx.request.body }
        );

        if (user && user.role.type == 'chief_inspector') {
            //create subscription here
            const subscription = await strapi.entityService.create(
                'api::subscription.subscription',
                {
                    data: {
                        chief_inspector: user.id,
                        chief_inspector_id: user.id,
                        field_inspector: newUser.id,
                        field_inspector_id: newUser.id,
                        started_at: new Date().toISOString()
                    }
                }
            );
        }

        return newUser;
    };

    return plugin;
};
