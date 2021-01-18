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
