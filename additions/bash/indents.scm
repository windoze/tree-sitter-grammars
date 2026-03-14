[
  (function_definition)
  (compound_statement)
  (subshell)
  (do_group)

  (if_statement)
  (elif_clause)
  (else_clause)
  (for_statement)
  (c_style_for_statement)
  (while_statement)
  (case_statement)
  (case_item)
] @indent.begin

[
  "}"
  "fi"
  "done"
  "esac"
  ")"
  ";;"
] @indent.branch @indent.end

[
  (comment)
  (heredoc_body)
] @indent.auto
