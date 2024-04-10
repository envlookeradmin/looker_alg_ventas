connection: "envases-eon-alg"

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

explore: ventas {
  join: fecha {
    type: left_outer
    sql_on: ${ventas.fecha} = ${fecha.fecha} ;;
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
    field: ventas.cluster
    user_attribute: alg_cluster
  }

}
