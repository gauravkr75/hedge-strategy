sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/Dialog",
    "sap/m/DialogType",
    "sap/m/Button",
    "sap/m/ButtonType",
    "sap/m/Label",
    "sap/m/MessageToast",
    "sap/m/Text",
    "sap/m/TextArea",
    "sap/m/Select",
    "sap/ui/unified/FileUploader"
],
	/**
	 * @param {typeof sap.ui.core.mvc.Controller} Controller
	 */
    function (Controller, Dialog, DialogType, Button, ButtonType, Label, MessageToast, Text, TextArea, Select, FileUploader) {
        "use strict";
        return Controller.extend("hedgefileupload.controller.Main", {
            onInit: function () {
                var oViewModel = new sap.ui.model.json.JSONModel({
                    submitEnabled: false,
                    uploadScenerio: 'AP',
                    fileData: { data: '', file: '', fileName: '' },
                    selectData: [
                        {
                            key: 'AP',
                            value: 'Actual Posting'
                        }, {
                            key: 'AH',
                            value: 'Hedged Position'
                        }, {
                            key: 'HC',
                            value: 'Historical Curves'
                        }, {
                            key: 'EP',
                            value: 'Cash Flow Forecast'
                        }
                    ]
                });
                this.getView().setModel(oViewModel, "viewModel");
            },
            onFileUploadPress: function (oEvent) {
                if (!this.oSubmitDialog) {
                    this.oSubmitDialog = new Dialog({
                        type: DialogType.Message,
                        title: "Confirm",
                        content: [
                            new Label({
                                text: "File upload type",
                                labelFor: "submissionType"
                            }),
                            new Select("submissionType", {
                                width: "100%",
                                selectedKey: '{viewModel>/uploadScenerio}',
                                items: {
                                    path: "viewModel>/selectData",
                                    templateShareable: false,
                                    template: new sap.ui.core.Item({
                                        key: "{viewModel>key}",
                                        text: "{viewModel>value}"
                                    })
                                }
                            }),
                            new Label({
                                text: "File",
                                labelFor: "fileUploader"
                            }),
                            new FileUploader("fileUploader", {
                                width: "100%",
                                name: "myFileUpload",
                                value: '{viewModel>/fileData/fileName}',
                                sameFilenameAllowed: true,
                                fileType: "xlsx", useMultipart: false,
                                change: this.handleUploadChange.bind(this)
                            })
                        ],
                        beginButton: new Button({
                            type: ButtonType.Emphasized,
                            text: "Submit",
                            enabled: '{viewModel>/submitEnabled}',
                            press: this.onSubmitUpload.bind(this)
                        }),
                        endButton: new Button({
                            text: "Cancel",
                            press: function () {
                                this.oSubmitDialog.close();
                            }.bind(this)
                        })
                    });
                    this.oSubmitDialog.setModel(this.getView().getModel("viewModel"), "viewModel");
                }
                this.clearModelData();
                this.oSubmitDialog.open();
            },

            clearModelData: function() {
                var oViewModel = this.getView().getModel('viewModel');
                oViewModel.setProperty('/uploadScenerio', 'AP');
                oViewModel.setProperty('/fileData', { data: '', file: '', fileName: '' });
                oViewModel.setProperty('/submitEnabled', false);
            },

            handleUploadChange: function (oEvent) {
                this.oSubmitDialog.getBeginButton().setEnabled(true);
                var oViewModel = this.getView().getModel('viewModel');
                var file = oEvent.getParameters().files[0]
                var base64_marker = 'data:' + file.type + ';base64,';
                var reader = new FileReader();
                // On load
                reader.onload = (function (theFile) {
                    var fileData = theFile.target.result.replace("data:" + file.type + ";base64,", "");
                    oViewModel.setProperty('/fileData', { data: fileData, file: file, fileName: file.name });
                    oViewModel.setProperty('/submitEnabled', true);
                }.bind(this))

                reader.readAsDataURL(file)
            },

            onSubmitUpload: function () {
                var oModel = this.getView().getModel(),
                    oViewModel = this.getView().getModel('viewModel'),
                    fileData = oViewModel.getProperty('/fileData'),
                    sUploadScenerio = oViewModel.getProperty('/uploadScenerio');
                oModel.create("/FileUpload", {
                    FILE_NAME: fileData.file.name, DATA: fileData.data, UPLOAD_SCENARIO: sUploadScenerio
                }, {
                    method: "POST",
                    success: function (data) {
                        console.log(data);
                        MessageToast.show(data.MESSAGE);
                    }.bind(this),
                    error: function (error) {
                        console.error(error)
                        MessageToast.show("Upload failure");
                    }.bind(this)
                }
                );
                this.oSubmitDialog.close();
            }
        });
    });
