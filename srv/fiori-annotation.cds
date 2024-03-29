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
    //Adding action on Object Page
    Identification      : [{
        $Type             : 'UI.DataFieldForAction',
        Label             : 'Set as Active',
        Action            : 'CatalogService.EntityContainer/HedgeProfile_setDefault',
        ![@UI.Importance] : #High
    }],
    PresentationVariant : {SortOrder : [{
        Property   : DEFAULT,
        Descending : true
    }]},
    SelectionFields     : [
        PROFILE_NAME,
        EXPOSURE_CURRENCY
    ],
    LineItem            : [
        {
            $Type  : 'UI.DataFieldForAction', //Adding action on List Page
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
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '5rem'}
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
            Value                 : BACKWARD_HORIZON,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : FORWARD_HORIZON,
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
        {Value : EXPOSURE_CURRENCY},
        {Value : MODEL},
        {Value : LAYER1_MIN_PER},
        {Value : LAYER1_MAX_PER},
        {Value : LAYER2_MIN_PER},
        {Value : LAYER2_MAX_PER},
        {Value : LAYER_KEY},
        {Value : FORWARD_HORIZON},
        {Value : BACKWARD_HORIZON},
        //{Value : START_MONTH},
        //{Value : YEAR},
        {Value : WEIGHT_BPL},
        {Value : WEIGHT_MKT_VAL_RATIO},
        {Value : WEIGHT_FORECAT_COMP}


    ]}
}) {
    DEFAULT         @(UI : {Hidden : true});
    DefaultCritical @(UI : {Hidden : true});
};


annotate CatalogService.ActualPosting with @(UI : {
    SelectionFields : [
        PERIOD,
        PLANNING_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {
            Value                 : PERIOD,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : PLANNING_YEAR,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : ACTUAL_AMOUNT,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        }
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
        {
            Value                 : TRANSACTION,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : PERIOD,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : PLANNING_YEAR,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : HEDGED_AMOUNT,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        }
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
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : SPOT,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : ONE_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : TWO_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : THREE_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : FOUR_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : FIVE_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : SIX_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : SEVEN_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : EIGHT_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : NINE_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : TEN_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : ELEVEN_M,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : ONE_Y,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        }
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
        {
            Value                 : PERIOD,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : PLANNING_YEAR,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : EXPOSURE_AMOUNT,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        }
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
        LAYER_KEY,
        BLOCK_KEY_DESC,
        QUOTE_YEAR,
        SPOT_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {Value : LAYER},
        {Value : LAYER_KEY},
        {Value : BLOCK_KEY_DESC},
        {Value : LAYER_SEQUENCE},
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

annotate CatalogService.ActualForecast with @(UI : {
    SelectionFields : [
        PERIOD,
        PLANNING_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {
            Value                 : PERIOD,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : PLANNING_YEAR,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : ACTUAL,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        },
        {
            Value                 : PREDICTED,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        }
    ]
});

annotate CatalogService.ActualForecastRatio with @(UI : {
    SelectionFields : [
        PERIOD,
        PLANNING_YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {
            Value                 : PERIOD,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : PLANNING_YEAR,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : ACTUAL,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        },
        {
            Value                 : RATIO,
            ![@HTML5.CssDefaults] : {width : '8rem'}
        },
        {
            Value                 : PREDICTED,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        }
    ]
});

annotate CatalogService.SpotRateForecast with @(UI : {
    SelectionFields : [
        MONTH,
        TENOR,
        YEAR,
        EXPOSURE_CURRENCY,
        TARGET_CURRENCY
    ],
    LineItem        : [
        {
            Value                 : MONTH,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : YEAR,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TENOR,
            ![@HTML5.CssDefaults] : {width : '5rem'}
        },
        {
            Value                 : EXPOSURE_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : TARGET_CURRENCY,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            Value                 : AVG_SPOT_RATE,
            ![@HTML5.CssDefaults] : {width : '15rem'}
        }
    ]
});
