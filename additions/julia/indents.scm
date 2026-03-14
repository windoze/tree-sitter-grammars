[
  (function_definition)
  (short_function_definition)
  (macro_definition)
  (struct_definition)
  (abstract_definition)

  (if_statement)
  (elseif_clause)
  (else_clause)
  (for_statement)
  (while_statement)
  (try_statement)
  (catch_clause)
  (finally_clause)
  (do_clause)
  (let_statement)

  (compound_statement)
  (block)
  (tuple_expression)
  (parenthesized_expression)
  (comprehension_expression)
  (argument_list)
  (curly_expression)
  (matrix_expression)
] @indent.begin

[
  "end"
  ")"
  "]"
  "}"
] @indent.branch @indent.end

[
  (comment)
  (block_comment)
  (string)
  (command_literal)
] @indent.auto
