annotate CatalogService.Layer with @(UI : {
    SelectionFields : [
    YEAR,
    SMART_KEY
    ],
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

    {
        Value : SMART_KEY,
        Label : 'Smart Key'
    },
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

annotate CatalogService.LayerSummary with @(UI : {
    SelectionFields : [Layer],
    LineItem        : [
    {Value : LAYER},
    {Value : LAYER_KEY},
    {Value : BACKCASTING_PNL},
    {Value : FORECASTING_PNL}
    ]
});

@sap.semantics :                        'aggregate'
annotate CatalogService.Backcasting with @(
    Analytics : {Query : true},
    UI        : {
        LineItem                                     : [
        {Value : LAYER},
        {value : LAYER_KEY},
        {Value : BLOCK_KEY},
        {Value : RECORD_KEY},
        {Value : START_MONTH},
        {Value : END_MONTH},
        {Value : QUOTE_YEAR},
        {Value : QUOTE_PRICE},
        {Value : SPOT_YEAR},
        {Value : SPOT_PRICE},
        {Value : PNL}
        ],
        SelectionPresentationVariant #DefaultVariant : {
            PresentationVariant : DefaultPresentVariant,
            SelectionVariant    : DefaultSelectVariant
        },
        PresentationVariant #DefaultPresentVariant   : {Visualizations : ['@UI.LineItem#Default']}
    }
) {
    LAYER       @sap.aggregation.role : 'dimension';
    LAYER_KEY   @sap.aggregation.role : 'dimension';
    BLOCK_KEY   @sap.aggregation.role : 'dimension';
    RECORD_KEY  @sap.aggregation.role : 'dimension';
    START_MONTH @sap.aggregation.role : 'dimension';
    END_MONTH   @sap.aggregation.role : 'dimension';
    QUOTE_YEAR  @sap.aggregation.role : 'dimension';
    QUOTE_PRICE @DefaultAggregation   : #SUM  @sap.aggregation.role : 'measure';
    SPOT_YEAR   @sap.aggregation.role : 'dimension';
    SPOT_PRICE  @DefaultAggregation   : #SUM  @sap.aggregation.role : 'measure';
    PNL         @DefaultAggregation   : #SUM  @sap.aggregation.role : 'measure';
};
