view: ventas {

  derived_table: {
    sql:
      SELECT
      ID_Fuente,
      Tipo_Transaccion,
      Fecha,
      Canal_Distribucion,
      Material,
      Descripcion_Material,
      Grupo_Material,
      Descripcion_Grupo_Material,
      Jerarquia,
      Dimensiones,
      Planta,
      Nombre_Planta,
      Ciudad,
      Pais,
      Cluster,
      Region,
      Cliente,
      Nombre_Cliente,
      Pais_Cliente,
      Ciudad_Cliente,
      Grupo_Cliente,
      Destinatario,
      Nombre_Destinatario,
      Pais_Destinatario,
      Ciudad_Destinatario,
      Organizacion_Ventas,
      Division,
      Unidad_Base,
      Categoria,
      SubCategoria,
      Moneda_Transaccion,
      '' AS Moneda_Conversion,
      1 AS Bandera_Resumen,
      0 AS Bandera_Total,
      Orden,
      Cantidad,
      Monto_MXN,
      Monto AS Monto_Transaccion
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET1}.Fact_Ventas_Columnar`
      ;;
  }

  dimension: orden {
    type: string
    sql: ${TABLE}.Orden ;;
  }

  dimension: id_fuente {
    hidden: yes
    type: string
    sql: ${TABLE}.ID_Fuente ;;
  }

  dimension: documento {
    hidden: yes
    type: string
    sql: ${TABLE}.Documento ;;
  }

  dimension: posicion {
    hidden: yes
    type: string
    sql: ${TABLE}.Posicion ;;
  }

  dimension: tipo_transaccion {
    type: string
    sql: ${TABLE}.Tipo_Transaccion ;;
  }

  dimension: tipo_documento {
    hidden: yes
    type: string
    sql: ${TABLE}.Tipo_Documento ;;
  }

  dimension: fecha {
    #hidden: yes
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: codigo_canal_distribucion {
    hidden: yes
    type: string
    sql: ${TABLE}.Canal_Distribucion ;;
  }

  dimension: canal_distribucion {
    type: string
    sql: CASE
          WHEN ${TABLE}.Canal_Distribucion IN ('00','10','50','80') THEN 'Nacional'
          ELSE 'Exportacion'
          END ;;
  }

  dimension: codigo_material {
    group_label: "Material"
    hidden: yes
    type: string
    sql: ${TABLE}.Material ;;
  }

  dimension: descripcion_material {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Descripcion_Material ;;
  }

  dimension: grupo_material {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Grupo_Material ;;
  }

  dimension: descripcion_grupo_material {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Descripcion_Grupo_Material ;;
  }

  dimension: jerarquia {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Jerarquia ;;
  }

  dimension: dimensiones {
    group_label: "Material"
    type: string
    sql: ${TABLE}.Dimensiones ;;
  }

  dimension: id_planta {
    group_label: "Planta"
    hidden: yes
    type: string
    sql: ${TABLE}.Planta ;;
  }

  dimension: nombre_planta {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Nombre_Planta ;;
  }

  dimension: ciudad {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Ciudad ;;
  }

  dimension: pais {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: cluster {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Cluster ;;
  }

  dimension: region {
    group_label: "Planta"
    type: string
    sql: ${TABLE}.Region ;;
  }


  dimension: codigo_cliente {
    group_label: "Cliente"
    hidden: yes
    type: string
    sql: ${TABLE}.Cliente ;;
  }

  dimension: nombre_cliente {
    group_label: "Cliente"
    type: string
    label: "CLIENT"
    sql: ${TABLE}.Nombre_Cliente ;;
  }

  dimension: pais_cliente {
    group_label: "Cliente"
    type: string
    sql: ${TABLE}.Pais_Cliente ;;
  }

  dimension: ciudad_cliente {
    group_label: "Cliente"
    type: string
    sql: ${TABLE}.Ciudad_Cliente ;;
  }

  dimension: grupo_cliente {
    group_label: "Cliente"
    type: string
    sql: ${TABLE}.Grupo_Cliente ;;
  }

  dimension: destinatario {
    group_label: "Destinatario"
    hidden: yes
    type: string
    sql: ${TABLE}.Destinatario ;;
  }

  dimension: nombre_destinatario {
    group_label: "Destinatario"
    type: string
    sql: ${TABLE}.Nombre_Destinatario ;;
  }

  dimension: pais_destinatario {
    group_label: "Destinatario"
    type: string
    sql: ${TABLE}.Pais_Destinatario ;;
  }

  dimension: ciudad_destinatario {
    group_label: "Destinatario"
    type: string
    sql: ${TABLE}.Ciudad_Destinatario ;;
  }

  dimension: organizacion_ventas {
    type: string
    sql: ${TABLE}.Organizacion_Ventas ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.Division ;;
  }

  dimension: unidad_base {
    type: string
    sql: ${TABLE}.Unidad_Base ;;
  }

  dimension: bandera_resumen {
    type: number
    sql: ${TABLE}.Bandera_Resumen ;;
  }

  dimension: bandera_total {
    type: number
    sql: ${TABLE}.Bandera_Total ;;
  }

  dimension: cluster_resumen {
    label: "CLUSTER"
    type: string
    sql: CASE
           WHEN ${categoria} = 'SUBTOTAL USD' THEN 'SUB America (USD)'
           WHEN ${categoria} = 'SUBTOTAL EUR' THEN 'SUB Europa (EUR)'
           WHEN ${categoria} = 'TOTAL USD' THEN 'TOTAL USD'
           WHEN ${cluster} = 'Mexico' THEN 'Mexico (MXN)'
           WHEN ${cluster} = 'USA' THEN 'USA (USD)'
           WHEN ${cluster} = 'Canada' THEN 'Canada (CAD)'
           WHEN ${cluster} = 'Guatemala' THEN 'Guatemala (GTQ)'
           WHEN ${cluster} = 'ECN - North' THEN 'ECN - North (DKK)'
           WHEN ${cluster} = 'ECC - Central' THEN 'ECC - Central (EUR)'
           WHEN ${cluster} = 'ECW - West' THEN 'ECW - West (EUR)'
           WHEN ${cluster} = 'ECS - South' THEN 'ECS - South (EUR)'
         END ;;

    html: {% if value == 'TOTAL MXN' or
          value == 'TOTAL USD' or
          value == 'TOTAL EUR'
          %}
          <p style="color: white; background-color: #5e2129; font-size:100%; text-align:left">{{ rendered_value }}</p>
          {% elsif value == 'SUB America (USD)' or
            value == 'SUB Europa (EUR)'
            %}
          <p style="color: white; background-color: #ab716f; font-size:100%; text-align:left">{{ rendered_value }}</p>
          {% else %}
          <p style="">{{ rendered_value }}</p>
          {% endif %} ;;

    order_by_field: orden_cluster_resumen
  }

  dimension: orden_cluster_resumen {
    type: string
    sql: CASE
           WHEN ${categoria} = 'SUBTOTAL USD' THEN 'A05'
           WHEN ${categoria} = 'SUBTOTAL EUR' THEN 'A10'
           WHEN ${categoria} = 'TOTAL USD' THEN 'Z10'
           WHEN ${cluster} = 'Mexico' THEN 'A01'
           WHEN ${cluster} = 'USA' THEN 'A02'
           WHEN ${cluster} = 'Canada' THEN 'A03'
           WHEN ${cluster} = 'Guatemala' THEN 'A04'
           WHEN ${cluster} = 'ECN - North' THEN 'A06'
           WHEN ${cluster} = 'ECC - Central' THEN 'A07'
           WHEN ${cluster} = 'ECW - West' THEN 'A08'
           WHEN ${cluster} = 'ECS - South' THEN 'A09'
         END ;;
  }

  dimension: categoria {
    label: "CATEGORY"
    type: string
    sql: ${TABLE}.Categoria ;;

    html: {% if value == 'TOTAL LOCAL USD' or
          value == 'TOTAL LOCAL DKK' or
          value == 'TOTAL LOCAL EUR' or
          value == 'TOTAL LOCAL GTQ' or
          value == 'TOTAL LOCAL CAD' or
          value == 'TOTAL MXN' or
          value == 'TOTAL USD' or
          value == 'TOTAL EUR'
          %}
        <p style="color: white; background-color: #5e2129; font-size:100%; text-align:left">{{ rendered_value }}</p>

      {% elsif
      value != 'CP 19L' and
      value != 'CP 15L' and
      value != 'CP 10L' and
      value != 'CP 08L' and
      value != 'CP 04L' and

      value != 'Club (Alu)' and
      value != 'Club (Steel)' and
      value != 'Hansa' and
      value != 'Dingley' and
      value != 'Round Fish' and
      value != 'Fish - Other' and
      value != 'Draught Kegs' and
      value != 'Gravity Kegs' and
      value != 'Beverage Miscellaneous' and
      value != 'Tin Cans' and
      value != 'Vacuum Ink' and
      value != 'Pails' and
      value != 'Hobbocks' and
      value != 'Square' and
      value != 'Miscellaneous' and
      value != 'Plastic' and
      value != 'Industrial - Others' and

      value != 'Fish - 1/2 Oval' and
      value != 'Fish - 1/4 Oval' and
      value != 'Fish - 127' and
      value != 'Fish - 150' and
      value != 'Fish - 153' and
      value != 'Fish - 65' and
      value != 'Fish - 73' and
      value != 'Fish - 83' and
      value != 'Fish - 99' and
      value != 'Fish - Anchoas' and
      value != 'Fish - Club' and
      value != 'Fish - Goods for Resale' and
      value != 'Fish - Others' and
      value != 'Fish - Pails' and
      value != 'Fish - RR90' and

      value != 'Vegetables - 153' and
      value != 'Vegetables - 65' and
      value != 'Vegetables - 73' and
      value != 'Vegetables - 83' and
      value != 'Vegetables - 99' and
      value != 'Vegetables - Club' and
      value != 'Vegetables - Goods for Resale' and
      value != 'Vegetables - Others' and

      value != 'Industrial - 73' and
      value != 'Industrial - 99' and
      value != 'Industrial - General Line' and
      value != 'Industrial - Goods for Resale' and
      value != 'Industrial - Others' and
      value != 'Industrial - Pails' and

      value != 'Print and Coating Services - Goods for Resale' and
      value != 'Print and Coating Services - Others' and
      value != 'Print and Coating Services - Pails'

      %}
      <p style="color: black; font-weight: bold; font-size:100%; text-align:left">{{ rendered_value }}</p>

      {% else %}
      <p style="">{{ rendered_value }}</p>
      {% endif %} ;;

    order_by_field: orden_categoria
  }

  dimension: orden_categoria {
    type: string

    sql: --${TABLE}.Orden|| ${cluster} || ${categoria}
    --SUBSTRING(${TABLE}.Orden,2,2) || ${cluster}
      case
      when ${cluster} = 'Mexico' then
        case
          when ${TABLE}.Categoria="Cubeta de Plastico" AND ${TABLE}.SubCategoria="CP 19L" then "A01"
          when ${TABLE}.Categoria="Cubeta de Plastico" AND ${TABLE}.SubCategoria="CP 15L" then "A02"
          when ${TABLE}.Categoria="Cubeta de Plastico" AND ${TABLE}.SubCategoria="CP 10L" then "A03"
          when ${TABLE}.Categoria="Cubeta de Plastico" AND ${TABLE}.SubCategoria="CP 08L" then "A04"
          when ${TABLE}.Categoria="Cubeta de Plastico" AND ${TABLE}.SubCategoria="CP 04L" then "A05"

          when ${TABLE}.Categoria="Porron de Plastico" then "A07"
          when ${TABLE}.Categoria="Tambores de Plastico" then "A08"
          when ${TABLE}.Categoria="Bote Bocan" then "A09"
          when ${TABLE}.Categoria="Tambores" then "A10"
          when ${TABLE}.Categoria="Tambores Conicos" then "A11"
          when ${TABLE}.Categoria="Cubeta de Lamina" then "A12"
          when ${TABLE}.Categoria="Alcoholero" then "A13"
          when ${TABLE}.Categoria="Bote de Pintura" then "A14"
          when ${TABLE}.Categoria="Bote de Aerosol" then "A15"
          when ${TABLE}.Categoria="Línea General" then "A16"
          when ${TABLE}.Categoria="Bote Sanitario" then "A17"
          when ${TABLE}.Categoria="Bote Atun" then "A18"
          when ${TABLE}.Categoria="Bote Oval" then "A19"
          when ${TABLE}.Categoria="Tapa Easy Open" then "A20"
          when ${TABLE}.Categoria="Fondo Charola y Bafle" then "A21"
          when ${TABLE}.Categoria="Tapa Twiss Off" then "A22"
          when ${TABLE}.Categoria="Varios" then "A23"
          when ${TABLE}.Categoria="Fish." then "A24"
          when ${TABLE}.Categoria="PeelOff" then "A25"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"
      end

      when ${cluster} = 'USA' then
      case
          when ${TABLE}.Categoria="Bote Pint. Envases Ohio" then "A01"
          when ${TABLE}.Categoria="Cub.Lam. Envases Ohio" then "A02"
          when ${TABLE}.Categoria="F-style" then "A03"
          when ${TABLE}.Categoria="Varios." then "A04"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"

      end

      when ${cluster} = 'ECN - North' then

      case
          when ${TABLE}.Categoria="Mediapack" then "a01"
          when ${TABLE}.Categoria="Catering" then "a02"

          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Club (Alu)" then "a03"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Club (Steel)" then "a04"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Hansa" then "a05"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Dingley" then "a06"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Round Fish" then "a07"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Other" then "a08"

          when ${TABLE}.Categoria="Ham" then "a10"
          when ${TABLE}.Categoria="Luncheon" then "a11"
          when ${TABLE}.Categoria="Pullman" then "a12"
          when ${TABLE}.Categoria="Roundfood" then "a13"
          when ${TABLE}.Categoria="Beverage" then "a14"
          when ${TABLE}.Categoria="Cookie" then "a15"
          when ${TABLE}.Categoria="Feta" then "a16"
          when ${TABLE}.Categoria="Milkpowder" then "a17"
          when ${TABLE}.Categoria="PockIt" then "a18"
          when ${TABLE}.Categoria="PeelOff" then "a19"
          when ${TABLE}.Categoria="Super" then "a20"
          when ${TABLE}.Categoria="Cookie" then "a21"
          when ${TABLE}.Categoria="Other" then "a22"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"
      end

      when ${cluster} = 'ECC - Central' then

      case

          when ${TABLE}.Categoria="Beverage" and ${TABLE}.SubCategoria="Draught Kegs" then "a01"
          when ${TABLE}.Categoria="Beverage" and ${TABLE}.SubCategoria="Gravity Kegs" then "a02"
          when ${TABLE}.Categoria="Beverage" and ${TABLE}.SubCategoria="Beverage Miscellaneous" then "a03"
          --when ${TABLE}.Categoria="Beverage" then "a04"

          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Tin Cans" then "a05"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Vacuum Ink" then "a06"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Pails" then "a07"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Hobbocks" then "a08"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Square" then "a09"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Miscellaneous" then "a10"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Plastic" then "a11"
          when ${TABLE}.Categoria="Industrial" and ${TABLE}.SubCategoria="Industrial - Others" then "a12"

          when ${TABLE}.Categoria="SC Print" then "a14"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"
      end

      when ${cluster} = "ECS - South" then

      case
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 1/2 Oval" then "a01"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 1/4 Oval" then "a02"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 127" then "a03"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 150" then "a04"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 153" then "a05"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 65" then "a06"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 73" then "a07"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 83" then "a08"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - 99" then "a09"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - Anchoas" then "a10"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - Club" then "a11"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - Goods for Resale" then "a12"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - Others" then "a13"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - Pails" then "a14"
          when ${TABLE}.Categoria="Fish" AND ${TABLE}.SubCategoria="Fish - RR90" then "a15"
          --when ${TABLE}.Categoria="Fish" then "a16"

          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - 153" then "a17"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - 65" then "a18"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - 73" then "a19"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - 83" then "a20"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - 99" then "a21"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - Club" then "a22"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - Goods for Resale" then "a23"
          when ${TABLE}.Categoria="Vegetables" AND ${TABLE}.SubCategoria="Vegetables - Others" then "a24"
          --when ${TABLE}.Categoria="Vegetables" then "a25"

          when ${TABLE}.Categoria="Industrial" AND ${TABLE}.SubCategoria="Industrial - 73" then "a26"
          when ${TABLE}.Categoria="Industrial" AND ${TABLE}.SubCategoria="Industrial - 99" then "a27"
          when ${TABLE}.Categoria="Industrial" AND ${TABLE}.SubCategoria="Industrial - General Line" then "a28"
          when ${TABLE}.Categoria="Industrial" AND ${TABLE}.SubCategoria="Industrial - Goods for Resale" then "a29"
          when ${TABLE}.Categoria="Industrial" AND ${TABLE}.SubCategoria="Industrial - Others" then "a30"
          when ${TABLE}.Categoria="Industrial" AND ${TABLE}.SubCategoria="Industrial - Pails" then "a31"
          --when ${TABLE}.Categoria="Industrial" then "a32"

          when ${TABLE}.Categoria="Print and Coating Services" AND ${TABLE}.SubCategoria="Print and Coating Services - Goods for Resale" then "a33"
          when ${TABLE}.Categoria="Print and Coating Services" AND ${TABLE}.SubCategoria="Print and Coating Services - Others" then "a34"
          when ${TABLE}.Categoria="Print and Coating Services" AND ${TABLE}.SubCategoria="Print and Coating Services - Pails" then "a35"
          --when ${TABLE}.Categoria="Print and Coating Services" then "a36"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"

      end

      when ${cluster} = "ECW - West" then

      case
          when ${TABLE}.Categoria="Coating and Printing Services" then "a01"
          when ${TABLE}.Categoria="Tin cans and closures for tin cans" then "a02"
          when ${TABLE}.Categoria="Vegetables" then "a03"
          when ${TABLE}.Categoria="Industrial" then "a04"
          when ${TABLE}.Categoria="Miscelaneous" then "a05"
          when ${TABLE}.Categoria="Pails and lids for pails" then "a06"

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"

      end

          when ${TABLE}.Categoria LIKE "TOTAL LOCAL%" then "Z01"
          when ${TABLE}.Categoria="TOTAL MXN" then "Z02"
          when ${TABLE}.Categoria="TOTAL USD" then "Z03"
          when ${TABLE}.Categoria="TOTAL EUR" then "Z04"

      end
      ;;

  }

  dimension: subcategoria {
    label: "SUBCATEGORY"
    type: string
    sql: ${TABLE}.SubCategoria ;;

    #order_by_field: orden_subcategoria
  }


  dimension: orden_subcategoria {
    type: string
    sql: SUBSTRING(${TABLE}.Orden,4,3) || ${cluster} || ${categoria}
      ;;
  }


  dimension: moneda_transaccion {
    type: string
    sql: ${TABLE}.Moneda_Transaccion ;;
  }

  dimension: moneda_conversion {
    type: string
    sql: ${TABLE}.Moneda_Conversion ;;
  }

  dimension: FCURR {
    label: "CURRENCY TYPE"
    type: string
    sql: ${tipo_cambio.moneda_origen} ;;
  }

  dimension: cantidad {
    hidden: yes
    type: number
    sql: ${TABLE}.Cantidad /1000 ;;
  }

  dimension: monto_transaccion {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Transaccion / 1000
      ;;
  }

  dimension: tipo_cambio_mxn {
    type: number
    sql: ${TABLE}.Tipo_Cambio_MXN ;;
  }

  dimension: monto_mxn {
    hidden: yes
    type: number
    sql: ${TABLE}.Monto_Conversion_MXN /1000 ;;
  }

  dimension: fecha_seleccionada {
    label: "Date filter"
    type: string
    sql: CAST({% date_start date_filter %} AS DATE) ;;
  }

  #Filtros y parametros

  filter: date_filter {
    label: "Date"
    type: date
  }

  filter: tipo_transaccion_vta_nac {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Venta')
      and ${canal_distribucion} in ('Nacional') ;;
  }

  filter: tipo_transaccion_vta_exp {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Venta')
      and ${canal_distribucion} in ('Exportacion') ;;
  }

  filter: tipo_transaccion_pre_nac {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Presupuesto')
      and ${canal_distribucion} in ('Nacional') ;;
  }

  filter: tipo_transaccion_pre_exp {
    hidden: yes
    type: yesno
    sql: ${tipo_transaccion} in ('Presupuesto')
      and ${canal_distribucion} in ('Exportacion') ;;
  }

  #DAY
  filter: filtro_dia {
    hidden: yes
    type: yesno
    sql: ${fecha} = CAST({% date_start date_filter %} AS DATE) ;;
  }

  #MTD
  dimension: filtro_mtd {
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(CAST({% date_start date_filter %} AS DATE)), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD((CAST({% date_start date_filter %} AS DATE)),INTERVAL -0 day)  ;;
  }

  dimension: filtro_mtd_ly {
    hidden: yes
    type: yesno
    sql: ${fecha} >= DATE_ADD(DATE_ADD(LAST_DAY(DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR) ), INTERVAL 1 DAY),INTERVAL -1 MONTH)
      AND ${fecha} <= DATE_ADD(   DATE_ADD( CAST({% date_start date_filter %} AS DATE) ,INTERVAL -1 YEAR)    ,INTERVAL -0 day)  ;;
  }

  #YTD
  dimension: filtro_ytd {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY)   ;;
  }

  dimension: filtro_ytd_ly {
    hidden: yes
    type: yesno
    sql: ${fecha} >= CAST(CONCAT(CAST(EXTRACT(YEAR FROM DATE ({% date_start date_filter %})) -1 AS STRING),"-01-01")  AS DATE)
      and  ${fecha} <= DATE_ADD(DATE_ADD( DATE_TRUNC(CAST({% date_start date_filter %} AS DATE), DAY),INTERVAL -1 year),INTERVAL -0 day)   ;;
  }


################### dimensiones_tipo_cambio

  dimension: tc_diario {
    hidden: yes
    type: number
    sql: ${tipo_cambio.tipo_cambio} ;;

    value_format: "#,##0.00"
  }

  dimension: tc_mtd {
    hidden: yes
    type: number
    sql: ${tipo_cambio.tipo_cambio_mtd} ;;

    value_format: "#,##0.00"
  }

  dimension: tc_mtd_ly {
    hidden: yes
    type: number
    sql: ${tipo_cambio.tipo_cambio_mtd_ly} ;;

    value_format: "#,##0.00"
  }

  dimension: tc_ytd {
    hidden: yes
    type: number
    sql: ${tipo_cambio.tipo_cambio_ytd} ;;

    value_format: "#,##0.00"
  }

  dimension: tc_ytd_ly {
    hidden: yes
    type: number
    sql: ${tipo_cambio.tipo_cambio_ytd_ly} ;;

    value_format: "#,##0.00"
  }


################### termina dimensiones_tipo_cambio


####### metricas_tipo_cambio

  measure: m_tc_diario {
    group_label: "ER"
    label: "ER"
    type: max
    sql: ${tipo_cambio.tipo_cambio} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_mtd {
    group_label: "ER"
    label: "ER MTH"
    type: max
    sql: ${tipo_cambio.tipo_cambio_mtd} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_mtd_ly {
    group_label: "ER"
    label: "ER MTH LYR"
    type: max
    sql: ${tipo_cambio.tipo_cambio_mtd_ly} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_ytd {
    group_label: "ER"
    label: "ER YR"
    type: max
    sql: ${tipo_cambio.tipo_cambio_ytd} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_ytd_ly {
    group_label: "ER"
    label: "ER LYR"
    type: max
    sql: ${tipo_cambio.tipo_cambio_ytd_ly} ;;

    filters: [tipo_transaccion: "Venta"]

    value_format: "#,##0.00"
  }

  measure: m_tc_bud_mtd {
    group_label: "ER"
    label: "ER BUD"
    type: max
    sql: ${tipo_cambio.tipo_cambio_mtd} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    value_format: "#,##0.00"
  }

  measure: m_tc_bud_ytd {
    group_label: "ER"
    hidden: yes
    label: "ER BUD YR"
    type: max
    sql: ${tipo_cambio.tipo_cambio_ytd} ;;

    filters: [tipo_transaccion: "Presupuesto"]

    value_format: "#,##0.00"
  }

####### termina metricas_tipo_cambio

################### metricas

  measure: empty_value1 {
    group_label: "Others"
    label: "Empty value 1"
    type: string
    sql: '';;
  }

  measure: empty_value2 {
    group_label: "Others"
    label: "Empty value 2"
    type: string
    sql: '';;
  }

  measure: ultima_actualizacion {
    group_label: "Others"
    label: "Update date"
    type: date
    sql: MAX(${fecha});;
    convert_tz: no
  }

  measure: daily_sales {
    #hidden: yes
    group_label: "Daily"
    label: "DAILY SALES"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_diario},1);;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ nombre_cliente,daily_sales]

    value_format: "$#,##0.00"
  }


  measure: total_daily_sales {
    hidden: yes
    type: number
    sql: ${daily_sales} ;;

    drill_fields: [ nombre_cliente,total_daily_sales]

    value_format: "$#,##0.00"
  }


  measure: daily_sales_qty {
    group_label: "Daily"
    label: "DAILY SALES (QTY)"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_dia
      value: "yes"
    }

    filters: [tipo_transaccion: "Venta"]

    drill_fields: [ nombre_cliente,daily_sales]

    value_format: "#,##0"
  }


  #MONTHLY-MONEY-MTD

  measure: national_amount_mtd {
    #hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_mtd},1) ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd {
    #hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_mtd},1) ;;


    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_mtd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_mtd {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD"
    type: number
    sql: ${national_amount_mtd} + ${export_amount_mtd} ;;

    drill_fields: [ nombre_cliente,total_amount_mtd]

    value_format: "$#,##0.00"
  }

  measure: total_amount_ {
    group_label: "Monthly"
    label: "TOTAL AMOUNT BY MONTH"
    type:  number
    sql: SUM( CASE WHEN ${canal_distribucion} = "Nacional" THEN ${monto_transaccion} END ) +
      SUM( CASE WHEN ${canal_distribucion} = "Exportacion" THEN ${monto_transaccion} END ) ;;
  }

  measure: national_amount_mtd_ly{
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL AMOUNT MTD LY"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_mtd_ly},1) ;;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT AMOUNT MTD LY"

    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_mtd_ly},1) ;;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_mtd_ly {
    group_label: "Monthly"
    label: "TOTAL AMOUNT MTD LY"
    type: number
    sql: ${national_amount_mtd_ly} + ${export_amount_mtd_ly} ;;

    drill_fields: [ nombre_cliente, total_amount_mtd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL AMOUNT MTD LY"
    type: number
    sql: CASE
          WHEN ${total_amount_mtd} > 0 AND ${total_amount_mtd_ly} = 0 THEN 1
          WHEN ${total_amount_mtd} = 0 AND ${total_amount_mtd_ly} > 0 THEN -1
          WHEN (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1 = 0 THEN 0
          ELSE (${total_amount_mtd} /  NULLIF (${total_amount_mtd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_amount_mtd_ly, total_amount_mtd, total_amount_mtd_ly]
  }

  measure: z_national_amount_bud_mtd{
    group_label: "Monthly"
    label: "Z NATIONAL AMOUNT BUD MTD"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_mtd},1) ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_national_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_mtd {
    group_label: "Monthly"
    label: "Z EXPORT AMOUNT BUD MTD"

    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_mtd},1) ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_export_amount_bud_mtd]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_mtd{
    group_label: "Monthly"
    label: "TOTAL AMOUNT BUD MTD"
    type: number
    sql: ${z_national_amount_bud_mtd} + ${z_export_amount_bud_mtd} ;;

    drill_fields: [ nombre_cliente, total_amount_bud_mtd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL BUD MTD"
    type: number
    sql: CASE
          WHEN ${total_amount_mtd} > 0 AND ${total_amount_bud_mtd} = 0 THEN 1
          WHEN ${total_amount_mtd} = 0 AND ${total_amount_bud_mtd} > 0 THEN -1
          WHEN (${total_amount_mtd} /  NULLIF (${total_amount_bud_mtd},0))-1=-1 THEN 0
          ELSE (${total_amount_mtd} /  NULLIF (${total_amount_bud_mtd},0))-1
         END * 100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente,vs_total_bud_mtd,total_amount_mtd,total_amount_bud_mtd]

  }

  #MONTHLY-QUANTITY-MTD

  measure: national_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_mtd]

    value_format: "#,##0"
  }

  measure: export_qty_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_mtd]
    value_format: "#,##0"
  }

  measure: total_qty_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY MTD"
    type: number
    sql: ${national_qty_mtd} + ${export_qty_mtd} ;;
    drill_fields: [ nombre_cliente, total_qty_mtd]
    value_format: "#,##0"
  }

  measure: national_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_mtd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY MTD LY"
    type: sum
    sql: ${cantidad};;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: filtro_mtd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_mtd_ly {
    hidden: yes
    group_label: "Monthly"
    label: "TOTAL QTY MTD LY"
    type: number
    sql: ${national_qty_mtd_ly} + ${export_qty_mtd_ly} ;;

    drill_fields: [ nombre_cliente, total_qty_mtd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_mtd_ly {
    group_label: "Monthly"
    label: "% VS TOTAL QTY MTD LY"
    type: number
    sql: CASE
          WHEN ${total_qty_mtd} > 0 AND ${total_qty_mtd_ly} = 0 THEN 1
          WHEN ${total_qty_mtd} = 0 AND ${total_qty_mtd_ly} > 0 THEN -1
          WHEN (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1  = 0 THEN 0
          ELSE (${total_qty_mtd}/NULLIF(${total_qty_mtd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_mtd_ly,total_qty_mtd,total_qty_mtd_ly]

  }

  measure: national_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "NATIONAL QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_bud_mtd]
  }

  measure: export_qty_bud_mtd {
    hidden: yes
    group_label: "Monthly"
    label: "EXPORT QTY BUD MTD"
    type: sum
    sql: ${cantidad} ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: filtro_mtd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_bud_mtd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_mtd {
    group_label: "Monthly"
    label: "TOTAL QTY BUD MTD"
    type: number
    sql: ${national_qty_bud_mtd} + ${export_qty_bud_mtd} ;;

    drill_fields: [ nombre_cliente, total_qty_bud_mtd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_mtd {
    group_label: "Monthly"
    label: "% VS TOTAL QTY BUD MTD"
    type: number
    sql: CASE
          WHEN ${total_qty_mtd} > 0 AND ${total_qty_bud_mtd} = 0 THEN 1
          WHEN ${total_qty_mtd} = 0 AND ${total_qty_bud_mtd} > 0 THEN -1
          WHEN (${total_qty_mtd} /  NULLIF (${total_qty_bud_mtd},0))-1= 0 THEN 0
          ELSE (${total_qty_mtd} /  NULLIF (${total_qty_bud_mtd},0))-1
         END *100 ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_bud_mtd,total_qty_mtd,total_qty_bud_mtd]

  }


  #ANNUAL-MONEY-YTD

  measure: national_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_ytd},1) ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_ytd},1) ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_ytd]

    value_format: "$#,##0.00"
  }


  measure: total_amount_ytd {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD"
    type: number
    sql: ${national_amount_ytd} + ${export_amount_ytd} ;;

    drill_fields: [ nombre_cliente,total_amount_ytd]

    value_format: "$#,##0.00"
  }

  measure: national_amount_ytd_ly{
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL AMOUNT YTD LY"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_ytd_ly},1) ;;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente,national_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: export_amount_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT AMOUNT YTD LY"

    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_ytd_ly},1) ;;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente,export_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_ytd_ly {
    group_label: "Annual"
    label: "TOTAL AMOUNT YTD LY"
    type: number
    sql: ${national_amount_ytd_ly} + ${export_amount_ytd_ly} ;;

    drill_fields: [ nombre_cliente, total_amount_ytd_ly]

    value_format: "$#,##0.00"
  }

  measure: vs_total_amount_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL AMOUNT YTD LY"
    type: number
    sql: CASE
          WHEN ${total_amount_ytd} > 0 AND ${total_amount_ytd_ly} = 0 THEN 1
          WHEN ${total_amount_ytd} = 0 AND ${total_amount_ytd_ly} > 0 THEN -1
          WHEN (${total_amount_ytd} /  NULLIF (${total_amount_ytd_ly},0))-1 = 0 THEN 0
          ELSE (${total_amount_ytd} /  NULLIF (${total_amount_ytd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_amount_ytd_ly, total_amount_ytd, total_amount_ytd_ly]
  }

  measure: z_national_amount_bud_ytd{
    group_label: "Annual"
    label: "Z NATIONAL AMOUNT BUD YTD"
    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_ytd},1) ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_national_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure: z_export_amount_bud_ytd {
    group_label: "Annual"
    label: "Z EXPORT AMOUNT BUD YTD"

    type: sum
    sql: ${monto_transaccion} * COALESCE(${tc_ytd},1) ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, z_export_amount_bud_ytd]

    value_format: "$#,##0.00"
  }

  measure:  total_amount_bud_ytd{
    group_label: "Annual"
    label: "TOTAL AMOUNT BUD YTD"
    type: number
    sql: ${z_national_amount_bud_ytd} + ${z_export_amount_bud_ytd} ;;

    drill_fields: [ nombre_cliente, total_amount_bud_ytd]

    value_format: "$#,##0.00"
  }


  measure: vs_total_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL BUD YTD"
    type: number
    sql: CASE
          WHEN ${total_amount_ytd} > 0 AND ${total_amount_bud_ytd} = 0 THEN 1
          WHEN ${total_amount_ytd} = 0 AND ${total_amount_bud_ytd} > 0 THEN -1
          WHEN (${total_amount_ytd} /  NULLIF (${total_amount_bud_ytd},0))-1=-1 THEN 0
          ELSE (${total_amount_ytd} /  NULLIF (${total_amount_bud_ytd},0))-1
         END * 100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente,vs_total_bud_ytd,total_amount_ytd,total_amount_bud_ytd]

  }




  #ANNUAL-QUANTITY-YTD

  measure: national_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_ytd]

    value_format: "#,##0"
  }

  measure: export_qty_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_ytd]
    value_format: "#,##0"
  }

  measure: total_qty_ytd {
    group_label: "Annual"
    label: "TOTAL QTY YTD"
    type: number
    sql: ${national_qty_ytd} + ${export_qty_ytd} ;;
    drill_fields: [ nombre_cliente, total_qty_ytd]
    value_format: "#,##0"
  }

  measure: national_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: tipo_transaccion_vta_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_ytd_ly]
    value_format: "#,##0"
  }


  measure: export_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY YTD LY"
    type: sum
    sql: ${cantidad};;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "VENTA"]

    filters: {
      field: filtro_ytd_ly
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_vta_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: total_qty_ytd_ly {
    hidden: yes
    group_label: "Annual"
    label: "TOTAL QTY YTD LY"
    type: number
    sql: ${national_qty_ytd_ly} + ${export_qty_ytd_ly} ;;

    drill_fields: [ nombre_cliente, total_qty_ytd_ly]
    value_format: "#,##0.00"
  }

  measure: vs_total_qty_ytd_ly {
    group_label: "Annual"
    label: "% VS TOTAL QTY YTD LY"
    type: number
    sql: CASE
          WHEN ${total_qty_ytd} > 0 AND ${total_qty_ytd_ly} = 0 THEN 1
          WHEN ${total_qty_ytd} = 0 AND ${total_qty_ytd_ly} > 0 THEN -1
          WHEN (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1 = 0 THEN 0
          ELSE (${total_qty_ytd}/NULLIF(${total_qty_ytd_ly},0))-1
         END *100;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_ytd_ly,total_qty_ytd,total_qty_ytd_ly]

  }

  measure: national_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "NATIONAL QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    #filters: [canal_distribucion: "NACIONAL"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: tipo_transaccion_pre_nac
      value: "yes"
    }

    drill_fields: [ nombre_cliente, national_qty_bud_ytd]
  }

  measure: export_qty_bud_ytd {
    hidden: yes
    group_label: "Annual"
    label: "EXPORT QTY BUD YTD"
    type: sum
    sql: ${cantidad} ;;

    #filters: [canal_distribucion: "EXPORTACION"]
    #filters: [tipo_transaccion: "PRESUPUESTO"]

    filters: {
      field: filtro_ytd
      value: "yes"
    }

    filters: {
      field: tipo_transaccion_pre_exp
      value: "yes"
    }

    drill_fields: [ nombre_cliente, export_qty_bud_ytd]
    value_format: "#,##0.00"
  }

  measure: total_qty_bud_ytd {
    group_label: "Annual"
    label: "TOTAL QTY BUD YTD"
    type: number
    sql: ${national_qty_bud_ytd} + ${export_qty_bud_ytd} ;;

    drill_fields: [ nombre_cliente, total_qty_bud_ytd]
    value_format: "#,##0"
  }

  measure: vs_total_qty_bud_ytd {
    group_label: "Annual"
    label: "% VS TOTAL QTY BUD YTD"
    type: number
    sql: CASE
          WHEN ${total_qty_ytd} > 0 AND ${total_qty_bud_ytd} = 0 THEN 1
          WHEN ${total_qty_ytd} = 0 AND ${total_qty_bud_ytd} > 0 THEN -1
          WHEN (${total_qty_ytd} /  NULLIF (${total_qty_bud_ytd},0))-1= 0 THEN 0
          ELSE (${total_qty_ytd} /  NULLIF (${total_qty_bud_ytd},0))-1
         END *100 ;;

    html:
          {% if value > 0 %}
          <span style="color: green;">{{ rendered_value }}</span></p>
          {% elsif  value < 0 %}
          <span style="color: red;">{{ rendered_value }}</span></p>
          {% elsif  value == 0 %}
          {{rendered_value}}
          {% else %}
          {{rendered_value}}
          {% endif %} ;;

    value_format: "0.00\%"

    drill_fields: [ nombre_cliente, vs_total_qty_bud_ytd,total_qty_ytd,total_qty_bud_ytd]

  }


}
