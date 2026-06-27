```bash
brew install ghc ghci
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

```

Komande za ghci:
- `:q` - quit
- `:l` - load file
- `:r` - reload file
- `:type`
- `:?` - show help
- `:i` - info
- `:b` - browse all module functions
- `:doc` - documentation

stack - menadzuje biblioteke za haskell, slicno kao maven u javi.

Stack komande:
- `stack new [ime]` - pravi projekat
- `stack run` - pokrece projekat
- `stack ghci` - automatski kompajlira sve fajlvoe i pokrece unutar ghci
