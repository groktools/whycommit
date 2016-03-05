allRepos=%1
if not defined allRepos ( set allRepos="--global" )

copy .\whycommit-template.txt %USERPROFILE%\.whycommitmessage.txt
git config %allRepos% commit.template %USERPROFILE%\.whycommitmessage.txt
