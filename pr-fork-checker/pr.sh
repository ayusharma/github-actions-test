#!/bin/sh -l
set -e
set -o pipefail

# Find out if pull request is a fork. If it's not, we are all set.
FORK=`jq .pull_request.head.repo.fork "$GITHUB_EVENT_PATH"`
if [[ "$FORK" == "false" ]]; then
  echo "Pull request not from fork. Code already checked out correctly"
  exit 78
fi