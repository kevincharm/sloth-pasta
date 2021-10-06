#![allow(unused_imports)]

extern crate cc;

use std::env;
use std::path::{Path, PathBuf};

#[cfg(target_env = "msvc")]
fn assembly(files: &mut Vec<PathBuf>) {
    files.push(PathBuf::from("src/win64/add_mod_pasta-x86_64.asm"));
    files.push(PathBuf::from("src/win64/mulq_mont_pasta-x86_64.asm"));
    files.push(PathBuf::from("src/win64/mulx_mont_pasta-x86_64.asm"));
}

#[cfg(not(target_env = "msvc"))]
fn assembly(files: &mut Vec<PathBuf>) {
    files.push(PathBuf::from("src/assembly.S"));
}

fn main() {
    // Set CC environment variable to choose alternative C compiler.
    // Optimization level depends on whether or not --release is passed
    // or implied.
    let mut cc = cc::Build::new();
    let mut files = vec![PathBuf::from("src/pasta_vdf.c")];

    // account for cross-compilation
    let target_arch = env::var("CARGO_CFG_TARGET_ARCH").unwrap();

    if target_arch.eq("x86_64") || target_arch.eq("aarch64") {
        assembly(&mut files);
    } else {
        panic!("{}: unsupported platform", target_arch);
    }

    #[cfg(target_arch = "x86_64")]
    if target_arch.eq("x86_64") && std::is_x86_feature_detected!("adx") {
        println!("Enabling ADX because it was detected on the host");
        cc.define("__ADX__", None);
    }

    cc.flag_if_supported("-mno-avx") // avoid costly transitions
        .flag_if_supported("-fno-builtin-memcpy")
        .flag_if_supported("-Wno-unused-command-line-argument");
    if !cfg!(debug_assertions) {
        cc.opt_level(3);
    }
    cc.files(&files).compile("libpasta_vdf.a");
}
