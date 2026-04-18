# homebrew-tap

Homebrew tap for [gosaid](https://github.com/dmtrkzntsv/gosaid) — a headless, cross-platform push-to-talk voice dictation daemon.

## Install

```sh
brew install dmtrkzntsv/tap/gosaid
```

Or tap first, then install:

```sh
brew tap dmtrkzntsv/tap
brew install gosaid
```

## Run as a service

```sh
gosaid config                   # paste your API key, save
brew services start gosaid      # runs in background, auto-starts at login
```

Stop with `brew services stop gosaid`. Upgrade with `brew upgrade gosaid`.

## Formulae

- [`gosaid`](Formula/gosaid.rb) — updated automatically by the [gosaid release workflow](https://github.com/dmtrkzntsv/gosaid/blob/main/.github/workflows/release.yml) on each tagged release.

## License

MIT — see [gosaid/LICENSE](https://github.com/dmtrkzntsv/gosaid/blob/main/LICENSE).
