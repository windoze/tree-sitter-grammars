; CSS indents
[
  (block)
  (declaration)
  (rule_set)
  (media_statement)
  (keyframes_statement)
  (at_rule)
  (import_statement)
] @indent.begin

; SCSS indents
[
  (function_statement)
  (mixin_statement)
  (include_statement)
  (if_statement)
  (else_clause)
  (else_if_clause)
  (for_statement)
  (each_statement)
  (while_statement)
] @indent.begin

"}" @indent.branch @indent.end

[
  (comment)
] @indent.auto
