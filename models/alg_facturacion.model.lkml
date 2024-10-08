#connection: "envases-eon-alg"

connection: "@{CONNECTION_NAME}"

# include all the views
include: "/views/**/*.view.lkml"

# include all the dashboards
include: "/**/*.dashboard"

datagroup: alg_facturacion_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alg_facturacion_default_datagroup

explore: bitacora {}

explore: ventas {
  access_filter: {
    field: ventas.cluster
    user_attribute: alg_cluster
  }
  access_filter: {
    field: ventas.id_planta
    user_attribute: alg_plant
  }

}

explore: ventas_analisis {
  access_filter: {
    field: ventas_analisis.cluster
    user_attribute: alg_cluster
  }
  access_filter: {
    field: ventas_analisis.id_planta
    user_attribute: alg_plant
  }

}
