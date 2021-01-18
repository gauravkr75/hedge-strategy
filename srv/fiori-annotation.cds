annotate CatalogService.Layer with @(UI : {
    SelectionFields : [YEAR],
    LineItem        : [
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'CatalogService.EntityContainer/determinePNL',
        Label  : 'Determine PNL'
    },
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'CatalogService.EntityContainer/flushResults',
        Label  : 'Flush Data'
    },

    //{Value : SMART_KEY, Label : 'Smart Key'},
    //{Value : SIMULATION_ID, Label : 'Simulation ID'},

    {Value : YEAR},
    {Value : LAYER},
    {Value : MONTH_START},

    //{Value : MONTH_START_ID, Label : 'Month Start ID'},

    {Value : MONTH_START_DATE},
    {Value : MONTH_END},

    //{Value : MONTH_END_ID, Label : 'Month End ID'},

    {Value : FORWARD_MONTH},

    //{Value : MONTH_START_KEY, Label : 'Month Start Key'},

    {Value : MONTH_END_DATE},

    //{Value : MONTH_END_KEY, Label : 'Month End Key'},

    {Value : FORWARD_PRICE},
    {Value : SPOT_PRICE},
    {Value : LAYER_PNL}
    ]
});
