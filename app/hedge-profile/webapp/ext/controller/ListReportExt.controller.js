sap.ui.define("hedgeprofile.ext.controller.ListReportExt",
    [],
    function () {
        "use strict";
        return {
            // onUpload: function (oEvent) {
            //     alert('onUpload');
            // },
            onBeforeRebindTableExtension: function () {
                if (!this.oFileUploader) {
                    var oToolbar = this.getView().byId("hedgeprofile::sap.suite.ui.generic.template.ListReport.view.ListReport::HedgeProfile--template::ListReport::TableToolbar");
                    this.oFileUploader = new sap.ui.unified.FileUploader({
                        id: "idFileUploader1", sameFilenameAllowed: true,
                        fileType: "xlsx", useMultipart: false, name: "myFileUpload", icon: "sap-icon://upload",
                        change: this.onFileChange.bind(this)
                    });
                    oToolbar.addContent(this.oFileUploader)
                }
            },
            onFileChange: function (oEvent) {
                var file = oEvent.getParameters().files[0]
                var base64_marker = 'data:' + file.type + ';base64,';
                var reader = new FileReader();

                // On load
                reader.onload = (function (theFile) {
                    var oModel = this.getView().getModel();
                    var fileData = theFile.target.result.replace("data:" + file.type + ";base64,", "")
                    oModel.create("/FileUpload", {
                        FILE_NAME: file.name, DATA: fileData, UPLOAD_SCENARIO: 'HC'
                    },
                        null,
                        function (data) {
                            console.log(data)
                        }, function (error) {
                            console.error(error)
                        })
                }.bind(this))

                reader.readAsDataURL(file)
            }
        }
    })