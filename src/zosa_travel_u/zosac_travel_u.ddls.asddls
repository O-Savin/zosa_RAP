@EndUserText.label: 'Travel data'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZOSAC_TRAVEL_U
  as projection on zosa_travel_u
{

  key TravelID,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
      @Search.defaultSearchElement: true
      AgencyId,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
      @Search.defaultSearchElement: true
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      
      /* Associations */
      //ZI_RAP_TRAVEL_U_####
      _Agency,
      _Booking : redirected to composition child zosac_booking_U,
      _Currency,
      _Customer
}
