annotate CatalogService.Layer with @(UI : {
    SelectionFields : [YEAR],
    LineItem        : [
    { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.EntityContainer/determinePNL', Label: 'Determine PNL'},
    //{Value : SMART_KEY, Label : 'Smart Key'},
    //{Value : SIMULATION_ID, Label : 'Simulation ID'},
    {Value : YEAR, Label : 'Year'},
    {Value : LAYER, Label : 'Layer'},
    {Value : MONTH_START, Label : 'Month Start'},
    //{Value : MONTH_START_ID, Label : 'Month Start ID'},
    {Value : MONTH_START_DATE, Label : 'Month Start Date'},
    {Value : MONTH_END, Label : 'Month End'},
    //{Value : MONTH_END_ID, Label : 'Month End ID'},
    {Value : FORWARD_MONTH, Label : 'Forward Month'},
    //{Value : MONTH_START_KEY, Label : 'Month Start Key'},
    {Value : MONTH_END_DATE, Label : 'Month End Date'},
    //{Value : MONTH_END_KEY, Label : 'Month End Key'},
    {Value : FORWARD_PRICE, Label : 'Forward Price'},
    {Value : SPOT_PRICE, Label : 'Spot Price'},
    {Value : LAYER_PNL, Label : 'Layer PNL'}
    ]
});
