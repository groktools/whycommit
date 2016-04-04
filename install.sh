if [[ ! -d ~/whyCommit ]]; then
  mkdir ~/whyCommit
fi

cp ./install-template.sh ~/whyCommit/install-template
cp ./install-hook.sh ~/whyCommit/install-hook

cp whycommit-template.txt ~/whyCommit/whycommitmessage.txt
if [[ ! -e ~/.bash_profile ]]; then
  touch ~/.bash_profile
else
  cp ~/.bash_profile ~/.bash_profile.bak
fi
echo 'export PATH=$PATH:~/whyCommit' >> ~/.bash_profile
. ~/.bash_profile
