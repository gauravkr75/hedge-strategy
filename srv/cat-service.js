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
            const output = await dbConn.callProcedurePromisified(sp, input)
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

            let input = {}
            input.IV_PROFILE_ID = req.params[0]

            const dbClass = require("sap-hdbext-promisfied")
            let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
            const hdbext = require("@sap/hdbext")
            const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'P_SET_HEDGE_PROFILE_ACTIVE')
            const output = await dbConn.callProcedurePromisified(sp, input)

            return 'Profile Activated'

        } catch (error) {
            console.error(error)
            req.error(404)
            return 'Error setting the profile as Active!'
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