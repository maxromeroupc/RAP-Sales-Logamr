CLASS zcl_insert_data_mrom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_mrom IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lt_header  TYPE STANDARD TABLE OF zheader_mrom,
          lt_items   TYPE STANDARD TABLE OF zitems_mrom,
          lt_header2 TYPE STANDARD TABLE OF zheader_mrom2.

    DATA: w_header  TYPE zheader_mrom,
          w_items   TYPE zitems_mrom,
          w_header2 TYPE zheader_mrom2.

    CLEAR: w_header, w_items.

    w_header-id = 'head01'.
    w_header-email = 'head01@gmail.com'.
    w_header-firstname = 'Max'.
    w_header-lastname = 'Romero'.
    w_header-country = 'PE'.
    w_header-createon = '20230101'.
    w_header-deliverydate = '20230110'.
    w_header-orderstatus = 1.
    w_header-imageurl = 'head001'.

    APPEND w_header TO lt_header.

    MOVE-CORRESPONDING w_header TO w_header2.
    APPEND w_header2 TO lt_header2.

    w_items-id = 'head02'.
    w_items-name ='Pelota'.
    w_items-description = 'Pelota adidas'.
    w_items-releasedate = '20230101'.
    w_items-discontinueddate = '20230110'.
    w_items-price = 120.
*    w_items-height = 1.
*    w_items-width = 2.
*    w_items-depth = 1.
*    w_items-quantity = 2.
*    w_items-unitofmesasure = 'UN'.

    APPEND w_items TO lt_items.

    "DELETE FROM: zheader_mrom, zitems_mrom, zheader_mrom2.

    "INSERT zheader_mrom FROM TABLE @lt_header.
    "INSERT zheader_mrom2 FROM TABLE @lt_header2.
    INSERT zitems_mrom FROM TABLE @lt_items.



    out->write( 'Realizado' ).

  ENDMETHOD.

ENDCLASS.
