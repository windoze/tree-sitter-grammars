; OCaml indents
[
  (let_binding)
  (value_definition)
  (type_definition)
  (module_definition)
  (module_type_definition)
  (class_definition)
  (class_type_definition)

  (function_expression)
  (fun_expression)
  (match_expression)
  (match_case)
  (if_expression)
  (try_expression)
  (while_expression)
  (for_expression)

  (structure)
  (signature)
  (object_expression)
  (record_expression)
  (list_expression)
  (array_expression)
  (parenthesized_expression)
  (application_expression)
] @indent.begin

; OCaml interface indents
[
  (value_specification)
  (method_specification)
] @indent.begin

[
  "end"
  ")"
  "]"
  "}"
  ";;"
] @indent.branch @indent.end

[
  (comment)
  (string)
] @indent.auto
