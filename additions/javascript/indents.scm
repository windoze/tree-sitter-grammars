[
  (class_body)
  (class_declaration)

  (function_declaration)
  (function_expression)
  (arrow_function)
  (method_definition)
  (generator_function_declaration)

  (if_statement)
  (else_clause)
  (for_statement)
  (for_in_statement)
  (while_statement)
  (do_statement)
  (switch_statement)
  (switch_case)
  (switch_default)
  (try_statement)
  (catch_clause)
  (finally_clause)

  (statement_block)
  (object)
  (object_pattern)
  (array)
  (array_pattern)
  (formal_parameters)
  (arguments)
  (parenthesized_expression)
  (template_substitution)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
  (template_string)
] @indent.auto
