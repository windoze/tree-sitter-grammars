[
  (class_declaration)
  (struct_declaration)
  (interface_declaration)
  (enum_declaration)
  (record_declaration)
  (namespace_declaration)

  (method_declaration)
  (constructor_declaration)
  (property_declaration)
  (accessor_declaration)
  (indexer_declaration)
  (operator_declaration)
  (lambda_expression)
  (anonymous_method_expression)

  (if_statement)
  (else_clause)
  (for_statement)
  (for_each_statement)
  (while_statement)
  (do_statement)
  (switch_statement)
  (switch_section)
  (switch_expression)
  (try_statement)
  (catch_clause)
  (finally_clause)
  (using_statement)
  (lock_statement)

  (block)
  (declaration_list)
  (enum_member_declaration_list)
  (argument_list)
  (parameter_list)
  (initializer_expression)
  (array_creation_expression)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
] @indent.auto
