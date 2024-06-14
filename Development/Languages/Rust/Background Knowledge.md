# What is `?Sized`

`Sized` is an implicit marker that is added to each type parameter. If you want to loosen that constraint, you can add `+ ?Sized` to your type constraint, which then also allows types which do not implement the `Sized` trait.

Source: [https://doc.rust-lang.org/std/marker/trait.Sized.html](https://doc.rust-lang.org/std/marker/trait.Sized.html)