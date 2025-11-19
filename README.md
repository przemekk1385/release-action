# Release Action

This action calculates the next version number using **commitizen** and creates release using **GitHub CLI**.

## Usage

Here's an example of how to use this action in a workflow file:

```yaml
name: Example Workflow

on:
  workflow_dispatch:

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
          prerelease: beta
```
