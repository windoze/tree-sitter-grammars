[
  (class)
  (module)
  (method)
  (singleton_method)

  (if)
  (unless)
  (else)
  (elsif)
  (for)
  (while)
  (until)
  (case)
  (when)
  (case_match)
  (in_clause)

  (do_block)
  (block)
  (begin)
  (rescue)
  (ensure)

  (hash)
  (array)
  (argument_list)
  (parenthesized_statements)
  (interpolation)
] @indent.begin

[
  "end"
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
  (string)
  (heredoc_body)
] @indent.auto
