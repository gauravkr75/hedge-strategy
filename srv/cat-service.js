const cds = require('@sap/cds');
const fileData = require('./lib/prepFileUploadData')

module.exports = async function () {

    const db = await cds.connect.to('db')
    const { CatalogService } = cds.services
    const { Layer, HedgeProfile, FileUpload } = CatalogService.entities

    this.on('determinePNL', async (req) => {
        try {
            let input = {}
            input.IV_DURATION = req.data.duration
            input.IV_NUM_LAYERS = req.data.layer
            const dbClass = require("sap-hdbext-promisfied")
            let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
            const hdbext = require("@sap/hdbext")
            const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_DET_YEAR_PNL')
            await dbConn.callProcedurePromisified(sp, input)
            console.log("Duration: " + req.data.duration + ", Layers: " + req.data.layer)
            return 'Success'
        } catch (error) {
            console.error(error)
            return 'Error Occurred'
        }
    })

    this.on('flushResults', async () => {
        try {
            await DELETE.from(Layer)
            return 'Success'
        } catch (error) {
            console.error(error)
            return 'Error Occurred'
        }
    })

    this.on('setDefault', HedgeProfile, async (req) => {
        try {

            let input = {}, output = {}
            input.IV_PROFILE_ID = req.params[0]

            const dbClass = require("sap-hdbext-promisfied")
            let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
            const hdbext = require("@sap/hdbext")
            const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_SET_HEDGE_PROFILE_ACTIVE')
            await dbConn.callProcedurePromisified(sp, input)
            const profileQ = SELECT.from(HedgeProfile)//.where({ ID: req.params[0] })
            const profileData = await profileQ
            output = profileData
            return output

        } catch (error) {
            console.error(error)
            req.error(404)
            return 'Error setting the profile as Active!'
        }
    })

    this.after('CREATE', HedgeProfile, async (data, req) => {
        try {
            let input = {}, layerDurationChar = [], layerDuration = []
            input.IV_PROFILE_ID = data.ID
            input.IV_LAYER = data.LAYER_KEY.split('_').length
            input.IV_EXP_CURRENCY = data.EXPOSURE_CURRENCY
            input.IV_BACKWARD_HORIZON = data.BACKWARD_HORIZON
            input.IV_FORWARD_HORIZON = data.FORWARD_HORIZON
            input.IV_CHANGE_MODE = 'I'

            layerDurationChar = data.LAYER_KEY.split('_')
            layerDurationChar.forEach(element => {
                layerDuration.push({ LAYER: parseInt(element) })
            });

            input.IT_LAYER_DURATION = layerDuration

            const dbClass = require("sap-hdbext-promisfied")
            let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
            const hdbext = require("@sap/hdbext")
            const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_GENERATE_FORECAST_TEMPLATE')
            await dbConn.callProcedurePromisified(sp, input)

        } catch (error) {
            console.error(error)
        }
    })

    this.after('UPDATE', HedgeProfile, async (data, req) => {
        let input = {}, adjustTemplate = false, layerKey = ''

        try {
            Object.keys(data).forEach(element => {
                if (element === 'LAYER_KEY' || element === 'EXPOSURE_CURRENCY' ||
                    element === 'BACKWARD_HORIZON' || element === 'FORWARD_HORIZON') {
                    adjustTemplate = true

                    switch (element) {
                        case 'LAYER_KEY':
                            input.IV_LAYER = data["LAYER_KEY"].split('_').length
                            layerKey = data["LAYER_KEY"]
                            break
                        case 'EXPOSURE_CURRENCY':
                            input.IV_EXP_CURRENCY = data["EXPOSURE_CURRENCY"]
                            break
                        case 'BACKWARD_HORIZON':
                            input.IV_BACKWARD_HORIZON = data["BACKWARD_HORIZON"]
                            break
                        case 'FORWARD_HORIZON':
                            input.IV_FORWARD_HORIZON = data["FORWARD_HORIZON"]
                            break
                    }
                }
            });

            if (adjustTemplate) {
                const readProfileSql = `SELECT * FROM T_HEDGE_PROFILE WHERE ID = '` + data.ID + `'`

                await cds.run(readProfileSql).then(async (profile) => {
                    let layerDurationChar = [], layerDuration = []

                    input.IV_PROFILE_ID = data.ID
                    if (!input.IV_LAYER) {
                        input.IV_LAYER = profile[0].LAYER_KEY.split('_').length
                    }
                    if (!input.IV_EXP_CURRENCY) {
                        input.IV_EXP_CURRENCY = profile[0].EXPOSURE_CURRENCY
                    }
                    if (!input.IV_BACKWARD_HORIZON) {
                        input.IV_BACKWARD_HORIZON = profile[0].BACKWARD_HORIZON
                    }
                    if (!input.IV_FORWARD_HORIZON) {
                        input.IV_FORWARD_HORIZON = profile[0].FORWARD_HORIZON
                    }
                    input.IV_CHANGE_MODE = 'U'

                    if(layerKey === ''){
                        layerKey = profile[0].LAYER_KEY
                    }

                    layerDurationChar = layerKey.split('_')
                    layerDurationChar.forEach(element => {
                        layerDuration.push({ LAYER: parseInt(element) })
                    });

                    input.IT_LAYER_DURATION = layerDuration

                    const dbClass = require("sap-hdbext-promisfied")
                    let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                    const hdbext = require("@sap/hdbext")
                    const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_GENERATE_FORECAST_TEMPLATE')
                    await dbConn.callProcedurePromisified(sp, input)

                }).catch(error => {
                    console.error(error)
                })
            }
        } catch (error) {
            console.error(error)
        }
    })

    this.after('DELETE', HedgeProfile, async (data, req) => {
        try {
            const delForecastTempSql = `DELETE FROM T_FORECAST_REPORT_PROFILE WHERE PROFILE_ID = '` + req.data.ID + `'`
            await cds.run(delForecastTempSql).then(data => {
                console.log(`Forecast Template Deleted! Num of Records Affected: ${data}`)
            }).catch(error => {
                console.error(error)
            })
        } catch (error) {
            console.error(error)
        }
    })

    this.on('CREATE', FileUpload, async (req) => {

        const xlsx = require('xlsx')
        let output = {}
        let sp = '', invalidScenario = false

        try {

            /* Get the file extension */
            const fileExtension = req.data.FILE_NAME.split('.').pop();

            /* Get the scenario for which file is being uploaded */
            const uploadScenario = req.data.UPLOAD_SCENARIO

            /* Only .xlsx files are supported */
            if (fileExtension === 'xlsx') {

                var workbook = xlsx.read(req.data.DATA, {
                    type: "array"
                });

                var firstSheet = workbook.Sheets[workbook.SheetNames[0]];

                /* header: 1 instructs xlsx to create an 'array of arrays' */
                var result = xlsx.utils.sheet_to_json(firstSheet, { header: 1 });
                result.splice(0, 1)

                const uploadData = await fileData.prepData(cds, result, uploadScenario)
                let input = {}

                const dbClass = require("sap-hdbext-promisfied")
                let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                const hdbext = require('@sap/hdbext')

                switch (uploadScenario) {
                    case 'AP':
                        input.IT_ACTUAL = uploadData
                        sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_UPSERT_ACTUAL_POSTING')
                        break

                    case 'AH':
                        input.IT_HEDGED = uploadData
                        sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_UPSERT_ALREADY_HEDGED')
                        break

                    case 'EP':
                        input.IT_EXP_POSITION = uploadData
                        sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_UPSERT_EXPOSURE_POSITION')
                        break

                    case 'HC':
                        input.IT_HIST_CURVES = uploadData
                        sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_UPSERT_HISTORICAL_CURVES')
                        break

                    default:
                        invalidScenario = true
                }

                if (!invalidScenario) {

                    await dbConn.callProcedurePromisified(sp, input)
                    output.MESSAGE = 'Uploaded Successfully'
                    output.STATUS = 'S'

                } else {
                    output.MESSAGE = 'Invalid File Upload Scenario'
                    output.STATUS = 'E'
                }

            } else {
                output.MESSAGE = 'File Format not supported'
                output.STATUS = 'E'
            }

            output.FILE_NAME = req.data.FILE_NAME
            req.reply(output)

        } catch (error) {

            console.error(error)
            output.FILE_NAME = req.data.FILE_NAME
            output.STATUS = 'E'

            if (error) {
                if (Object.prototype.hasOwnProperty.call(error, 'stack')) {
                    output.MESSAGE_DETAIL = error.stack
                    output.MESSAGE = error.message
                } else if (Object.prototype.hasOwnProperty.call(error, 'message')) {
                    output.MESSAGE = error.message
                } else {
                    output.MESSAGE = 'An unknown error occurred during file upload'
                }
            }

            req.reply(output)
        }
    })
}