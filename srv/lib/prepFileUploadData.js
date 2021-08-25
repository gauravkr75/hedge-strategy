const sql = require('./sqlUtility')

module.exports = {

    prepData: function (cds, data, uploadScenario) {

        let tablename = ''

        switch (uploadScenario) {
            case 'AP':
                tablename = 'T_ACTUAL_POSTING'
                break
            case 'AH':
                tablename = 'T_ALREADY_HEDGED'
                break
        }

        const readTableMetaSql = `SELECT COLUMN_NAME FROM TABLE_COLUMNS WHERE SCHEMA_NAME = CURRENT_SCHEMA AND TABLE_NAME = '` + tablename + `' ORDER BY POSITION `
        tableMeta = sql.executeSelect(cds, readTableMetaSql)
    }
}