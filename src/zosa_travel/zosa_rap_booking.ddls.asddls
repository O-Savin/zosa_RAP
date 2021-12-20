@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'booking view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZOSA_RAP_BOOKING as select from zosa_abook as Booking
 
association to parent ZOSA_RAP_TRAVEL as _Travel on $projection.TravelUuid = _Travel.TravelUuid

association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association [1..1] to /DMO/I_Carrier as _carrier on $projection.CarrierId = _carrier.AirlineID
association [1..1] to /DMO/I_Connection as _Connection on $projection.ConnectionId = _Connection.ConnectionID
                                                       and $projection.CarrierId = _Connection.AirlineID
association [1..1] to /DMO/I_Flight as _Flight on $projection.CarrierId = _Flight.AirlineID
                                                  and $projection.ConnectionId = _Flight.ConnectionID
                                                  and $projection.FlightDate = _Flight.FlightDate     
association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency

{
key booking_uuid as BookingUuid,
    travel_uuid as TravelUuid,
    booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
     @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    //    assosiations
_Travel,
_carrier,
_Customer,
_Currency,
_Flight,
_Connection 
 }
