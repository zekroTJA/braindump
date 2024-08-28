




panic_abort,2768
full_lto,3012
full_s,3624
full_z,3688
no_codegen_units,3988
no_opt_level,4024
none,5648

| `strip` | `opt-level` | `codegen-units` | `tlo`   | `panic`    | Binary Size |
| ------- | ----------- | --------------- | ------- | ---------- | ----------- |
| `false` | -           | -               | `false` | `"unwind"` | 5648 kiB    |
| `true`  | -           | `1`             | `false` | `"unwind"` | 4024 kiB    |
| `true`  | `"s"`       | -               | `false` | `"unwind"` | 3988 kiB    |
|         |             |                 |         |            |             |

# Sources

- https://github.com/johnthagen/min-sized-rust