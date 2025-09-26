; Inject CSS syntax highlighting into BEM macro string literals

; Direct bem attribute with string literal: #[bem("...")]
(attribute_item
  (attribute
    (identifier) @path
    arguments: (token_tree
      (string_literal
        (string_content) @injection.content))
  )
  (#eq? @path "bem")
  (#set! injection.language "css"))

; Direct bem attribute with raw string literal: #[bem(r#"..."#)]
(attribute_item
  (attribute
    (identifier) @path
    arguments: (token_tree
      (raw_string_literal
        (string_content) @injection.content))
  )
  (#eq? @path "bem")
  (#set! injection.language "css"))

; Scoped bem attribute with string literal: #[some_crate::bem("...")]
(attribute_item
  (attribute
    (scoped_identifier
      name: (identifier) @name)
    arguments: (token_tree
      (string_literal
        (string_content) @injection.content))
  )
  (#eq? @name "bem")
  (#set! injection.language "css"))

; Scoped bem attribute with raw string literal: #[some_crate::bem(r#"..."#)]
(attribute_item
  (attribute
    (scoped_identifier
      name: (identifier) @name)
    arguments: (token_tree
      (raw_string_literal
        (string_content) @injection.content))
  )
  (#eq? @name "bem")
  (#set! injection.language "css"))

; Handle nested token trees (if macro args are wrapped in extra parentheses)
(attribute_item
  (attribute
    (identifier) @path
    arguments: (token_tree
      (token_tree
        (string_literal
          (string_content) @injection.content)))
  )
  (#eq? @path "bem")
  (#set! injection.language "css"))

; Handle nested token trees with raw strings
(attribute_item
  (attribute
    (identifier) @path
    arguments: (token_tree
      (token_tree
        (raw_string_literal
          (string_content) @injection.content)))
  )
  (#eq? @path "bem")
  (#set! injection.language "css"))
