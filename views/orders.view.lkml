# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]
  parameter: parametertest {
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "sale_price"
    }
    allowed_value: {
      label: "Total Cost"
      value: "cost"
    }
  }
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, minute,hour]
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }
  dimension: minutes {
    type: number
    sql: 12*10 ;;
  }
  dimension_group: addtime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, minute,hour,time_of_day]
    sql: DATE_ADD(${created_time}, INTERVAL ${minutes} MINUTE) ;;
  }
  dimension: hourexact {
    type: string
    sql: concat(${addtime_hour},:,${addtime_minute}) ;;
  }

  # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Status" in Explore.

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: link{
    sql: "text" ;;
    html: <div style="text-align: left; display: block; font-size: 14px; width: 100vw; padding-left: 30px; line-height: 22px">
     <a href="https://moma.corp.google.com/search?q=in%3Alooker-support&hq=" target="_blank" rel="noreferrer">Security Risk Analysis</a> <br>
     <a href="https://www.youtube.com/" target="_blank" rel="noreferrer">success metrics</a> <br>
</div> ;;
  }
  dimension: concat {
    type: string
    sql: CONCAT(${status}," - ",${user_id} ) ;;
  }

  #measure: order_count_last_year {
  #  type: period_over_period
  #  description: "Order count from the previous year"
  #  based_on: orders.count
  #  based_on_time: orders.created_year
  #  period: year
  #  kind: previous
  #}

  measure: count {
    type: count
    filters: [users.state : "Wyoming,Wisconsin,Utah, Texas", users.gender: "f", users.age: ">18"]
    #filters: [status_filter: "yes"]
  }

  measure: counttest {
    type: count_distinct
    sql: CASE WHEN (${users.state} in ("Wyoming","Wisconsin","  Utah", "Texas"))  THEN ${id}
    END;;
    drill_fields: [detail*]
  }

  measure: summillon {
    type: number
    sql: ${count}*10.12132324545 ;;
    value_format: "0.000,,\" M\""
  }

  measure: measuretest {
    type: number
    label: "Measure test"
    value_format: "#,##0.00"
    sql:
      {% if parametertest._parameter_value == 'sale_price' %}
        ${count}*100
      {% elsif parametertest._parameter_value == 'cost' %}
        ${count}*10
      {% endif %}
    ;;
    html:
      {% if parametertest._parameter_value == 'sale_price' %}
        $ {{rendered_value}}
      {% elsif parametertest._parameter_value == 'cost' %}
        {{rendered_value}}
      {% endif %}
    ;;
  }

  dimension: drill {
    sql: ${TABLE}.status ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.last_name,
  users.first_name,
  users.id,
  order_items.count,
  order_items_vijaya.count
  ]
  }
}
