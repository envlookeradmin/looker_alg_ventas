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

explore: ventas {
  join: fecha {
    type: left_outer
    sql_on: ${ventas.fecha} = ${fecha.fecha} ;;
    relationship: many_to_one
  }
  join: planta {
    type: left_outer
    sql_on: ${ventas.planta} = ${planta.id_planta}
            and ${ventas.id_fuente} = ${planta.id_fuente} ;;
    relationship: many_to_one
  }
  join: cliente {
    type: left_outer
    sql_on: ${ventas.cliente} = ${cliente.codigo_cliente}
            and ${ventas.id_fuente} = ${cliente.id_fuente}
            and ${ventas.organizacion_ventas} = ${cliente.organizacion_ventas}
            and ${ventas.canal_distribucion} = ${cliente.canal_distribucion};;
    relationship: many_to_one
  }

  join: grupo_cliente {
    type: left_outer
    sql_on: ${cliente.grupo_clientes} = ${grupo_cliente.codigo_grupo}
            and ${cliente.id_fuente} = ${grupo_cliente.id_fuente};;
    relationship: many_to_one
  }

  join: material {
    type: left_outer
    sql_on: ${ventas.material} = ${material.codigo_material}
            and ${ventas.id_fuente} = ${material.id_fuente} ;;
    relationship: many_to_one
  }

  join: grupo_material {
    type: left_outer
    sql_on: ${material.grupo_materiales} = ${grupo_material.codigo_grupo}
            and ${material.id_fuente} = ${grupo_material.id_fuente};;
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
