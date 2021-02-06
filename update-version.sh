#!/bin/sh

set -euo pipefail

export GIT_AUTHOR_NAME="Automation"
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_AUTHOR_EMAIL="automation@backtick.net"
export GUT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
URL=https://api.github.com/repos/dolthub/dolt/releases/latest

header=
if [ -n "${GITHUB_TOKEN:-}" ]; then
    header="authorization: Bearer ${GITHUB_TOKEN}"
fi

latest=$(curl --silent --header "${header}" $URL | jq -er .tag_name)
previous=$(cat version)

if [ "${latest}" = "${previous}" ]; then
    exit 0
fi

echo "${latest}" > version
sed -i "/ARG VERSION=/ s/=.*/=${latest}/" Dockerfile
git add Dockerfile version
git commit -m "Dockerfile: bump Dolt to ${latest}"
git tag -a "${latest}" -m "Dolt ${latest}"
git push origin main "${latest}"
