./whycommit-commitmsg.hook.sh blah
if [[ "$?" == "0" ]]; then
  echo "Test for nonexistent commit message file failed"
  exit 1
else
  echo "Test for nonexistent commit message file passed"
fi

echo "test bad commit message" > testbadcommit.txt
./whycommit-commitmsg.hook.sh testbadcommit.txt
if [[ "$?" == "0" ]]; then
  echo "Test for nonexistent 'Why' section failed"
  rm testbadcommit.txt
  exit 1
else
  echo "Test for nonexistent 'Why' section passed"
  rm testbadcommit.txt
fi

echo "# test small commit" > testsmallcommit.txt
./whycommit-commitmsg.hook.sh testsmallcommit.txt
if [[ "$?" != "0" ]]; then
  echo "Test for small commit message working correctly failed"
  exit 1
else
  echo "Test for small commit message working correctly passed"
fi

smallCommit=$(cat testsmallcommit.txt)
if [[ "$smallCommit" != "test small commit" ]]; then
  echo "Test for small commit message being uncommented correctly failed"
  rm testsmallcommit.txt
  exit 1
else
  echo "Test for small commit message being uncommented correctly passed"
  rm testsmallcommit.txt
fi

./whycommit-commitmsg.hook.sh whycommit-template.txt
if [[ "$?" != "0" ]]; then
  echo "Test for valid commit message working correctly failed"
  exit 1
else
  echo "Test for valid commit message working correctly passed"
fi
echo "All tests passed successfully."
