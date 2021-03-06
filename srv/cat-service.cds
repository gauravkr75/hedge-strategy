using {
    T,
    CV
} from '../db/data-model';

service CatalogService {
    //@readonly
    //@Aggregation.ApplySupported.PropertyRestrictions : true
    //entity Rates            as select from T.RATES;

    @Capabilities : {
        Insertable : true,
        Updatable  : false,
        Deletable  : true
    }
    entity Layer        as projection on T.LAYER_YEAR_PNL;

    //entity HistoricalCurves as projection on T.HISTORICAL_CURVES;
    @readonly
    entity LayerSummary as projection on CV.LAYER_SUMMARY_OUT;

    @Aggregation.ApplySupported.PropertyRestrictions : true
    @readonly
    entity Backcasting  as projection on CV.LAYER_PNL_BACKCASTING ;
    @readonly
    entity Forecasting  as projection on CV.LAYER_PNL_FORECASTING;
    @readonly
    entity Existing  as projection on CV.LAYER_PNL_EXISTING;
    action determinePNL(@title : 'Coverage' duration : Integer, @title : 'Layer' layer : Integer) returns String;
    action flushResults() returns String;
}
