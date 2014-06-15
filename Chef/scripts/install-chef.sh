#!/usr/bin/env bash

# Check if chef client is already installed
if ! type "chef-client" > /dev/null; then
    # if not install it here
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi
