namespace T;

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
