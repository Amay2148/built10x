module.exports = {
  routes: [
    {
      method: "GET",
      path: "/projects/get-upload-presigned-url",
      handler: "project.getUploadPresignedUrl"
    },
    {
      method: "GET",
      path: "/projects/get-download-presigned-url",
      handler: "project.getDownloadPresignedUrl"
    },
    {
      method: "PUT",
      path: "/projects/:id/update-status",
      handler: "project.updateProjectStatus"
    }
  ]
};

