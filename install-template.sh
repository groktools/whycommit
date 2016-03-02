allRepos=""
if [[ "$1" != "" ]]; then
  allRepos="--global"
fi
cp whycommit-template.txt ~/.whycommitmessage.txt
git config $allRepos commit.template ~/.whycommitmessage.txt
