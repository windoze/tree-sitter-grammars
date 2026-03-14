[
  (class_declaration)
  (interface_declaration)
  (trait_declaration)
  (enum_declaration)
  (function_definition)
  (method_declaration)
  (anonymous_function)
  (arrow_function)

  (if_statement)
  (else_clause)
  (else_if_clause)
  (for_statement)
  (foreach_statement)
  (while_statement)
  (do_statement)
  (switch_statement)
  (case_statement)
  (try_statement)
  (catch_clause)
  (finally_clause)
  (match_expression)

  (compound_statement)
  (declaration_list)
  (formal_parameters)
  (arguments)
  (array_creation_expression)
  (parenthesized_expression)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
  (string)
  (encapsed_string)
  (heredoc)
  (nowdoc)
] @indent.auto
