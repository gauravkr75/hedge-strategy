module.exports = {
    executeSelect: function (cds, sqlStmt) {
        
        let data = []

        cds.run(sqlStmt).then(result => {
            data = result
        }).catch(error => {
            console.error(error)
        })

        return data
    }
}