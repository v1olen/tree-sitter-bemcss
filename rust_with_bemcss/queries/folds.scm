; Minimal Rust folding rules for BEM CSS
; Only include basic nodes that definitely exist

[
  (block)
  (match_block)
  (parameters)
  (arguments)
  (array_expression)
  (tuple_expression)
  (macro_invocation)
  (token_tree)
] @fold
