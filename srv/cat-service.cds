using T from '../db/data-model';

service CatalogService {
    @readonly entity Rates as select from T.RATES;
    @readonly entity Test as projection on T.PROFIT_LOSS_ALL;
    @readonly entity Layer as projection on T.LAYER_YEAR_PNL;
}