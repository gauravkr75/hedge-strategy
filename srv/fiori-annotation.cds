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

annotate CatalogService.ForecastReport with @(UI : {LineItem : [
    {Value : HEDGE_YEAR},
    {Value : HEDGE_MONTH},
    {Value : FORWARD_SETTLE_YEAR},
    {Value : FORWARD_SETTLE_MONTH},
    {Value : LAYER_SEQUENCE},
    {Value : LAYER1_PERCENTAGE},
    {Value : LAYER2_PERCENTAGE},
    {Value : FORECAST},
    {Value : MIN_VALUE},
    {Value : MAX_VALUE},
    {Value : BPL_PER},
    {Value : MKT_VAL_RATIO_PER},
    {Value : FORECAST_COMP_PER},
    {Value : PROPOSED_PERCENT},
    {Value : PROPOSED_VALUE}

]});

annotate CatalogService.HedgeProfile with @(UI : {
    PresentationVariant : {SortOrder : [{
        Property   : DEFAULT,
        Descending : true
    }]},
    SelectionFields     : [PROFILE_NAME],
    LineItem            : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.EntityContainer/HedgeProfile_setDefault',
            Label  : 'Set as Active'
        },
        {
            Value                 : DefaultText,
            Criticality           : DefaultCritical,
            Title                 : 'Status',
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : PROFILE_NAME,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        },
        {
            Value                 : MODEL,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : LAYER1_MIN_PER,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : LAYER1_MAX_PER,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : LAYER2_MIN_PER,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : LAYER2_MAX_PER,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : LAYER_KEY,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : START_MONTH,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : YEAR,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        }
    ],
    HeaderInfo          : {
        TypeName       : 'Hedge Profile',
        TypeNamePlural : 'Hedge Profile(s)',
        ImageUrl       : 'sap-icon://personnel-view',
        Title          : {Value : PROFILE_NAME}
    },
    HeaderFacets        : [
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#Model'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#Status'
        }
    ],
    DataPoint #Model    : {
        Value : MODEL,
        Title : 'Model Name'
    },
    DataPoint #Status   : {
        Value       : DefaultText,
        Title       : 'Status',
        Criticality : DefaultCritical
    },
    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Profile',
        Label  : 'Profile Parameters'
    }],

    FieldGroup #Profile : {Data : [
        {Value : PROFILE_NAME},
        {Value : MODEL},
        {Value : LAYER1_MIN_PER},
        {Value : LAYER1_MAX_PER},
        {Value : LAYER2_MIN_PER},
        {Value : LAYER2_MAX_PER},
        {Value : LAYER_KEY},
        {Value : START_MONTH},
        {Value : YEAR},
        {Value : WEIGHT_BPL},
        {Value : WEIGHT_MKT_VAL_RATIO},
        {Value : WEIGHT_FORECAT_COMP}
    ]}
});


annotate CatalogService.ActualPosting with @(UI : {
    SelectionFields : [
        PERIOD,
        PLANNING_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {Value : PERIOD},
        {Value : PLANNING_YEAR},
        {Value : EXPOSURE_CURRENCY},
        {Value : TARGET_CURRENCY},
        {Value : ACTUAL_AMOUNT}
    ]
});

annotate CatalogService.AlreadyHedged with @(UI : {
    SelectionFields : [
        PERIOD,
        PLANNING_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {Value : PERIOD},
        {Value : PLANNING_YEAR},
        {Value : EXPOSURE_CURRENCY},
        {Value : TARGET_CURRENCY},
        {Value : HEDGED_AMOUNT}
    ]
});

annotate CatalogService.HistoricalCurves with @(UI : {
    SelectionFields : [
        DATE,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {Value : DATE},
        {Value : EXPOSURE_CURRENCY},
        {Value : TARGET_CURRENCY},
        {Value : SPOT},
        {Value : ONE_M},
        {Value : TWO_M},
        {Value : THREE_M},
        {Value : FOUR_M},
        {Value : FIVE_M},
        {Value : SIX_M},
        {Value : SEVEN_M},
        {Value : EIGHT_M},
        {Value : NINE_M},
        {Value : TEN_M},
        {Value : ELEVEN_M},
        {Value : ONE_Y}
    ]
});

annotate CatalogService.ExposurePosition with @(UI : {
    SelectionFields : [
        PERIOD,
        PLANNING_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {Value : PERIOD},
        {Value : PLANNING_YEAR},
        {Value : EXPOSURE_CURRENCY},
        {Value : TARGET_CURRENCY},
        {Value : EXPOSURE_AMOUNT}
    ]
});

annotate CatalogService.ForecastExpReport with @(UI : {
    HeaderInfo      : {
        TypeName       : 'Forecast Exposure',
        TypeNamePlural : 'Forecast Exposure(s)'
    },
    SelectionFields : [
        HEDGE_YEAR,
        HEDGE_MONTH,
        EXPOSURE_CURRENCY
    ],
    LineItem        : [
        {Value : HEDGE_YEAR},
        {Value : HEDGE_MONTH},
        {Value : FORWARD_SETTLE_YEAR},
        {Value : FORWARD_SETTLE_MONTH},
        {Value : LAYER1_PERCENTAGE},
        {Value : LAYER2_PERCENTAGE},
        {Value : LAYER_SEQUENCE},
        {Value : EXPOSURE_CURRENCY},
        {Value : FORECAST},
        {Value : MIN_VALUE},
        {Value : MAX_VALUE},
        //{Value : BPL_PER},
        //{Value : FORECAST_COMP_PER},
        //{Value : MKT_VAL_RATIO_PER},
        {Value : PROPOSED_PERCENT},
        {
            Value                     : PROPOSED_VALUE,
            Criticality               : PropAmountCritical,
            CriticalityRepresentation : #WithoutIcon
        },
        {Value : HEDGED_AMOUNT},
        {Value : DIFF_VALUE}
    ]
}) {
    PropAmountCritical @(UI : {Hidden : true});
};

annotate CatalogService.BestLayer with @(UI : {
    HeaderInfo      : {
        TypeName       : 'Best Performing Layer',
        TypeNamePlural : 'Best Performing Layer(s)'
    },
    SelectionFields : [EXPOSURE_CURRENCY],
    LineItem        : [
        {Value : LAYER},
        {Value : LAYER_KEY},
        {Value : EXPOSURE_CURRENCY},
        {Value : TARGET_CURRENCY},
        {Value : PNL}
    ]
});

annotate CatalogService.LayerPNL with @(UI : {
    HeaderInfo      : {
        TypeName       : 'Layer PnL',
        TypeNamePlural : 'Layer PnL(s)'
    },
    SelectionFields : [
        LAYER,
        QUOTE_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {Value : LAYER},
        {Value : LAYER_KEY},
        {Value : BLOCK_KEY_DESC},
        {Value : START_MONTH_DESC},
        {Value : END_MONTH_DESC},
        {Value : QUOTE_YEAR},
        {Value : QUOTE_PRICE},
        {Value : SPOT_YEAR},
        {Value : SPOT_PRICE},
        {Value : PNL},
        {Value : EXPOSURE_CURRENCY},
        {Value : TARGET_CURRENCY}
    ]
});
