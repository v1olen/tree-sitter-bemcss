; Standard macro injections - use rust_with_bemcss for better injection support
(macro_invocation
  macro: (_) @_macro_name
  (token_tree) @injection.content
  (#not-match? @_macro_name "bem$")
  (#set! injection.language "rust_with_bemcss")
  (#set! injection.include-children))

; BEM macro injection - inject CSS into bem macro string literals
(macro_invocation
  macro: (identifier) @_macro_name
  (token_tree
    (string_literal
      (string_content) @injection.content))
  (#eq? @_macro_name "bem")
  (#set! injection.language "css"))

(macro_invocation
  macro: (identifier) @_macro_name
  (token_tree
    (raw_string_literal
      (raw_string_literal_content) @injection.content))
  (#eq? @_macro_name "bem")
  (#set! injection.language "css"))

; Scoped BEM macro injection
(macro_invocation
  macro: (scoped_identifier
    name: (identifier) @_macro_name)
  (token_tree
    (string_literal
      (string_content) @injection.content))
  (#eq? @_macro_name "bem")
  (#set! injection.language "css"))

(macro_invocation
  macro: (scoped_identifier
    name: (identifier) @_macro_name)
  (token_tree
    (raw_string_literal
      (raw_string_literal_content) @injection.content))
  (#eq? @_macro_name "bem")
  (#set! injection.language "css"))

(macro_definition
  (macro_rule
    left: (token_tree_pattern) @injection.content
    (#set! injection.language "rust_with_bemcss")))

(macro_definition
  (macro_rule
    right: (token_tree) @injection.content
    (#set! injection.language "rust_with_bemcss")))

([
  (line_comment)
  (block_comment)
] @injection.content
  (#set! injection.language "comment"))

((macro_invocation
  macro: (identifier) @injection.language
  (token_tree) @injection.content)
  (#any-of? @injection.language "html" "json"))

(call_expression
  function: (scoped_identifier
    path: (identifier) @_regex
    (#any-of? @_regex "Regex" "ByteRegexBuilder")
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (raw_string_literal) @injection.content)
  (#set! injection.language "regex"))

(call_expression
  function: (scoped_identifier
    path: (scoped_identifier
      (identifier) @_regex
      (#any-of? @_regex "Regex" "ByteRegexBuilder") .)
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (raw_string_literal) @injection.content)
  (#set! injection.language "regex"))

(call_expression
  function: (scoped_identifier
    path: (identifier) @_regex
    (#any-of? @_regex "RegexSet" "RegexSetBuilder")
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (array_expression
      (raw_string_literal) @injection.content))
  (#set! injection.language "regex"))

(call_expression
  function: (scoped_identifier
    path: (scoped_identifier
      (identifier) @_regex
      (#any-of? @_regex "RegexSet" "RegexSetBuilder") .)
    name: (identifier) @_new
    (#eq? @_new "new"))
  arguments: (arguments
    (array_expression
      (raw_string_literal) @injection.content))
  (#set! injection.language "regex"))

((block_comment) @injection.content
  (#match? @injection.content "/\\*!([a-zA-Z]+:)?re2c")
  (#set! injection.language "re2c"))
