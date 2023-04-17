@EndUserText.label: 'Consumption items ventas MR'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity z_c_items_mrom as projection on z_i_items_mrom {
    key Id,
    Name,
    Description,
    Releasedate,
    Discontinueddate,
    Price,
    Height,
    Width,
    Depth,
    Quantity,
    Unitofmesasure,
    /* Associations */
    _Header : redirected to parent z_c_header_mrom
}
