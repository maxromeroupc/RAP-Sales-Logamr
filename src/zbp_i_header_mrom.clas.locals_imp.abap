CLASS lhc_z_i_header_mrom DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR z_i_header_mrom RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_i_header_mrom RESULT result.

    METHODS validateHeader FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_i_header_mrom~validateHeader.

ENDCLASS.

CLASS lhc_z_i_header_mrom IMPLEMENTATION.

  METHOD get_instance_features.

    DATA lv_id TYPE string.
    lv_id = 'header'.

  ENDMETHOD.

  METHOD get_instance_authorizations.

    DATA lv_id TYPE string.
    lv_id = 'header'.

  ENDMETHOD.

  METHOD validateHeader.

    READ ENTITIES OF z_i_header_mrom IN LOCAL MODE
    ENTITY z_i_header_mrom
    FIELDS ( Id Email )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_header).

    LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<ls_header>).
      "Validamos el ID
      IF <ls_header>-Id IS INITIAL.

        APPEND VALUE #( Id = <ls_header>-Id ) TO failed-z_i_header_mrom.

        APPEND VALUE #( Id = <ls_header>-Id
                        %msg = new_message(
                                 id       = 'Z_MC_HEADER_MROM'
                                 number   = '001'
                                 v1 = <ls_header>-Id
                                 v2 = <ls_header>-Email
                                 severity = if_abap_behv_message=>severity-error
                               )
                        %element-Id = if_abap_behv=>mk-on
                        ) TO reported-z_i_header_mrom.
      ENDIF.

      "Validamos el correo
      IF <ls_header>-Email IS INITIAL.
        APPEND VALUE #( Id = <ls_header>-Email ) TO failed-z_i_header_mrom.

        APPEND VALUE #( Id = <ls_header>-Id
                        %msg = new_message(
                                 id       = 'Z_MC_HEADER_MROM'
                                 number   = '002'
                                 v1 = <ls_header>-Id
                                 v2 = <ls_header>-Email
                                 severity = if_abap_behv_message=>severity-error
                               )
                        %element-Email = if_abap_behv=>mk-on
                        ) TO reported-z_i_header_mrom.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
