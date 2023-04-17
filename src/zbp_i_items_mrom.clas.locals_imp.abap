CLASS lhc_z_i_items_mrom DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR z_i_items_mrom RESULT result.

    METHODS validate_item FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_i_items_mrom~validate_item.

ENDCLASS.

CLASS lhc_z_i_items_mrom IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD validate_item.
    DATA lv_id TYPE string.
    lv_id = 'head'.

    READ ENTITIES OF z_i_header_mrom IN LOCAL MODE
    ENTITY z_i_items_mrom
    FIELDS ( Id )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_items).

    LOOP AT lt_items ASSIGNING FIELD-SYMBOL(<ls_items>).

      IF <ls_items>-Id IS INITIAL.
        APPEND VALUE #( Id = <ls_items>-Id ) TO failed-z_i_items_mrom.

        APPEND VALUE #( Id = <ls_items>-Id
                        %msg = new_message(
                                 id       = 'Z_MC_HEADER_MROM'
                                 number   = '001'
                                 severity = if_abap_behv_message=>severity-error
                               )
                       %element-Id = if_abap_behv=>mk-on

        ) TO reported-z_i_items_mrom.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
