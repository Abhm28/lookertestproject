- dashboard: test
  title: Schedule
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: nOfDX3MmwXbXjelyUYioXK
  elements:
  - title: Dashs
    name: Dashs
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.link, dashboard_element.title, dashboard.count, dashboard_element.count,
      title, link]
    filters:
      user.name: "-NULL"
      user.is_disabled: 'No'
      user_facts.is_looker_employee: 'No'
      dashboard.moved_to_trash: 'No'
    sorts: [dashboard_element.title desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: concat(${dashboard.link}," ",${dashboard.title})
      label: Title
      value_format:
      value_format_name:
      dimension: title
      _kind_hint: dimension
      _type_hint: string
    - category: measure
      expression:
      label: Link
      value_format:
      value_format_name:
      based_on: look.public_embed_link
      _kind_hint: measure
      measure: link
      type: list
      _type_hint: list
    filter_expression: |
      diff_days(${dashboard.created_date}, now()) <= 7
      OR
      diff_days(${dashboard_element.created_date}, now()) <= 7
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      look.count: Dashboard Look Count
      user.name: Name
      dashboard_element.count: Dash. Elements
      dashboard.count: Dashboards
    series_cell_visualizations:
      dashboard.count:
        is_active: true
    truncate_column_names: false
    subtotals_at_bottom: false
    note_state: expanded
    note_display: hover
    note_text: Users with the most new dashboards and new dashboard elements in the
      last 7 days.
    defaults_version: 1
    hidden_fields: [dashboard_element.title]
    hidden_pivots: {}
    listen: {}
    row: 5
    col: 0
    width: 24
    height: 6
  - title: Link
    name: Link
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.link, link, dashboard_element.title, dashboard.count, dashboard_element.count]
    filters:
      user.name: "-NULL"
      user.is_disabled: 'No'
      user_facts.is_looker_employee: 'No'
      dashboard.moved_to_trash: 'No'
    sorts: [dashboard.count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: concat("https://gcpl250.cloud.looker.com/embed/dashboards/",${dashboard_element.id})
      label: Link
      value_format:
      value_format_name:
      dimension: link
      _kind_hint: dimension
      _type_hint: string
    filter_expression: |
      diff_days(${dashboard.created_date}, now()) <= 7
      OR
      diff_days(${dashboard_element.created_date}, now()) <= 7
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      look.count: Dashboard Look Count
      user.name: Name
      dashboard_element.count: Dash. Elements
      dashboard.count: Dashboards
    series_column_widths:
      dashboard.link: 102
      dashboard.count: 100
      dashboard_element.count: 120
    series_cell_visualizations:
      dashboard.count:
        is_active: true
        conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
    subtotals_at_bottom: false
    note_state: expanded
    note_display: hover
    note_text: Users with the most new dashboards and new dashboard elements in the
      last 7 days.
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 11
    col: 0
    width: 12
    height: 6
  - title: New Tile
    name: New Tile
    model: testMTY
    explore: orders
    type: single_value
    fields: [orders.link]
    sorts: [orders.link]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    truncate_column_names: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen: {}
    row: 0
    col: 0
    width: 5
    height: 5
  - title: test (Copy 13)
    name: test (Copy 13)
    model: system__activity
    explore: history
    type: table
    fields: [history.approximate_usage_in_minutes, history.status, node.version, query.view,
      query.id, query.model, history.completed_date, history.message, history.most_recent_run_at_date,
      merge_query.created_date, query.created_date, query.column_limit, query.limit,
      user.name, model_set.edit_link, model_set.name]
    sorts: [history.approximate_usage_in_minutes desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_under_10s
      label: Percent Under 10s
      expression: "${history.queries_under_10s} / ${history.query_run_count}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      user.name: Name
      history.approximate_usage_in_minutes: Minutes
      history.query_run_count: Queries
      percent_under_10s: "% Queries Under 10s"
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Top users by approximate minutes used and query count in the last 7
      days.
    defaults_version: 1
    hidden_pivots: {}
    row: 11
    col: 12
    width: 12
    height: 6
  - title: gauge
    name: gauge
    model: alan_davila_testing
    explore: orders
    type: looker_column
    fields: [users.count]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 4
    series_labels: {}
    advanced_vis_config: "{\n  \n    chart: {\n        type: 'gauge',\n    },\n\n\
      \    title: {\n        text: 'Speedometer'\n    },\n\n    pane: {\n        startAngle:\
      \ -90,\n        endAngle: 89.9,\n        background: null,\n    },\n\n    //\
      \ the value axis\n    yAxis: {\n        min: 0,\n        max: 20000,\n     \
      \   tickPixelInterval: 72,\n        tickPosition: 'inside',\n        tickColor:\
      \  '#FFFFFF',\n        tickLength: 20,\n        tickWidth: 2,\n        minorTickInterval:\
      \ null,\n        labels: {\n            distance: 20,\n            style: {\n\
      \                fontSize: '14px'\n            },\n        },\n        lineWidth:\
      \ 0,\n        plotBands: [{\n            from: 14000,\n            to: 20000,\n\
      \            color: '#55BF3B', // green\n            thickness: 20,\n      \
      \      borderRadius: '50%'\n        }, {\n            from: 0,\n           \
      \ to: 7000,\n            color: '#DF5353', // red\n            thickness: 20,\n\
      \            borderRadius: '50%'\n        }, {\n            from: 7000,\n  \
      \          to: 14000,\n            color: '#DDDF0D', // yellow\n           \
      \ thickness: 20\n        }]\n    },\n\n    series: [{\n        name: 'Speed',\n\
      \        tooltip: {\n            valueSuffix: ' users'\n        },\n       \
      \ dataLabels: {\n            enabled: true,\n            format: '{y:.2f} User',\n\
      \            borderWidth: 0,\n            color:'#333333',\n            style:\
      \ {\n                fontSize: '16px'\n            }\n        },\n        dial:\
      \ {\n            radius: '80%',\n            backgroundColor: 'gray',\n    \
      \        baseWidth: 12,\n            baseLength: '0%',\n            rearLength:\
      \ '0%'\n        },\n        pivot: {\n            backgroundColor: 'gray',\n\
      \            radius: 6\n        }\n\n    }]\n}"
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    target_length: 15
    target_gap: 15
    target_weight: 50
    range_min: 0
    range_max: 20000
    value_formatting: "##,###.00"
    value_label_padding: 60
    label_font_size: 1
    range_formatting: ''
    spinner_type: needle
    fill_color: "#12B5CB"
    gauge_fill_type: segment
    fill_colors: ["#7FCDAE", "#ffed6f", "#EE7772"]
    viz_trellis_by: none
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    target_label_padding: 1.5
    hidden_fields: []
    hidden_points_if_no: []
    bar_arm_length: 25
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: horizontal
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: 'off'
    bar_target_label_type: none
    bar_target_label_font: 3
    bar_label_font_size: 3
    bar_fill_color: "#58e691"
    bar_background_color: "#CECECE"
    bar_spinner_color: "#282828"
    bar_range_color: "#282828"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    isStepped: false
    labelOverlap: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 5
    width: 8
    height: 5
  filters:
  - name: Is Disabled (Yes / No)
    title: Is Disabled (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: system__activity
    explore: user
    listens_to_filters: []
    field: user.is_disabled
