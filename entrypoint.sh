#!/bin/sh -l

echo "Getting next release..."

if [[ -n "${PRERELEASE}" ]]; then
  NEXT=$(cz bump \
    --get-next \
    --prerelease "${PRERELEASE}" \
    --yes)
else
  NEXT=$(cz bump \
    --get-next \
    --yes)
fi

echo "Next release: ${NEXT}"

echo "Getting latest stable release..."

LATEST=$(gh release list \
  --exclude-pre-releases \
  --json isLatest,tagName -q '.[] | select(.isLatest) | .tagName')

echo "Latest stable release: ${LATEST:-n/a}"

echo "Generating changelog..."

if [[ -n "${LATEST}" ]]; then
  cz changelog \
    --file-name ./CHANGELOG.md \
    --start-rev "${LATEST}" \
    --unreleased "${NEXT}"
else
  cz changelog \
    --file-name ./CHANGELOG.md \
    --unreleased "${NEXT}"
fi

echo "Done."

if [[ "${DRY_RUN}" == "true" ]]; then
  echo "Dry run enabled, exiting early..."
  exit 0
fi

echo "Creating release..."

if [[ -n "${PRERELEASE}" ]]; then
  gh release create "${NEXT_VERSION}" \
    --notes-file ./CHANGELOG.md \
    --prerelease \
    --title "${NEXT_VERSION}"
else
  gh release create "${NEXT_VERSION}" \
    --notes-file ./CHANGELOG.md \
    --title "${NEXT_VERSION}"
fi

echo "Done."
