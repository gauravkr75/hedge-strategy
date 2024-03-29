/* Context T to be used to define database tables */
using {cuid} from '@sap/cds/common';

context T {

    entity RATES {
        key YEAR          : Integer;
        key MONTH         : String(3);
        key FWD_MONTH     : Integer;
            AVG_SPOT_RATE : Decimal(25, 20);
            QUOTE_PRICE   : Decimal(25, 20);
    }

    entity PROFIT_LOSS_ALL {
        key YEAR               : Integer;
        key FIRST_MONTH_START  : String(20);
        key FIRST_MONTH_END    : String(20);
        key SECOND_MONTH_START : String(20);
        key SECOND_MONTH_END   : String(20);
            FIRST_PROFIT_LOSS  : Decimal(25, 20);
            SECOND_PROFIT_LOSS : Decimal(25, 20);

    }

    entity LAYER_YEAR_PNL {
        key SMART_KEY        : String(20)     @title : 'Smart Key';
        key SIMULATION_ID    : Integer        @title : 'Simulation ID';
        key YEAR             : Integer        @title : 'Year';
        key LAYER            : Integer        @title : 'Layer';
            MONTH_START      : String(20)     @title : 'Month Start';
            MONTH_START_ID   : Integer        @title : 'Month Start ID';
            MONTH_START_DATE : Date           @title : 'Month Start Date';
            MONTH_END        : String(20)     @title : 'Month End';
            MONTH_END_ID     : Integer        @title : 'Month End ID';
            FORWARD_MONTH    : Integer        @title : 'Forward Month';
            MONTH_START_KEY  : String(20)     @title : 'Month Start Key';
            MONTH_END_DATE   : Date           @title : 'Month End Date';
            MONTH_END_KEY    : String(20)     @title : 'Month End Key';
            FORWARD_PRICE    : Decimal(25, 20)@title : 'Forward Price';
            SPOT_PRICE       : Decimal(25, 20)@title : 'Spot Price';
            LAYER_PNL        : Decimal(25, 20)@title : 'Layer PNL';

    }

    entity HISTORICAL_CURVES {
        key ID                : String(36);
            DATE              : Date          @title : 'Date';
            EXPOSURE_CURRENCY : String(05)    @title : 'Exposure Currency';
            TARGET_CURRENCY   : String(05)    @title : 'Target Currency';
            SPOT              : Decimal(25, 5)@title : 'Spot Price';
            ONE_M             : Decimal(25, 5)@title : 'One Month';
            TWO_M             : Decimal(25, 5)@title : 'Two Month';
            THREE_M           : Decimal(25, 5)@title : 'Three Month';
            FOUR_M            : Decimal(25, 5)@title : 'Four Month';
            FIVE_M            : Decimal(25, 5)@title : 'Five Month';
            SIX_M             : Decimal(25, 5)@title : 'Six Month';
            SEVEN_M           : Decimal(25, 5)@title : 'Seven Month';
            EIGHT_M           : Decimal(25, 5)@title : 'Eight Month';
            NINE_M            : Decimal(25, 5)@title : 'Nine Month';
            TEN_M             : Decimal(25, 5)@title : 'Ten Month';
            ELEVEN_M          : Decimal(25, 5)@title : 'Eleven Month';
            ONE_Y             : Decimal(25, 5)@title : 'One Year';
    // EIGHTEEN_M : Decimal(25, 20)@title : 'Eighteen Month';
    // TWO_Y      : Decimal(25, 20)@title : 'Two Year';
    // THREE_Y    : Decimal(25, 20)@title : 'Three Year';
    // FOUR_Y     : Decimal(25, 20)@title : 'Four Year';
    // FIVE_Y     : Decimal(25, 20)@title : 'Five Year';
    }

    entity HISTORICAL_CURVES_WEEK {
        key DATE       : Date           @title : 'Date';
            SPOT       : Decimal(25, 20)@title : 'Spot Price';
            OVERNIGHT  : Decimal(25, 20)@title : 'Overnight';
            WEEK       : Decimal(25, 20)@title : 'Week';
            ONE_M      : Decimal(25, 20)@title : 'One Month';
            TWO_M      : Decimal(25, 20)@title : 'Two Month';
            THREE_M    : Decimal(25, 20)@title : 'Three Month';
            FOUR_M     : Decimal(25, 20)@title : 'Four Month';
            FIVE_M     : Decimal(25, 20)@title : 'Five Month';
            SIX_M      : Decimal(25, 20)@title : 'Six Month';
            SEVEN_M    : Decimal(25, 20)@title : 'Seven Month';
            EIGHT_M    : Decimal(25, 20)@title : 'Eight Month';
            NINE_M     : Decimal(25, 20)@title : 'Nine Month';
            TEN_M      : Decimal(25, 20)@title : 'Ten Month';
            ELEVEN_M   : Decimal(25, 20)@title : 'Eleven Month';
            ONE_Y      : Decimal(25, 20)@title : 'One Year';
            EIGHTEEN_M : Decimal(25, 20)@title : 'Eighteen Month';
            TWO_Y      : Decimal(25, 20)@title : 'Two Year';
            THREE_Y    : Decimal(25, 20)@title : 'Three Year';
            FOUR_Y     : Decimal(25, 20)@title : 'Four Year';
            FIVE_Y     : Decimal(25, 20)@title : 'Five Year';
    }

    entity SPOT_FORECAST_OUT {
        key TYPE      : String(20);
        key TIMESTAMP : Integer;
            VALUE     : Double;
            PI1_LOWER : Double;
            PI1_UPPER : Double;
            PI2_LOWER : Double;
            PI2_UPPER : Double;
    }

    entity TRI_EXP_SMOOTH_PARAMS {
        key ID         : Integer;
            NAME       : String(60);
            INTARGS    : Integer;
            DOUBLEARGS : Double;
            STRINGARGS : String(100);
    }

    entity MONTH_RANGES {
        key MONTH_START     : String(3);
        key MONTH_END       : String(3);
            MONTH_START_NUM : Integer;
            MONTH_END_NUM   : Integer;
            DURATION        : Integer;
    }

    entity LAYER_MONTH_COMBO {
        key LAYER       : Integer;
        key LAYER_KEY   : String(40);
        key BLOCK_KEY   : String(10);
        key RECORD_KEY  : String(10);
            START_MONTH : Integer;
            END_MONTH   : Integer;
            DURATION    : Integer;
    }

    entity SPOT_AND_QUOTE {
        key QUOTE_DATE : Date;
        key TENOR      : String(2);
        key FROM_CURR  : String(5);
        key TO_CURR    : String(5);
            Price      : Decimal(9, 5);
    }

    entity SPOT_RATES {
        key YEAR          : Integer;
        key MONTH         : Integer;
        key TENOR         : Integer;
            AVG_SPOT_RATE : Decimal(9, 5);
    }

    entity LAYER_YEAR_SPOT_QUOTE {
        key LAYER       : Integer;
        key YEAR        : Integer;
        key LAYER_KEY   : String(40);
        key BLOCK_KEY   : String(10);
        key RECORD_KEY  : String(10);
            START_MONTH : Integer;
            END_MONTH   : Integer;
            SPOT_PRICE  : Decimal(9, 5);
            QUOTE_PRICE : Decimal(9, 5);
            PNL         : Decimal(9, 5);
    }

    entity SPOT_QUOTE_WEEKLY {
        key QUOTE_DATE : Date;
        key TENOR      : String(2);
        key FROM_CURR  : String(5);
        key TO_CURR    : String(5);
            Price      : Decimal(9, 5);
    }

    entity SPOT_QUOTE_WEEKLY_FORECAST {
        key QUOTE_DATE : Date;
        key TENOR      : String(2);
        key FROM_CURR  : String(5);
        key TO_CURR    : String(5);
            Price      : Decimal(9, 5);
    }

    entity SPOT_RATES_FORECAST {
        key YEAR          : Integer;
        key MONTH         : Integer;
        key TENOR         : Integer;
            AVG_SPOT_RATE : Decimal(9, 5);
    }

    entity EXISTING_LAYER_HEDGE_COMBO {
        key LAYER       : Integer;
        key LAYER_KEY   : String(40);
        key BLOCK_KEY   : String(10);
        key RECORD_KEY  : String(10);
            START_MONTH : Integer;
            END_MONTH   : Integer;
            DURATION    : Integer;
    }

    entity TWO_LAYER_OVERLAP_COMBO {
        key ID          : Integer;
            LAYER       : Integer;
            LAYER_KEY   : String(40);
            BLOCK_KEY   : String(10);
            RECORD_KEY  : String(10);
            START_MONTH : Integer;
            END_MONTH   : Integer;
            DURATION    : Integer;
    }

    entity LAYER_OVERLAP_ROLLING_COMBO {
        key LAYER       : Integer;
        key LAYER_KEY   : String(40);
        key BLOCK_KEY   : String(10);
        key RECORD_KEY  : String(10);
            START_MONTH : Integer;
            END_MONTH   : Integer;
            DURATION    : Integer;
    }

    entity EXPOSURE_POSITION_FLOWS {
        key ID                : String(36)    @title : 'ID';
            PERIOD            : String(02)    @title : 'Period';
            PLANNING_YEAR     : Integer       @title : 'Planning Year';
            EXPOSURE_CURRENCY : String(05)    @title : 'Exposure Currency';
            TARGET_CURRENCY   : String(05)    @title : 'Target Currency';
            EXPOSURE_AMOUNT   : Decimal(16, 5)@title : 'Exposure Amount';
    }

    entity AUTO_EXP_SMOOTH_STATS {
        key STAT_ID    : Integer64;
            STAT_NAME  : String(100);
            STAT_VALUE : String(100);
    }

    @assert.unique : {Profile : [PROFILE_NAME]}
    entity HEDGE_PROFILE : cuid {
        PROFILE_NAME         : String(30)@title : 'Profile Name';
        MODEL                : String(10)@title : 'Forecast Model';
        LAYER1_MIN_PER       : Integer   @title : 'Layer 1 Min %';
        LAYER1_MAX_PER       : Integer   @title : 'Layer 1 Max %';
        LAYER2_MIN_PER       : Integer   @title : 'Layer 2 Min %';
        LAYER2_MAX_PER       : Integer   @title : 'Layer 2 Max %';
        LAYER_KEY            : String(20)@title : 'Layer Key';
        START_MONTH          : Integer   @title : 'Starting Month';
        YEAR                 : Integer   @title : 'Starting Year';
        DEFAULT              : String(1) @title : 'Default';
        WEIGHT_BPL           : Integer   @title : 'Weightage Best Performing Layer %';
        WEIGHT_MKT_VAL_RATIO : Integer   @title : 'Weightage Market Value Ratio %';
        WEIGHT_FORECAT_COMP  : Integer   @title : 'Weightage Forecast Comparison %';
        EXPOSURE_CURRENCY    : String(5) @title : 'Exposure Currency';
        BACKWARD_HORIZON     : Integer   @title : 'Backward Horizon';
        FORWARD_HORIZON      : Integer   @title : 'Forward Horizon';
    }

    @cds.persistence.skip
    entity FILE_UPLOAD {
        key FILE_NAME       : String(50);
            DATA            : LargeBinary;
            MESSAGE         : String(1000);
            MESSAGE_DETAIL  : LargeString;
            STATUS          : String(1);
            UPLOAD_SCENARIO : String(2);
    }

    entity ACTUAL_POSTING {
        key ID                : String(36)    @title : 'ID';
            PERIOD            : String(02)    @title : 'Period';
            PLANNING_YEAR     : Integer       @title : 'Planning Year';
            EXPOSURE_CURRENCY : String(05)    @title : 'Exposure Currency';
            TARGET_CURRENCY   : String(05)    @title : 'Target Currency';
            ACTUAL_AMOUNT     : Decimal(16, 5)@title : 'Actual Amount';
    }

    entity ALREADY_HEDGED {
        key ID                : String(36)    @title : 'ID';
            TRANSACTION       : String(20)    @title : 'Transaction';
            PERIOD            : String(02)    @title : 'Period';
            PLANNING_YEAR     : Integer       @title : 'Planning Year';
            EXPOSURE_CURRENCY : String(05)    @title : 'Exposure Currency';
            TARGET_CURRENCY   : String(05)    @title : 'Target Currency';
            HEDGED_AMOUNT     : Decimal(16, 5)@title : 'Hedged Amount';
    }

    entity FORECAST_REPORT_PROFILE {
        key ID                   : String(36)@title : 'ID';
            PROFILE_ID           : String(36)@title : 'Hedge Profile ID';
            EXPOSURE_CURRENCY    : String(05)@title : 'Exposure Currency';
            HEDGE_YEAR           : Integer   @title : 'Hedge Year';
            HEDGE_MONTH          : Integer   @title : 'Hedge Month';
            LAYER_SEQUENCE       : String(2) @title : 'Layer Sequence';
            FORWARD_SETTLE_YEAR  : Integer   @title : 'Forward Settlement Year';
            FORWARD_SETTLE_MONTH : Integer   @title : 'Forward Settlement Month';
    }
}

/* Context CV to be used to define Calculation Views */
context CV {

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![LAYER_SUMMARY_OUT]{
        key![LAYER]              : Integer      @title : 'Layer';
        key![LAYER_KEY]          : String(40)   @title : 'Layer Key';
           ![BACKCASTING_PNL]    : Decimal(9, 5)@title : 'Backcasting PNL';
           ![FORECASTING_PNL]    : Decimal(9, 5)@title : 'Forecasting PNL';
           EXISTING_PNL          : Decimal(9, 5)@title : 'Existing PNL';
           RELATIVE_PNL_BACKCAST : Decimal(9, 5)@title : '% Rel. Gain/Loss(Backcast)';
           RELATIVE_PNL_FORECAST : Decimal(9, 5)@title : '% Rel. Gain/Loss(Forecast)';
           //           SOURCE                : String(10)   @title : 'Source';
           NUM_OF_SIMULATIONS    : Integer      @title : 'No. of Simulations';
           RECORD_PROC_COUNT     : Integer      @title : 'Total Records Processed';
           FROM_CURR             : String(5)    @title : 'Currency 2';
           TO_CURR               : String(5)    @title : 'Currency 1';
           LAYER_TEXT            : String(13);
           LAYER_KEY_TEXT        : String(30);
           ToBackcasting         : Association to many LAYER_PNL_BACKCASTING
                                       on  ToBackcasting.LAYER     = LAYER
                                       and ToBackcasting.LAYER_KEY = LAYER_KEY;
           ToForecasting         : Association to many LAYER_PNL_FORECASTING
                                       on  ToForecasting.LAYER     = LAYER
                                       and ToForecasting.LAYER_KEY = LAYER_KEY;
           ToExisting            : Association to many LAYER_PNL_EXISTING
                                       on  ToExisting.LAYER     = 2
                                       and ToExisting.LAYER_KEY = '12_6';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![LAYER_PNL_BACKCASTING]{
        key![LAYER]         : Integer      @title : 'Layer';
        key![LAYER_KEY]     : String(40)   @title : 'Layer Key';
        key![BLOCK_KEY]     : String(10)   @title : 'Block Key';
        key![RECORD_KEY]    : String(10)   @title : 'Record Key';
           ![START_MONTH]   : Integer      @title : 'Start Month Code';
           ![END_MONTH]     : Integer      @title : 'End Month Code';
           ![QUOTE_YEAR]    : Integer      @title : 'Quote Year';
           ![QUOTE_PRICE]   : Decimal(9, 5)@title : 'Quote Price';
           ![SPOT_YEAR]     : Integer      @title : 'Spot Year';
           ![SPOT_PRICE]    : Decimal(9, 5)@title : 'Spot Price';
           ![PNL]           : Decimal(9, 5)@title : 'PNL';
           START_MONTH_DESC : String(20)   @title : 'Start Month';
           END_MONTH_DESC   : String(20)   @title : 'End Month';
           PARENT           : Association to LAYER_SUMMARY_OUT;
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![LAYER_PNL_FORECASTING]{
        key![LAYER]         : Integer      @title : 'Layer';
        key![LAYER_KEY]     : String(40)   @title : 'Layer Key';
        key![BLOCK_KEY]     : String(10)   @title : 'Block Key';
        key![RECORD_KEY]    : String(10)   @title : 'Record Key';
           ![START_MONTH]   : Integer      @title : 'Start Month Code';
           ![END_MONTH]     : Integer      @title : 'End Month Code';
           ![QUOTE_YEAR]    : Integer      @title : 'Quote Year';
           ![QUOTE_PRICE]   : Decimal(9, 5)@title : 'Quote Price';
           ![SPOT_YEAR]     : Integer      @title : 'Spot Year';
           ![SPOT_PRICE]    : Decimal(9, 5)@title : 'Spot Price';
           ![PNL]           : Decimal(9, 5)@title : 'PNL';
           START_MONTH_DESC : String(20)   @title : 'Start Month';
           END_MONTH_DESC   : String(20)   @title : 'End Month';
           PARENT           : Association to LAYER_SUMMARY_OUT;
    }

    @cds.persistence.exists
    entity![LAYER_PNL_EXISTING]{
        key![LAYER]         : Integer      @title : 'Layer';
        key![LAYER_KEY]     : String(40)   @title : 'Layer Key';
        key![BLOCK_KEY]     : String(10)   @title : 'Block Key';
        key![RECORD_KEY]    : String(10)   @title : 'Record Key';
           ![START_MONTH]   : Integer      @title : 'Start Month Code';
           ![END_MONTH]     : Integer      @title : 'End Month Code';
           ![QUOTE_YEAR]    : Integer      @title : 'Quote Year';
           ![QUOTE_PRICE]   : Decimal(9, 5)@title : 'Quote Price';
           ![SPOT_YEAR]     : Integer      @title : 'Spot Year';
           ![SPOT_PRICE]    : Decimal(9, 5)@title : 'Spot Price';
           ![PNL]           : Decimal(9, 5)@title : 'PNL';
           START_MONTH_DESC : String(20)   @title : 'Start Month';
           END_MONTH_DESC   : String(20)   @title : 'End Month';
           PARENT           : Association to LAYER_SUMMARY_OUT;

    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![FORECASTED_EXPOSURE_REPORT](IP_MODEL : String(1), IP_LAYER1_MIN_PER : Integer, IP_LAYER1_MAX_PER : Integer, IP_LAYER2_MIN_PER : Integer, IP_LAYER2_MAX_PER : Integer, IP_LAYER_KEY : String(10), IP_START_MONTH : Integer, IP_YEAR : Integer, IP_EXP_CURRENCY : String(3)) {
        key![HEDGE_YEAR]           : Integer        @title : 'HEDGE_YEAR: HEDGE_YEAR';
        key![HEDGE_MONTH]          : Integer        @title : 'HEDGE_MONTH: HEDGE_MONTH';
        key![FORWARD_SETTLE_YEAR]  : Integer        @title : 'FORWARD_SETTLE_YEAR: FORWARD_SETTLE_YEAR';
        key![FORWARD_SETTLE_MONTH] : Integer        @title : 'FORWARD_SETTLE_MONTH: FORWARD_SETTLE_MONTH';
        key![LAYER_SEQUENCE]       : String(2)      @title : 'LAYER_SEQUENCE: LAYER_SEQUENCE';
           ![LAYER1_PERCENTAGE]    : String(7)      @title : 'LAYER1_PERCENTAGE: LAYER1_PERCENTAGE';
           ![LAYER2_PERCENTAGE]    : String(7)      @title : 'LAYER2_PERCENTAGE: LAYER2_PERCENTAGE';
           ![FORECAST]             : Decimal(34, 10)@title : 'FORECAST: FORECAST';
           ![MIN_VALUE]            : Decimal(34, 10)@title : 'MIN_VALUE: MIN_VALUE';
           ![MAX_VALUE]            : Decimal(34, 10)@title : 'MAX_VALUE: MAX_VALUE';
           ![BPL_PER]              : Decimal(34, 10)@title : 'BPL_PER: BPL_PER';
           ![MKT_VAL_RATIO_PER]    : Decimal(34, 10)@title : 'MKT_VAL_RATIO_PER: MKT_VAL_RATIO_PER';
           ![FORECAST_COMP_PER]    : Decimal(34, 10)@title : 'FORECAST_COMP_PER: FORECAST_COMP_PER';
           ![PROPOSED_PERCENT]     : Decimal(34, 10)@title : 'PROPOSED_PERCENT: PROPOSED_PERCENT';
           ![PROPOSED_VALUE]       : Decimal(34, 10)@title : 'PROPOSED_VALUE: PROPOSED_VALUE';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![LAYER_PNL_OVERLAP_ROLLING]{
        key![LAYER]                : Integer       @title : 'Layer';
        key![LAYER_KEY]            : String(40)    @title : 'Layer Key';
        key![BLOCK_KEY]            : String(10)    @title : 'Period Key';
        key![RECORD_KEY]           : String(10)    @title : 'Record Key';
        key![QUOTE_YEAR]           : Integer       @title : 'Quote Year';
           ![START_MONTH]          : Integer       @title : 'Start Month';
           ![END_MONTH]            : Integer       @title : 'End Month';
           ![QUOTE_PRICE]          : Decimal(25, 5)@title : 'Quote Price';
           ![SPOT_YEAR]            : Integer       @title : 'Spot Year';
           ![SPOT_PRICE]           : Decimal(25, 5)@title : 'Spot Price';
           ![PNL]                  : Decimal(9, 5) @title : 'PNL';
           ![PARENT_LAYER]         : Integer       @title : 'PARENT_LAYER';
           ![PARENT_LAYER_KEY]     : String(40)    @title : 'PARENT_LAYER_KEY';
           ![START_MONTH_DESC]     : String(20)    @title : 'Start Month';
           ![END_MONTH_DESC]       : String(20)    @title : 'End Month';
           ![BLOCK_KEY_START_DESC] : String(13)    @title : 'BLOCK_KEY_START_DESC';
           ![BLOCK_KEY_END_DESC]   : String(13)    @title : 'BLOCK_KEY_END_DESC';
           ![BLOCK_KEY_DESC]       : String(50)    @title : 'Period Description';
           ![EXPOSURE_CURRENCY]    : String(5)     @title : 'Exposure Currency';
           ![TARGET_CURRENCY]      : String(5)     @title : 'Target Currency';
           ![LAYER_SEQUENCE]       : String(3)     @title : 'Layer Sequence';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![TOP_PNL_OVERLAP_ROLLING]{
        key![LAYER]             : Integer      @title : 'Layer';
        key![LAYER_KEY]         : String(40)   @title : 'Layer Key';
           ![PNL]               : Decimal(9, 5)@title : 'PNL';
           ![EXPOSURE_CURRENCY] : String(5)    @title : 'Exposure Currency';
           ![TARGET_CURRENCY]   : String(5)    @title : 'Target Currency';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![FORECAST_EXPOSURE_OUT]{
        key![HEDGE_YEAR]           : Integer       @title : 'Hedge Year';
        key![HEDGE_MONTH]          : Integer       @title : 'Hedge Month';
        key![FORWARD_SETTLE_YEAR]  : Integer       @title : 'Forward Settlement Year';
        key![FORWARD_SETTLE_MONTH] : Integer       @title : 'Forward Settlement Month';
        key![LAYER1_PERCENTAGE]    : String(7)     @title : 'Layer 1 %';
        key![LAYER2_PERCENTAGE]    : String(7)     @title : 'Layer 2 %';
        key![LAYER_SEQUENCE]       : String(2)     @title : 'Layer Sequence';
        key![EXPOSURE_CURRENCY]    : String(5)     @title : 'Exposure Currency';
           ![FORECAST]             : Decimal(34, 2)@title : 'Forecast';
           ![MIN_VALUE]            : Decimal(34, 2)@title : 'Min Value';
           ![MAX_VALUE]            : Decimal(34, 2)@title : 'Max Value';
           ![BPL_PER]              : Decimal(34, 2)@title : 'Best Perf Layer %';
           ![FORECAST_COMP_PER]    : Decimal(34, 2)@title : 'Forecast Comp %';
           ![MKT_VAL_RATIO_PER]    : Decimal(34, 2)@title : 'Market Value Ratio %';
           ![PROPOSED_PERCENT]     : Decimal(34, 2)@title : 'Proposed %';
           ![PROPOSED_VALUE]       : Decimal(34, 2)@title : 'Proposed Value';
           ![HEDGED_AMOUNT]        : Decimal(34, 2)@title : 'Hedged Amount';
           ![DIFF_VALUE]           : Decimal(34, 2)@title : 'Deficit';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![ACTUAL_FORECASTING]{
        key![PERIOD]            : Integer       @title : 'Period';
        key![PLANNING_YEAR]     : Integer       @title : 'Planning Year';
        key![TARGET_CURRENCY]   : String(5)     @title : 'Target Currency';
        key![EXPOSURE_CURRENCY] : String(5)     @title : 'Exposure Currency';
           ![MSE]               : String(100)   @title : 'MSE';
           ![DAMPED]            : String(100)   @title : 'Damped';
           ![MODELNAME]         : String(100)   @title : 'Model Name';
           ![FORECASTED]        : Decimal(16, 5)@title : 'Forecasted';
           ![PREDICTED]         : Boolean       @title : 'Predicted';
           ![ACTUAL]            : Decimal(16, 5)@title : 'Actual';
           ![PHI]               : String(100)   @title : 'PHI';
           ![BETA]              : String(100)   @title : 'BETA';
           ![ALPHA]             : String(100)   @title : 'ALPHA';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![ACTUAL_FORECASTING_WITH_RATIO]{
        key![PERIOD]            : Integer       @title : 'Period';
        key![PLANNING_YEAR]     : Integer       @title : 'Planning Year';
        key![TARGET_CURRENCY]   : String(5)     @title : 'Target Currency';
        key![EXPOSURE_CURRENCY] : String(5)     @title : 'Exposure Currency';
           ![RATIO]             : Decimal(34, 5)@title : 'Ratio';
           ![MSE]               : String(100)   @title : 'MSE';
           ![DAMPED]            : String(100)   @title : 'Damped';
           ![MODELNAME]         : String(100)   @title : 'Model Name';
           ![FORECASTED]        : Decimal(16, 5)@title : 'Forecasted';
           ![PREDICTED]         : Boolean       @title : 'Predicted';
           ![ACTUAL]            : Decimal(16, 5)@title : 'Actual Amount';
           ![PHI]               : String(100)   @title : 'PHI';
           ![BETA]              : String(100)   @title : 'BETA';
           ![ALPHA]             : String(100)   @title : 'ALPHA';
    }

    @cds.persistence.exists
    @cds.persistence.calcview
    entity![SPOT_RATES_FORECAST]{
        key![MONTH]             : Integer      @title : 'Month';
        key![TENOR]             : Integer      @title : 'Tenor';
        key![YEAR]              : Integer      @title : 'Year';
        key![TARGET_CURRENCY]   : String(5)    @title : 'Target Currency';
        key![EXPOSURE_CURRENCY] : String(5)    @title : 'Exposure Currency';
           ![AVG_SPOT_RATE]     : Decimal(9, 5)@title : 'Spot Rate';
    }
}
