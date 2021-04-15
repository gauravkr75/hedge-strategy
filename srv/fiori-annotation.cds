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
        Label : 'Smart Key',
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

annotate CatalogService.LayerSummary with @(
                                            //sap.semantics : 'aggregate',
                                            //Analytics     : {Query : true},
                                          UI : {
    SelectionFields         : [LAYER],
    LineItem                : [
    //{Value : SOURCE},
    {Value : LAYER},
    {Value : LAYER_KEY},
    {Value : BACKCASTING_PNL},
    {Value : EXISTING_PNL},
    {Value : RELATIVE_PNL_BACKCAST},
    {Value : FORECASTING_PNL},
    //{Value : RELATIVE_PNL_FORECAST},
    {Value : FROM_CURR},
    {Value : TO_CURR},
    {Value : NUM_OF_SIMULATIONS},
    {Value : RECORD_PROC_COUNT}
    ],
    HeaderInfo              : {
        TypeName       : 'Hedging Strategy',
        TypeNamePlural : 'Hedging Strategy',
        ImageUrl       : 'sap-icon://sales-quote',
        Title          : {Value : LAYER_TEXT},
        Description    : {Value : LAYER_KEY_TEXT}
    },
    HeaderFacets            : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.DataPoint#BackCasting'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.DataPoint#Existing'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.DataPoint#ForeCasting'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.DataPoint#RelBackcast'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.DataPoint#RelForecast'
    }
    ],

    DataPoint #Existing     : {
        Value : BACKCASTING_PNL,
        Title : 'Backcasting PNL'
    },
    DataPoint #BackCasting  : {
        Value : EXISTING_PNL,
        Title : 'Existing PNL'
    },
    DataPoint #ForeCasting  : {
        Value : FORECASTING_PNL,
        Title : 'Forecasting PNL'
    },
    DataPoint #RelBackcast  : {
        Value : RELATIVE_PNL_BACKCAST,
        Title : '% Rel. Gain/Loss(Backcast)'
    },
    DataPoint #RelForecast  : {
        Value : RELATIVE_PNL_FORECAST,
        Title : '% Rel. Gain/Loss(Forecast)'
    },

    Facets                  : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#GeneralData',
        Label  : 'General Info'
    },

    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'ToBackcasting/@UI.LineItem',
        Label  : 'Backcasting'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'ToExisting/@UI.LineItem',
        Label  : 'Existing'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'ToForecasting/@UI.LineItem',
        Label  : 'Forecasting'
    }
    ],

    FieldGroup #GeneralData : {Data : [
    {Value : LAYER},
    {Value : LAYER_KEY},
    {Value : FROM_CURR},
    {Value : TO_CURR}
    ]}

}); //{
//     LAYER @sap.aggregation.role : 'dimension';
//     LAYER_KEY @sap.aggregation.role : 'dimension';
//     NUM_OF_SIMULATIONS @DefaultAggregation   : #SUM  @sap.aggregation.role : 'measure';
//     RECORD_PROC_COUNT @DefaultAggregation   : #SUM  @sap.aggregation.role : 'measure';
//     BACKCASTING_PNL @sap.aggregation.role : 'measure';
//     FORECASTING_PNL @sap.aggregation.role : 'measure';
//     EXISTING_PNL @sap.aggregation.role : 'measure';
//     RELATIVE_PNL_BACKCAST @sap.aggregation.role : 'measure';
//     RELATIVE_PNL_FORECAST @sap.aggregation.role : 'measure';
// };

annotate CatalogService.Backcasting with @(
    sap.semantics : 'aggregate',
    Analytics     : {Query : true},
    HeaderInfo    : {
        TypeName       : 'Backcast',
        TypeNamePlural : 'Backcasts',
        Title          : {Value : LAYER},
        Description    : {Value : LAYER_KEY}
    },
    UI            : {LineItem : [
    // {Value : LAYER},
    // {Value : LAYER_KEY},
    // {Value : BLOCK_KEY},
    //{Value : RECORD_KEY},
    //{Value : START_MONTH},
    //{Value : END_MONTH},
    {Value : QUOTE_YEAR},
    {Value : QUOTE_PRICE},
    //{Value : SPOT_YEAR},
    {Value : SPOT_PRICE},
    {Value : PNL}
    ]
    // Chart                                        : {
    //     Title               : 'Backcasting',
    //     ChartType           : #Column,
    //     Dimensions          : [LAYER],
    //     DimensionAttributes : [{
    //         Dimension : LAYER,
    //         Role      : #Category
    //     }],
    //     Measures            : [PNL],
    //     MeasureAttributes   : [{
    //         Measure : PNL,
    //         Role    : #Axis1
    //     }]
    // }
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

annotate CatalogService.Forecasting with @(
    sap.semantics : 'aggregate',
    Analytics     : {Query : true},
    HeaderInfo    : {
        TypeName       : 'Forecast',
        TypeNamePlural : 'Forecasts',
        Title          : {Value : LAYER},
        Description    : {Value : LAYER_KEY}
    },
    UI            : {LineItem : [
    //{Value : LAYER},
    //{Value : LAYER_KEY},
    //{Value : BLOCK_KEY},
    //{Value : RECORD_KEY},
    {Value : START_MONTH},
    {Value : QUOTE_YEAR},
    {Value : END_MONTH},
    {Value : SPOT_YEAR},
    {Value : QUOTE_PRICE},
    {Value : SPOT_PRICE},
    {Value : PNL}
    ]}
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

annotate CatalogService.Existing with @(
    sap.semantics : 'aggregate',
    Analytics     : {Query : true},
    HeaderInfo    : {
        TypeName       : 'Existing',
        TypeNamePlural : 'Existing',
        Title          : {Value : LAYER},
        Description    : {Value : LAYER_KEY}
    },
    UI            : {LineItem : [
    //{Value : LAYER},
    //{Value : LAYER_KEY},
    //{Value : BLOCK_KEY},
    //{Value : RECORD_KEY},
    //{Value : START_MONTH},
    {Value : QUOTE_YEAR},
    //{Value : END_MONTH},
    //{Value : SPOT_YEAR},
    {Value : QUOTE_PRICE},
    {Value : SPOT_PRICE},
    {Value : PNL}
    ]}
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
