# The name of this view in Looker is "Foo"
view: foo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.foo ;;
  drill_fields: [line]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: line {
    primary_key: yes
    type: string
    sql: ${TABLE}.line ;;
  }
  measure: count {
    type: count
    drill_fields: [line]
  }
}
