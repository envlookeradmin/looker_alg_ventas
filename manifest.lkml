project_name: "alg_facturacion"

constant: CONNECTION_NAME {
  value: "envases-eon-alg"
  export: override_required
}

constant: GCP_PROJECT {
  value: "envases-analytics-eon-poc"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "ENVASES_REPORTING"
  export: override_required
}

constant: REPORTING_DATASET1 {
  value: "RPT_ALG"
  export: override_required
  #calendar
}

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
