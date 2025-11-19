# Release Action

This action:
- calculates next version number using **commitizen**,
- creates release using **GitHub CLI**.

## Usage

Here's an example of how to use this action in a workflow file:

```yaml
name: Example Workflow

on:
  workflow_dispatch:

permissions:
  contents: write

jobs:
  release-beta:
    name: Release beta version
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v5
        with:
          fetch-depth: 0
      - uses: actions/setup-python@v6
        with:
          python-version: 3.13
      - id: release
        uses: przemekk1385/release-action@main
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          prerelease: beta
      - run: |
          echo "Released version: ${{ steps.release.outputs.version }}"
```

## Inputs

| Input          | Default | Description                                                 |
|----------------|---------|-------------------------------------------------------------|
| `github-token` | `""`    | GitHub token                                                |
| `dry-run`      | `false` | If true, the action will only simulate the release creation |
| `prerelease`   | `""`    | Pre-release identifier (e.g., alpha, beta)                  |

## Outputs

| Output    | Description             |
|-----------| ----------------------- |
| `version` | Released version number |
