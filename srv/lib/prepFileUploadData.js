module.exports = {

    prepData: async function (cds, data, uploadScenario) {

        let tablename = '', fileRow = {}, fileData = []

        switch (uploadScenario) {
            case 'AP':
                tablename = 'TT_ACTUAL_POSTING'
                break
            case 'AH':
                tablename = 'TT_ALREADY_HEDGED'
                break
            case 'EP':
                tablename = 'TT_EXP_POSITION'
                break
            case 'HC':
                tablename = 'TT_HIST_CURVES'
        }

        const readTableMetaSql = `SELECT COLUMN_NAME FROM TABLE_COLUMNS WHERE SCHEMA_NAME = CURRENT_SCHEMA 
                                    AND TABLE_NAME = '` + tablename + `' ORDER BY POSITION `

        await cds.run(readTableMetaSql).then(tableMeta => {

            if (data.length !== 0) {

                data.forEach(row => {
                    let i = 0

                    tableMeta.forEach(property => {
                        fileRow[property.COLUMN_NAME] = row[i]
                        i++
                    });

                    fileData.push(fileRow)
                    fileRow = {}
                });
            }

        }).catch(error => {
            console.error(error)
        })

        return fileData

    }
}