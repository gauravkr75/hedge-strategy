using T from '../db/data-model';

service CatalogService {
    @readonly
    entity Rates as select from T.RATES;

    @Capabilities : {
        Insertable : true,
        Updatable  : false,
        Deletable  : true
    }
    entity Layer as projection on T.LAYER_YEAR_PNL;
    entity HistoricalCurves as projection on T.HISTORICAL_CURVES;
    action determinePNL(@title : 'Coverage' duration : Integer, @title : 'Layer' layer : Integer) returns String;
    action flushResults() returns String;
}
