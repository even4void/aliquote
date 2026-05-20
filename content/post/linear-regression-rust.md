---
title: "Linear regression in Rust"
date: 2026-05-20T10:03:01+02:00
draft: true
tags: ["rust", "statistics"]
categories: ["2026"]
---

Lately, I've been playing with some Rust. I found a toy example of linear
regression in Rust: [Linear Regression in Rust][1]. Be sure to check the
associated GitHub repository as the sample code from the blog post isn't
expanded to its full length. This really was a quick check to see what's
available in Rust, and how developing in Rust feels when using Neovim. About the
second point, I want to be able to run tests directly from within my editor, as
well as launch a debugger without relying on external task file or firing up
another terminal.

I got several error with `cargo run` due to openblas-build requiring the
`rustls` or `native-tls` feature to be enabled. Rather than struggling with
building a static lib for openblas, I wanted to use native macOS BLAS and LAPACK
librarues. To use macOS [Accelerate][2] framework instead of openblas, we must
change the spec file (`Cargo.toml`) so that it looks like:

```toml
[dependencies]
csv = "1.1"
ndarray = {version = "0.15", features=["rayon", "serde", "blas"]}
ndarray-linalg = {version = "0.16", default-features = false}
blas-src = { version = "0.8", features = ["accelerate"] }
```

We also need to add specific instructions for linking the target in `build.rs`.

```rust
fn main() {
    println!("cargo:rustc-link-lib=framework=Accelerate")
}
```

This is discussed in the following [GH issue][3].

Running the original code as is, everything works out of the box:

![img](/img/2026-05-20-09-57-21.png)

So far, so good. Now, let's add some tests.

{{% music %}}A Flock of Seagulls • *Over My Head*{{% /music %}}

[1]: http://lorenzocelli.me/2025/06/28/linear-regression-in-Rust.html
[2]: https://developer.apple.com/accelerate/
[3]: https://github.com/rust-ndarray/ndarray-linalg/issues/362#issuecomment-1650731137
