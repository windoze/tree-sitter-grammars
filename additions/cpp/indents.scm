; C indents
[
  (function_definition)
  (struct_specifier)
  (union_specifier)
  (enum_specifier)

  (if_statement)
  (else_clause)
  (for_statement)
  (while_statement)
  (do_statement)
  (switch_statement)
  (case_statement)

  (compound_statement)
  (initializer_list)
  (field_declaration_list)
  (enumerator_list)
  (declaration_list)
  (parameter_list)
  (argument_list)

  (preproc_if)
  (preproc_ifdef)
  (preproc_elif)
  (preproc_else)
] @indent.begin

; C++ indents
[
  (class_specifier)
  (namespace_definition)
  (template_declaration)
  (lambda_expression)
  (try_statement)
  (catch_clause)
  (access_specifier)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
  (preproc_arg)
] @indent.auto
