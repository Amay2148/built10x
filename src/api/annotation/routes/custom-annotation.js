module.exports = {
    routes: [
      {
        // Path defined with a URL parameter
        method: "GET",
        path: "/annotation/getMainReport",
        handler: "annotation.getMainReport",
        config: {
          auth: false,
        },
      }
    ],
  };
