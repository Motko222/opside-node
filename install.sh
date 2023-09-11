#!/bin/bash

wget -c https://pre-alpha-download.opside.network/testnet-auto-install-v3.tar.gz
tar -C ./ -xzf testnet-auto-install-v3.tar.gz
rm testnet-auto-install-v3.tar.gz
chmod +x -R ./testnet-auto-install-v3
cd ./testnet-auto-install-v3
./install-ubuntu-1.0.sh