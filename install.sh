#!/bin/bash

# This runs as root on the server
chef_binary=/usr/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
	apt-get update
	apt-get install curl -y
    curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi &&

"$chef_binary" -c solo.rb -j solo.json
