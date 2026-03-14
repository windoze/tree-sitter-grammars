[
  (element)
  (script_element)
  (style_element)
] @indent.begin

(end_tag
  ">" @indent.end)

(start_tag
  ">" @indent.branch)

(end_tag
  "</" @indent.branch)

[
  (comment)
] @indent.auto
