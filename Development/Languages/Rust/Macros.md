Book: [https://doc.rust-lang.org/book/ch19-06-macros.html](https://doc.rust-lang.org/book/ch19-06-macros.html)

Reference: [https://doc.rust-lang.org/reference/macros.html](https://doc.rust-lang.org/reference/macros.html)

# [Metavariables](https://doc.rust-lang.org/reference/macros-by-example.html#metavariables)

> From: [https://doc.rust-lang.org/reference/macros-by-example.html#metavariables](https://doc.rust-lang.org/reference/macros-by-example.html#metavariables)

In the matcher, `$` _name_ `:` _fragment-specifier_ matches a Rust syntax fragment of the kind specified and binds it to the metavariable `$`_name_. Valid fragment specifiers are:

- `item`: an _[Item](https://doc.rust-lang.org/reference/items.html)_
- `block`: a _[BlockExpression](https://doc.rust-lang.org/reference/expressions/block-expr.html)_
- `stmt`: a _[Statement](https://doc.rust-lang.org/reference/statements.html)_ without the trailing semicolon (except for item statements that require semicolons)
- `pat_param`: a _[PatternNoTopAlt](https://doc.rust-lang.org/reference/patterns.html)_
- `pat`: at least any _[PatternNoTopAlt](https://doc.rust-lang.org/reference/patterns.html)_, and possibly more depending on edition
- `expr`: an _[Expression](https://doc.rust-lang.org/reference/expressions.html)_
- `ty`: a _[Type](https://doc.rust-lang.org/reference/types.html#type-expressions)_
- `ident`: an [IDENTIFIER_OR_KEYWORD](https://doc.rust-lang.org/reference/identifiers.html) or [RAW_IDENTIFIER](https://doc.rust-lang.org/reference/identifiers.html)
- `path`: a _[TypePath](https://doc.rust-lang.org/reference/paths.html#paths-in-types)_ style path
- `tt`: a _[TokenTree](https://doc.rust-lang.org/reference/macros.html#macro-invocation)_ (a single [token](https://doc.rust-lang.org/reference/tokens.html) or tokens in matching delimiters `()`, `[]`, or `{}`)
- `meta`: an _[Attr](https://doc.rust-lang.org/reference/attributes.html)_, the contents of an attribute
- `lifetime`: a [LIFETIME_TOKEN](https://doc.rust-lang.org/reference/tokens.html#lifetimes-and-loop-labels)
- `vis`: a possibly empty _[Visibility](https://doc.rust-lang.org/reference/visibility-and-privacy.html)_ qualifier
- `literal`: matches ``_[LiteralExpression](https://doc.rust-lang.org/reference/expressions/literal-expr.html)_