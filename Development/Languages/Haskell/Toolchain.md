# Installation

[GHCup](https://www.haskell.org/ghcup) is generally used as installer for the [[Haskell]] toolchain.

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

After that, we can install hlint as linter and ormolu as code formatter.
```bash
sudo apt install libgmp-dev libffi-dev
cabal update
cabal install hlint ormolu
```

# Project Setup

- `foo.cabal` ≈ `Cargo.toml`
- `dist-newstyle/` ≈ `target/`

Initialize a new cabal project with
```bash
cabal init -n --libandexe --tests -p learn-haskell \
  --source-dir=src --application-dir=app --test-dir=test
```

One difference from Cargo trips people up: a package has several components (*stanzas*), and each one declares its own build-depends. If the test suite imports `Data.Map`, it needs containers in its own stanza. Being in the library’s stanza doesn’t cover it.

```
library            -- src/,  ≈ [lib]
executable aoc     -- app/,  ≈ [[bin]], depends on the library by package name
test-suite spec    -- test/, ≈ tests/ + [dev-dependencies]
```

