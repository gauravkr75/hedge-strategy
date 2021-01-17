const cds = require('@sap/cds');
module.exports = async function (){
    const db = await cds.connect.to('db')
    
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
        } catch (error) {
            console.error(error)
        }
    })
}