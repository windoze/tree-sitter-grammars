[
  (function_item)
  (struct_item)
  (enum_item)
  (union_item)
  (trait_item)
  (impl_item)
  (mod_item)
  (type_item)
  (const_item)
  (static_item)
  (macro_definition)

  (block)
  (declaration_list)
  (field_declaration_list)
  (enum_variant_list)
  (ordered_field_declaration_list)
  (match_block)

  (if_expression)
  (else_clause)
  (for_expression)
  (while_expression)
  (loop_expression)
  (match_expression)
  (match_arm)

  (closure_expression)
  (async_block)
  (unsafe_block)

  (arguments)
  (parameters)
  (token_tree)
  (use_list)
  (array_expression)
  (tuple_expression)
] @indent.begin

[
  "}"
  "]"
  ")"
] @indent.branch @indent.end

[
  (comment)
  (block_comment)
  (doc_comment)
  (string_literal)
  (raw_string_literal)
] @indent.auto
