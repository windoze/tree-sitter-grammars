[
  (function_declaration)
  (method_declaration)
  (func_literal)

  (block)
  (literal_value)

  (if_statement)
  (for_statement)
  (expression_switch_statement)
  (type_switch_statement)
  (select_statement)
  (communication_case)
  (expression_case)
  (default_case)
  (type_case)

  (struct_type)
  (interface_type)
  (field_declaration_list)

  (import_spec_list)
  (argument_list)
  (call_expression)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
] @indent.auto
