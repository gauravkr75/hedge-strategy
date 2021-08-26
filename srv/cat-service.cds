using {
    T,
    CV
} from '../db/data-model';

@requires : 'authenticated-user'
service CatalogService {
    //@readonly
    //@Aggregation.ApplySupported.PropertyRestrictions : true
    //entity Rates            as select from T.RATES;

    @Capabilities : {
        Insertable : true,
        Updatable  : false,
        Deletable  : true
    }
    entity Layer            as projection on T.LAYER_YEAR_PNL;

    @readonly
    entity LayerSummary     as projection on CV.LAYER_SUMMARY_OUT;

    @Aggregation.ApplySupported.PropertyRestrictions : true
    @readonly
    entity Backcasting      as projection on CV.LAYER_PNL_BACKCASTING;

    @readonly
    entity Forecasting      as projection on CV.LAYER_PNL_FORECASTING;

    @readonly
    entity Existing         as projection on CV.LAYER_PNL_EXISTING;

    action determinePNL(@title : 'Coverage' duration : Integer, @title : 'Layer' layer : Integer) returns String;
    action flushResults() returns String;

    @Capabilities : {
        Insertable : true,
        Updatable  : true,
        Deletable  : true
    }
    entity HedgeProfile     as
        select from T.HEDGE_PROFILE {
                @title :                                    'Profile ID'
            key ID,
                PROFILE_NAME                       @mandatory,
                MODEL                              @mandatory,
                LAYER1_MIN_PER                     @mandatory,
                LAYER1_MAX_PER                     @mandatory,
                LAYER2_MIN_PER                     @mandatory,
                LAYER2_MAX_PER                     @mandatory,
                LAYER_KEY                          @mandatory,
                START_MONTH                        @(
                mandatory,
                assert.range : [
                    1,
                    12
                ]
            ),
                YEAR                               @(
                mandatory,
                assert.range : [
                    0001,
                    9999
                ]
            ),
                DEFAULT,
                case
                    when
                        HEDGE_PROFILE.DEFAULT = 'X'
                    then
                        3
                    else
                        0
                end as DefaultCritical : Integer,
                case
                    when
                        HEDGE_PROFILE.DEFAULT = 'X'
                    then
                        'Active'
                    else
                        'Inactive'
                end as DefaultText     : String(10)@title : 'Status'

        } actions {
            action setDefault() returns String;
        }

    entity FileUpload       as projection on T.FILE_UPLOAD;
    entity ActualPosting    as projection on T.ACTUAL_POSTING;
    entity AlreadyHedged    as projection on T.ALREADY_HEDGED;
    entity HistoricalCurves as projection on T.HISTORICAL_CURVES;
    entity ExposurePosition as projection on T.EXPOSURE_POSITION_FLOWS;
}
