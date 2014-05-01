#!/bin/sh
echo "Deleting all .git repository data from Chef/cookbooks directory ..."
find Chef/cookbooks -depth -type d -name .git -exec rm -rf {} \;
