@AbapCatalog.sqlViewName: 'ZV_ITEMS_MROM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items de Ventas MR'
define view z_i_items_mrom
  as select from zitems_mrom as Items
  association to parent z_i_header_mrom as _Header on $projection.Id = _Header.Id
  {
  key id               as Id,
      name             as Name,
      description      as Description,
      releasedate      as Releasedate,
      discontinueddate as Discontinueddate,
      price            as Price,
      height           as Height,
      width            as Width,
      depth            as Depth,
      quantity         as Quantity,
      unitofmesasure   as Unitofmesasure,
      _Header
}
