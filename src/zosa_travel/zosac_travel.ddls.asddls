@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true



define root view entity ZOSAC_TRAVEL as projection on ZOSA_RAP_TRAVEL as Travel

 {
    key TravelUuid,
    @Search.defaultSearchElement: true
    TravelId,
    @Search.defaultSearchElement: true
//    @ObjectModel.text.element: ['AgencyName']
//    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]
    @Consumption.valueHelpDefinition: [{ entity: { name: 'zosa_travel_agency', element: 'AgencyID' } }]
    AgencyId,
//    _agency.Name as AgencyName,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_customer', element: 'CustomerID' } }]
    CustomerId,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ entity: {name: 'I_currency', element: 'Currency' }}]
    CurrencyCode,
    Description,
    TravelStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child zosac_booking,
    _Currency,
    _Customer
}
