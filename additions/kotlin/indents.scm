[
  (class_declaration)
  (class_body)
  (enum_class_body)
  (companion_object)

  (function_declaration)
  (anonymous_function)
  (lambda_literal)

  (if_expression)
  (when_expression)
  (when_entry)
  (for_statement)
  (while_statement)
  (do_while_statement)
  (try_expression)
  (catch_block)
  (finally_block)

  (control_structure_body)
  (value_arguments)
  (collection_literal)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
  (multiline_comment)
] @indent.auto
