Rayon is a data-parallelisation library which is extremely simple to use with iterators.

- Crates.io: https://crates.io/crates/rayon
- GitHub: https://github.com/rayon-rs/rayon
- Docs: https://docs.rs/rayon/latest/rayon/index.html
## Thread Pool
```rust
use std::{thread, time::Duration};

use rand::Rng;
use rayon::iter::{IntoParallelIterator, ParallelIterator};

fn main() {
    let pool = rayon::ThreadPoolBuilder::new()
        .num_threads(dbg!(num_cpus::get()))
        .build()
        .unwrap();

    pool.install(do_stuff);
}

fn do_stuff() {
    (1..100).into_par_iter().for_each(|v| {
        let t = rand::thread_rng().gen_range(1000..2000);
        thread::sleep(Duration::from_millis(t));
        println!("finished {v}");
    });
}
```