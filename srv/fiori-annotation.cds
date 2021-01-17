annotate CatalogService.Layer with @(UI : {
    SelectionFields : [YEAR],
    LineItem        : [
    { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.EntityContainer/determinePNL', Label: 'Determine PNL'},
    {Value : SMART_KEY},
    {Value : SIMULATION_ID},
    {Value : YEAR},
    {Value : LAYER},
    {Value : MONTH_START},
    {Value : MONTH_START_ID},
    {Value : MONTH_START_DATE},
    {Value : MONTH_END},
    {Value : MONTH_END_ID},
    {Value : FORWARD_MONTH},
    {Value : MONTH_START_KEY},
    {Value : MONTH_END_DATE},
    {Value : MONTH_END_KEY},
    {Value : FORWARD_PRICE},
    {Value : SPOT_PRICE},
    {Value : LAYER_PNL}
    ]
});
