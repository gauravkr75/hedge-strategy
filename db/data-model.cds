/* Context T to be used to define database tables */
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
}

/* Context CV to be used to define database tables */
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
}
