[
  (function_definition)
  (class_definition)
  (decorated_definition)

  (if_statement)
  (elif_clause)
  (else_clause)
  (for_statement)
  (while_statement)
  (try_statement)
  (except_clause)
  (finally_clause)
  (with_statement)
  (match_statement)
  (case_clause)

  (block)
  (lambda)

  (dictionary)
  (dictionary_comprehension)
  (list)
  (list_comprehension)
  (set)
  (set_comprehension)
  (tuple)
  (generator_expression)
  (parenthesized_expression)
  (argument_list)
] @indent.begin

[
  ")"
  "]"
  "}"
] @indent.branch @indent.end

[
  (comment)
  (string)
] @indent.auto
