module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'b3071a144935566ef4a7850d153dd97a'),
  },
});
