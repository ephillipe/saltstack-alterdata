@echo off
git add .
git commit -a -m "%~1"
git push --progress  "origin" master:master