@AbapCatalog.sqlViewName: 'ZV_HEADER_MR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header view MR'
define root view z_i_header_mrom
  as select from zheader_mrom as Header
  composition [0..*] of z_i_items_mrom as _Items
{
  key id           as Id,
      email        as Email,
      firstname    as Firstname,
      lastname     as Lastname,
      country      as Country,
      createon     as Createon,
      deliverydate as Deliverydate,
      orderstatus  as Orderstatus,
      imageurl     as Imageurl,
      _Items

}
