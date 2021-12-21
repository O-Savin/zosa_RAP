CLASS zosa_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZOSA_HELLO_WORLD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
out->write( |Hello world version 3 ({ cl_abap_context_info=>get_user_alias(  ) } )| ).


  ENDMETHOD.
ENDCLASS.
