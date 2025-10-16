view: ventas_historico {

  derived_table: {
    sql:
      SELECT
      *
      FROM `@{GCP_PROJECT_QA}.@{REPORTING_DATASET1}.Fact_Ventas_Historico` h
      WHERE EXTRACT(YEAR FROM Fecha) <= 2024
      AND filtro = FALSE
      UNION ALL
      SELECT
      '' AS IDFuente,
      Mercado AS Tipo,
      '' AS OrganizacionVentas,
      Fecha,
      '' AS CodigoPlanta,
      '' AS NombrePlanta,
      '' AS PaisPlanta,
      CASE WHEN Cluster LIKE 'EC%' THEN 'Europa' ELSE 'Americas' END AS Region,
      Cluster,
      MasterCategory,
      '' AS CategoriaGlobal,
      '' AS Categoria,
      '' AS GrupoMaterial,
      '' AS DescripcionGrupoMat,
      '' AS CodigoCliente,
      '' AS NombreCliente,
      '' AS PaisCliente,
      '' AS CodigoDestinatario,
      '' AS NombreDestinatario,
      '' AS PaisDestinatario,
      CanalDistribucion,
      '' AS UnidadBase,
      '' AS MonedaTransaccion,
      0 AS TipoCambioMXN,
      0 AS TipoCambioUSD,
      0 AS TipoCambioEUR,
      0 AS TipoCambioDKK,
      Cantidad,
      0 ImporteNeto,
      null AS filtro
      FROM `@{GCP_PROJECT_QA}.@{REPORTING_DATASET}.Mercado_ALG`
      WHERE EXTRACT(YEAR FROM Fecha) <= 2024
      ;;
  }

  dimension: id_fuente {
    type: string
    label: "Fuente"
    sql: ${TABLE}.IDFuente ;;
  }

  dimension: tipo {
    type: string
    label: "Tipo Transacción"
    sql: ${TABLE}.Tipo ;;
  }

  dimension: organizacion_ventas {
    type: string
    label: "Organización Ventas"
    sql: ${TABLE}.OrganizacionVentas ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: codigo_planta {
    type: string
    group_label: "Planta"
    label: "Codigo Planta"
    sql: ${TABLE}.CodigoPlanta ;;
  }

  dimension: nombre_planta {
    type: string
    group_label: "Planta"
    label: "Planta"
    sql: ${TABLE}.NombrePlanta ;;
  }

  dimension: pais_planta {
    type: string
    group_label: "Planta"
    label: "Pais Planta"
    sql: ${TABLE}.PaisPlanta ;;
  }

  dimension: region {
    type: string
    group_label: "Planta"
    sql: ${TABLE}.Region ;;
  }

  dimension: cluster {
    type: string
    group_label: "Planta"
    sql: ${TABLE}.Cluster ;;
  }

  dimension: master_category {
    type: string
    group_label: "Categoria"
    label: "Master Category"
    sql: ${TABLE}.MasterCategory ;;
  }

  dimension: categoria_global {
    type: string
    group_label: "Categoria"
    label: "Categoria Global"
    sql: ${TABLE}.CategoriaGlobal ;;
  }

  dimension: categoria {
    type: string
    group_label: "Categoria"
    label: "Categoria"
    sql: ${TABLE}.Categoria ;;
  }

  dimension: grupo_material {
    type: string
    group_label: "Grupo Material"
    label: "Grupo Material"
    sql: ${TABLE}.GrupoMaterial ;;
  }

  dimension: desc_grupo_material {
    type: string
    group_label: "Grupo Material"
    label: "Descripción Grupo Material"
    sql: ${TABLE}.DescripcionGrupoMat ;;
  }

  dimension: codigo_cliente {
    type: string
    group_label: "Cliente"
    label: "Cliente"
    sql: ${TABLE}.CodigoCliente ;;
  }

  dimension: nombre_cliente {
    type: string
    group_label: "Cliente"
    label: "Nombre Cliente"
    sql: ${TABLE}.NombreCliente ;;
  }

  dimension: pais_cliente {
    type: string
    group_label: "Cliente"
    label: "Pais Cliente"
    sql: ${TABLE}.PaisCliente ;;
  }

  dimension: codigo_destinatario {
    type: string
    group_label: "Destinatario"
    label: "Destinatario"
    sql: ${TABLE}.CodigoDestinatario ;;
  }

  dimension: nombre_destinatario {
    type: string
    group_label: "Destinatario"
    label: "Nombre Destinatario"
    sql: ${TABLE}.NombreDestinatario ;;
  }

  dimension: pais_destinatario {
    type: string
    group_label: "Destinatario"
    label: "Pais Destinatario"
    sql: ${TABLE}.PaisDestinatario ;;
  }

  dimension: canal_distribucion {
    type: string
    label: "Canal Distribución"
    sql: ${TABLE}.CanalDistribucion ;;
  }

  dimension: unidad_base {
    type: string
    label: "Unidad Base"
    sql: ${TABLE}.UnidadBase ;;
  }

  dimension: moneda_transaccion {
    type: string
    label: "Moneda Transacción"
    sql: ${TABLE}.MonedaTransaccion ;;
  }

  dimension: tipo_cambio_mxn {
    type: string
    group_label: "Tipos cambio"
    label: "Tipo Cambio MXN"
    sql: ${TABLE}.TipoCambioMXN ;;
  }

  dimension: tipo_cambio_usd {
    type: string
    group_label: "Tipos cambio"
    label: "Tipo Cambio USD"
    sql: ${TABLE}.TipoCambioUSD ;;
  }

  dimension: tipo_cambio_eur {
    type: string
    group_label: "Tipos cambio"
    label: "Tipo Cambio EUR"
    sql: ${TABLE}.TipoCambioEUR ;;
  }

  dimension: tipo_cambio_dkk {
    type: string
    group_label: "Tipos cambio"
    label: "Tipo Cambio DKK"
    sql: ${TABLE}.TipoCambioDKK ;;
  }

  dimension: cantidad_facturada {
    type: number
    hidden: yes
    sql: ${TABLE}.CantidadFacturada / 1000 ;;
  }

  dimension: importe_neto {
    type: number
    hidden: yes
    sql: ${TABLE}.ImporteNeto / 1000 ;;
  }

  measure: cantidad {
    type: sum
    label: "Cantidad Facturada"
    sql:${cantidad_facturada}  ;;

    filters: [tipo: "Venta"]
    value_format_name: decimal_0
  }

  measure: monto_moneda_original {
    type: sum
    group_label: "Montos"
    label: "Monto Moneda Original"
    sql:${importe_neto}  ;;

    filters: [tipo: "Venta"]
    value_format_name: decimal_0
  }

  measure: monto_mxn {
    type: sum
    group_label: "Montos"
    label: "Monto MXN"
    sql:${importe_neto} * ${tipo_cambio_mxn} ;;

    filters: [tipo: "Venta"]
    value_format_name: decimal_0
  }

  measure: monto_usd {
    type: sum
    group_label: "Montos"
    label: "Monto USD"
    sql:${importe_neto} * ${tipo_cambio_usd} ;;

    filters: [tipo: "Venta"]
    value_format_name: decimal_0
  }

  measure: monto_eur {
    type: sum
    group_label: "Montos"
    label: "Monto EUR"
    sql:${importe_neto} * ${tipo_cambio_eur} ;;

    filters: [tipo: "Venta"]
    value_format_name: decimal_0
  }

  measure: monto_dkk {
    type: sum
    group_label: "Montos"
    label: "Monto DKK"
    sql:${importe_neto} * ${tipo_cambio_dkk} ;;

    filters: [tipo: "Venta"]
    value_format_name: decimal_0
  }

  measure: cantidad_mercado {
    type: sum
    label: "Cantidad Mercado"
    sql:${cantidad_facturada}  ;;

    filters: [tipo: "Mercado"]
    value_format_name: decimal_0
  }
  #Métricas especiales para USA
  dimension: is_ohio {
    type: yesno
    hidden: yes
    sql: ${codigo_planta} in ('9520', '9521') ;;
  }

  measure: cantidad_Ohio {
    type: sum
    label: "Cantidad Ohio"
    group_label: "Metricas USA"
    sql:${cantidad_facturada}  ;;

    filters: [tipo: "Venta", is_ohio: "yes"]
    value_format_name: decimal_0
  }
  measure: cantidad_mx {
    type: sum
    label: "Cantidad MX"
    group_label: "Metricas USA"
    sql:${cantidad_facturada}  ;;

    filters: [tipo: "Venta", is_ohio: "no", cluster: "USA"]
    value_format_name: decimal_0
  }
}
