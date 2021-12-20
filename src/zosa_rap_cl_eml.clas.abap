CLASS zosa_rap_cl_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZOSA_RAP_CL_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

***  step 1 - READ
*READ ENTITIES of zosac_travel
*ENTITY Travel
*    from VALUE #( ( TravelUuid = '4BA906C0957986CA170009023A37D89D' ) )
*RESULT data(travels).
*out->write( travels ).
*
*  step 2 - READ with fields

*read ENTITIES OF zosac_travel
*ENTITY Travel
*    FIELDS ( AgencyId CustomerId )
*    with value #( ( TravelUuid = '4BA906C0957986CA170009023A37D89D') )
*RESULT DATA(travels).
*
*out->write( travels ).
*
*
*** step 3 - READ with all fields
*    READ ENTITIES OF zosac_travel
*    ENTITY Travel
*       ALL FIELDS WITH VALUE #( ( TravelUuid = '17A906C0957986CA170009023A37D89D') )
*    RESULT DATA(travels).
*
*    out->write( travels ).
*
** step 4 - READ by Association
*    READ ENTITIES OF zosac_travel
*    ENTITY travel by \_Booking
*       ALL FIELDS WITH VALUE #( ( TravelUuid = '4BA906C0957986CA170009023A37D89D') )
*    RESULT DATA(bookings).
*
*    out->write( bookings ).
* step 5 - Unsuccessful READ
*    READ ENTITIES OF zosac_travel
*    ENTITY travel
*       ALL FIELDS WITH VALUE #( ( TravelUuid = '1111111111111111111') )
*    RESULT DATA(travels)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).
* step 6 - Modify UPDATE

    MODIFY ENTITIES OF zosa_rap_travel
    ENTITY Travel
    UPDATE
        SET FIELDS WITH VALUE
    #( ( TravelUuid = '4BA906C0957986CA170009023A37D89D'
         Description = 'I like RAP' ) )
    FAILED DATA(failed)
    REPORTED DATA(reported).
    out->write( 'update done' ).
    COMMIT ENTITIES
    response of zosac_travel
    failed data(failed_commit)
    reported data(reported_commit).

" step 7 - MODIFY Create
*    MODIFY ENTITIES OF zosac_travel
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF zosac_travel
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

 " step 8 - MODIFY Delete
*    MODIFY ENTITIES OF zosac_travel
*      ENTITY travel
*        DELETE FROM
*          VALUE
*            #( ( TravelUUID  = '4BA906C0957986CA170009023A37D89Dd' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*      RESPONSE OF zosac_travel
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Delete done' ).
*


  ENDMETHOD.
ENDCLASS.
