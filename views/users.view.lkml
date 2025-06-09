# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: create_at {
    sql: ${TABLE}.created_at ;;
    type: date
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    tags: ["email"]
  }
  dimension: segmentUserId {
    type: string
    sql: concat(${TABLE}.email,${TABLE}.id) ;;
    tags: ["user_id"]
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  dimension: gen {
    type: string
    sql: CASE
      WHEN ${TABLE}.gender='f' then '1'
      WHEN ${TABLE}.gender='m' then '2'
      else  'null'
      END ;;
  }
  dimension: latitude {
    type: number
    sql: (floor(rand()*50)+1)  ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.age * -1.123412341  ;;
  }
  dimension: testLocation {
    type: location
    sql_latitude: ${latitude}  ;;
    sql_longitude: ${longitude}  ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension: condicion1 {
    type: string
    hidden: yes
    sql: case when
      (state IN ("Wyoming","Wisconsin","Utah", "Texas") AND
              gender = "f") or (state IN ("Wyoming","Wisconsin","Utah", "Texas") AND
              age > 50) then "Yes"
    else "No" end;;
  }

  dimension: countrys {
    type: string
    sql: "US" ;;
  }
  dimension: flag {
    type: string
    sql: lower(${countrys}) ;;
    html:<p style="text-transform: uppercase"><img src="https://flagcdn.com/w40/{{value}}.png"  > {{value}} </p> ;;
  }
  measure: counttest {
    type: count_distinct
    sql: ${id} ;;
    filters: [condicion1: "yes"]
    drill_fields: [detail*]
  }
  measure: countbad {
    type: count_distinct
    sql: case when
    (state IN ("Wyoming","Wisconsin","Utah", "Texas") AND
    gender = "f") or (state IN ("Wyoming","Wisconsin","Utah", "Texas") AND
    age > 50) then ${id} end;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  last_name,
  first_name,
  events.count,
  orders.count,
  user_data.count
  ]
  }

}
