#!/bin/bash -e
# 1. Copy the folder to a temp folder.
# 2. Commit everything!
# 3. Force push to the remote .wiki.git repo on GitHub.
# 4. Set the output page_url variable to the wiki URL

# 1.
temp_dir="$(mktemp -d)"
cp -vr "$INPUT_PATH" "$temp_dir"
cd "$temp_dir/$INPUT_PATH"

# 2.
git init -b master
# https://github.com/stefanzweifel/git-auto-commit-action/blob/master/action.yml
git config --local user.name "github-actions[bot]"
git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add -A
git commit -m jcbhmr/deploy-wiki

# 3.
# GitHub auth is user:token@github.com, not token@github.com!
git remote add wiki "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
git push -f wiki master

# 4.
echo "page_url=https://github.com/$GITHUB_REPOSITORY/wiki" >> $GITHUB_OUTPUT
