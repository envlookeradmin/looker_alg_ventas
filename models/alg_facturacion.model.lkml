connection: "envases_analytics_qa"

# include all the views
include: "/views/**/*.view.lkml"

# include all the dashboards
#include: "/**/*.dashboard"

datagroup: alg_facturacion_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alg_facturacion_default_datagroup

explore: bitacora {}

explore: d_tc {}

explore: ventas {
  join: fecha {
    type: left_outer
    sql_on: ${ventas.fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }
  join: planta {
    type: left_outer
    sql_on: ${ventas.id_planta} = ${planta.id_planta}
            and ${ventas.id_fuente} = ${planta.id_fuente} ;;
    relationship: many_to_one
  }
  join: cliente {
    type: left_outer
    sql_on: ${ventas.codigo_cliente} = ${cliente.codigo_cliente}
            and ${ventas.id_fuente} = ${cliente.id_fuente}
            and ${ventas.organizacion_ventas} = ${cliente.organizacion_ventas}
            and ${ventas.codigo_canal_distribucion} = ${cliente.codigo_canal_distribucion}
            and ${ventas.division} = ${cliente.division};;
    relationship: many_to_one
  }

  join: grupo_cliente {
    type: left_outer
    sql_on: ${cliente.codigo_grupo_clientes} = ${grupo_cliente.codigo_grupo_clientes}
            and ${cliente.id_fuente} = ${grupo_cliente.id_fuente};;
    relationship: many_to_one
  }

  join: material {
    type: left_outer
    sql_on: ${ventas.codigo_material} = ${material.codigo_material}
            and ${ventas.id_fuente} = ${material.id_fuente} ;;
    relationship: many_to_one
  }

  join: grupo_material {
    type: left_outer
    sql_on: ${material.codigo_grupo_materiales} = ${grupo_material.codigo_grupo_materiales}
            and ${material.id_fuente} = ${grupo_material.id_fuente};;
    relationship: many_to_one
  }

  join: tipo_cambio {
    type: left_outer
    sql_on: ${ventas.moneda_transaccion} = ${tipo_cambio.moneda_origen}
            and ${ventas.moneda_conversion} = ${tipo_cambio.moneda_conversion}
            and ${ventas.tipo_transaccion} = ${tipo_cambio.presupuesto}
            ;;
    relationship: many_to_one
  }

  access_filter: {
    field: planta.cluster
    user_attribute: alg_cluster
  }

  #access_filter: {
  #  field: planta.pais
  #  user_attribute: alg_country
  #}

}
