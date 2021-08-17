sap.ui.define("hedgeprofile.ext.controller.ListReportExt",
    [],
    function () {
        "use strict";
        return {
            onUpload: function (oEvent) {
                alert('onUpload');
            },
            onBeforeRebindTableExtension: function () {
                if (!this.oFileUploader) {
                    var oToolbar = this.getView().byId("hedgeprofile::sap.suite.ui.generic.template.ListReport.view.ListReport::HedgeProfile--template::ListReport::TableToolbar");
                    this.oFileUploader = new sap.ui.unified.FileUploader({
                        id: "idFileUploader1", sameFilenameAllowed: true,
                        fileType: "xlsx,xlsm,csv", useMultipart: false, name: "myFileUpload", icon: "sap-icon://upload",
                        change:this.onFileChange,
                        uploadUrl: "/adjrest/upload/adjwbnch"

                    });
                    oToolbar.addContent(this.oFileUploader)
                }
            },
            onFileChange: function(oEvent) {
                oEvent.getSource().upload();
            }
        };
    });