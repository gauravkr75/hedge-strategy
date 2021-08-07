const cds = require('@sap/cds');
module.exports = async function () {

    const db = await cds.connect.to('db')
    const { CatalogService } = cds.services
    const { Layer } = CatalogService.entities
    const { HedgeProfile } = CatalogService.entities
    
    // this.before('CREATE', HedgeProfile, async (req){
        
    // })

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

    this.on('flushResults', async (req) => {
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
}