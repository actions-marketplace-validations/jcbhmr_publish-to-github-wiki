#!/bin/bash -e

git remote add github-wiki "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY/wiki.git"
ref="$(git subtree split -P "$INPUT_PATH")"
git push -f github-wiki "$ref:master"

# https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables
# GITHUB_SERVER_URL	The URL of the GitHub server. For example: https://github.com.
# GITHUB_REPOSITORY	The owner and repository name. For example, octocat/Hello-World.
#
# https://docs.github.com/en/actions/using-jobs/defining-outputs-for-jobs
# Example: echo "test=world" >> $GITHUB_OUTPUT
echo "page_url=https://github.com/$GITHUB_REPOSITORY/wiki" >> $GITHUB_OUTPUT
