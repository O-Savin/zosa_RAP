//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel data'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED   //check all this annotations!
//}
define root view entity zosa_travel_u as select from /dmo/travel as Travel

composition [0..*] of zosa_booking_u as _Booking

association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyId = _Agency.AgencyID
association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
     
 {
    key travel_id as TravelID,
    agency_id as AgencyId,
    customer_id as CustomerID,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    @Semantics.user.createdBy: true
    createdby as Createdby,
    @Semantics.systemDateTime.createdAt: true
    createdat as Createdat,
    @Semantics.user.lastChangedBy: true
    lastchangedby as Lastchangedby,
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat as Lastchangedat,
    
    /* associations */
      _Agency,
      _Customer,
      _Currency,
      _Booking
}
