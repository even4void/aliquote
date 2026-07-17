---
title: "Linear regression in Rust"
date: 2026-05-20T10:03:01+02:00
draft: false
tags: ["rust", "statistics"]
categories: ["2026"]
---


{{% alert note %}}
<small>[2026-07-17]</small><br>
This is a short note I wrote two months ago when I was studying the design of
the [ndarray][1] Rust library. I intended to complete the project with some
tests and output some plot using any Gnuplot crate I would find but I lost
interest in this project in the mean time. I guess this is just for posterity
now. However, it was a fun exercise and I really enjoyed malaxing some Rust code
for a statistical toy project.
{{% /alert %}}

Lately, I've been playing with some Rust. I found a toy example of linear
regression in Rust: [Linear Regression in Rust][2]. Be sure to check the
associated GitHub repository as the sample code from the blog post isn't
expanded to its full length. This really was a quick check to see what's
available in Rust, and how developing in Rust feels when using Neovim. About the
second point, I want to be able to run tests directly from within my editor, as
well as launch a debugger without relying on external task file or firing up
another terminal. Note that I removed uninteresting part of the original code
(linear regression implemented using standard formulae based on summated
standard deviations).

I got several error with `cargo run` due to openblas-build requiring the
`rustls` or `native-tls` feature to be enabled. (I'm on macOS Tahoe, running on
an ARM64 machine.) Rather than struggling with building a static lib for
openblas, I wanted to use native macOS BLAS and LAPACK libraries. To use macOS
[Accelerate][3] framework instead of openblas, we must change the spec file
(`Cargo.toml`) so that it looks like:

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

This is discussed in the following [GH issue][4].

Running the original code as is, everything works out of the box:

```shell
   -%<--
   Compiling ndarray-linalg v0.16.0
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 14.93s
     Running `target/debug/regress`
[2.9388893694493694, 0.04576464545542497, 0.188530016918319, -0.0010374930424147009]
RSE: 1.6769760888385676
```

Full code available on GH in this [subfolder][5], with all credits to Lorenzo
Celli for the original code.

{{% music %}}A Flock of Seagulls • *Over My Head*{{% /music %}}

[1]: https://github.com/rust-ndarray/ndarray
[2]: http://lorenzocelli.me/2025/06/28/linear-regression-in-Rust.html
[3]: https://developer.apple.com/accelerate/
[4]: https://github.com/rust-ndarray/ndarray-linalg/issues/362#issuecomment-1650731137
[5]: https://github.com/even4void/scratch/tree/master/regress
