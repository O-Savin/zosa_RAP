@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'travel view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZOSA_RAP_TRAVEL as select from zosa_atrav as Travel 

composition [0..*] of ZOSA_RAP_BOOKING as _Booking

//association [0..1] to /DMO/I_Agency as _agency on $projection.AgencyId = _agency.AgencyID
association [0..1] to zosa_travel_agency as _Agency on $projection.AgencyId = _Agency.AgencyId

association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
    key travel_uuid as TravelUuid,
    travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as TravelStatus,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_changed_at as LastChangedAt,
    local_last_changed_at as LocalLastChangedAt,
    
//    assosiations
_Agency,
_Booking,
_Customer,
_Currency

}
