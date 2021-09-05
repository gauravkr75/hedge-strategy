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

                        if(uploadScenario === 'HC' && i === 0){
                            /* The number for date being returned is the number of days since the last epoch (1904 or 1900).
                               epoch date varies based on platform. For Windows it is 1900 and for Macintosh it is 1904 
                               Currently the code works for Windows platform */
                            var dataDate = new Date(1899, 12, row[i])
                            dataDate.setDate(dataDate.getDate() - 1)
                            fileRow[property.COLUMN_NAME] = dataDate.toISOString().split('T')[0]
                        }else{                            
                            fileRow[property.COLUMN_NAME] = row[i]
                        }                        
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