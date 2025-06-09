view: contorderperuser {
    derived_table: {
      explore_source: orders {
        column: id { field: users.id }
        column: count {}
      }
    }
    dimension: id {
      description: ""
      type: number
    }
    dimension: count {
      description: ""
      type: number
    }
}
