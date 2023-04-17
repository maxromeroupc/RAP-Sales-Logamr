@EndUserText.label: 'Consuption Header ventas'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity z_c_header_mrom
  as projection on z_i_header_mrom
{
  key Id,
      Email,
      Firstname,
      Lastname,
      Country,
      Createon,
      Deliverydate,
      Orderstatus,
      Imageurl
      ,
      _Items : redirected to composition child z_c_items_mrom 
      
}
