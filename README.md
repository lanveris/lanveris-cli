# Lanveris CLI

Public binary releases for the Lanveris CLI.

Lanveris is a chain-neutral trusted timestamp proof service for agent outputs:
it calculates file fingerprints locally, uploads only hashes and metadata, and
anchors proof batches with RFC 3161 trusted timestamps.

## Links

- Website: https://lanveris.net/
- Learn: https://lanveris.net/learn
- Public verifier: https://lanveris.net/verify
- Agent setup instructions: https://lanveris.net/skill.md
- AI/agent crawl summary: https://lanveris.net/llms.txt
- CLI install mirror: https://lanveris.net/install.sh

## Install

Install the latest release:

```sh
curl -fsSL https://raw.githubusercontent.com/lanveris/lanveris-cli/main/install.sh | sh
```

By default the installer downloads the latest release and installs `lanveris` to `~/.local/bin`.

Environment variables:

- `LANVERIS_VERSION`: install a specific release tag, such as `v0.1.0`.
- `LANVERIS_BIN_DIR`: choose an install directory.
- `LANVERIS_CLI_REPO`: override the release repository.

The main product repository is private. This repository only hosts public distribution artifacts.
