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
      - id: release
        uses: actions/hello-world-docker-action@main
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          prerelease: beta
```
