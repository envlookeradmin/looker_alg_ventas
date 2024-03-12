view: cliente {
  derived_table: {
    sql:
       SELECT
      ID_FUENTE,
      CODIGO_CLIENTE,
      ORGANIZACION_VENTAS,
      OFICINA_VENTAS,
      CANAL_DISTRIBUCION,
      SECTOR,
      NOMBRE,
      PAIS,
      CIUDAD,
      GRUPO_CLIENTES
      FROM `envases-analytics-qa.RPT_ALG_MOCK.tbl_alg_dim_cliente`
       ;;
  }


  dimension: id_fuente {
    type: string
    sql: ${TABLE}.ID_FUENTE;;
  }

  dimension: codigo_cliente {
    type: string
    sql: ${TABLE}.CODIGO_CLIENTE ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.ORGANIZACION_VENTAS ;;
  }

  dimension: oficina_ventas {
    type: string
    sql: ${TABLE}.OFICINA_VENTAS ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: ${TABLE}.CANAL_DISTRIBUCION ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}.SECTOR ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.NOMBRE;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.PAIS;;
  }

  dimension: ciudad {
    type: string
    sql: ${TABLE}.CIUDAD ;;
  }

  dimension: grupo_clientes {
    type: string
    sql: ${TABLE}.GRUPO_CLIENTES ;;
  }

}
