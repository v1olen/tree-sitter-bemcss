{
  "targets": [
    {
      "target_name": "tree_sitter_bemcss_binding",
      "dependencies": [
        "<!(node -p \"require('node-addon-api').targets\"):node_addon_api_except",
      ],
      "include_dirs": [
        "bemcss/src",
        "rust_with_bemcss/src"
      ],
      "sources": [
        "bindings/node/binding.cc",
        "bemcss/src/parser.c",
        "bemcss/src/scanner.c",
        "rust_with_bemcss/src/parser.c",
        "rust_with_bemcss/src/scanner.c"
      ],
      "cflags_c": [
        "-std=c11",
        "-Wno-unused-value",
      ]
    }
  ]
}
