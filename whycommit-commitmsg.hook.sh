#!/usr/bin/env bash

if [[ -e "$1" ]]; then
  commitText=$(cat $1)
  whyCommitRegex="(.+)
(Why
---
.*)
(What.*)"

  # if the commit message has a why section
  if [[ $commitText =~ $whyCommitRegex ]]; then
    # echo title: ${BASH_REMATCH[1]}
    # echo why: ${BASH_REMATCH[2]}
    exit 0
  else
    # .. or if its a minor commit, let the commit happen.
    minorCommitRegex="^#(.*)$"
    if [[ $commitText =~ $minorCommitRegex ]]; then
      echo ${BASH_REMATCH[1]} > "$1"
      exit 0
    # ... but if its neither, abort the commit.
    else
      echo "Please use the commit commitText and add a 'Why' section to your commit message."
      exit 1
    fi
  fi
else
  echo $1 does not exist.
  exit 2
fi
