#!/usr/bin

git checkout master

git add -A

echo -e 'Please input the commit message: \C'
read message

git commit -am ":rocket:${message}"

git push origin HEAD:dev


