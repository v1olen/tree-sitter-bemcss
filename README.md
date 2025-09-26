# tree-sitter-bemcss

A [tree-sitter](https://github.com/tree-sitter/tree-sitter) grammar for BEM CSS in Rust.

This grammar extends the standard Rust grammar to provide CSS syntax highlighting within BEM macro attributes.

## Features

- Full Rust syntax support
- CSS syntax highlighting in `#[bem("...")]` attributes
- Support for both regular string literals and raw string literals
- Support for scoped BEM macros (e.g., `#[bem_macro::bem("...")]`)

## Usage

This grammar is designed to be used with the BEM CSS Zed extension. It allows you to write BEM macros in Rust with proper CSS syntax highlighting:

```rust
use bem_macro::bem;

#[component]
#[bem("
    background: red;
    padding: 1rem;

    &__label {
        color: blue;
        font-weight: bold;
    }

    &__element {
        color: green;
        border: 1px solid #ccc;
    }

    &--dark {
        background: black;
        color: white;
    }
")]
pub fn App() -> impl IntoView {
    view! {
        <div class=Bem::__>
            <label class=Bem::label>Search:</label>
            <input class=Bem::element type="text" />
        </div>
    }
}
```

## Development

This grammar is based on the [tree-sitter-rust](https://github.com/tree-sitter/tree-sitter-rust) grammar and extends it with BEM-specific injection rules.

### Building

```bash
npm install
npx tree-sitter generate
npx tree-sitter test
```

### Testing

The grammar includes comprehensive test cases for various BEM macro patterns:

- Direct BEM attributes: `#[bem("css")]`
- Raw string literals: `#[bem(r#"css"#)]`
- Scoped identifiers: `#[crate::bem("css")]`
- Nested token trees: `#[bem(("css"))]`

## License

MIT