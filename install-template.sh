#!/bin/bash

allRepos=""
if [[ "$1" != "" ]]; then
  allRepos="--global"
fi
git config $allRepos commit.template ~/whyCommit/whycommitmessage.txt
