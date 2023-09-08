#!/bin/bash
#test
source ~/scripts/opside/config.sh
cd $path
network=pre-alpha
type=-
id=-
version=$(cat ./config/version)

localBlockHeight=$(curl -s http://127.0.0.1:8545 -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":0}' | jq ".result")
remoteBlockHeight=$(curl -s https://pre-alpha-us-http-geth.opside.network -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":0}' | jq ".result")
localBlockHeightNum=${localBlockHeight:3:-1}
remoteBlockHeightNum=${remoteBlockHeight:3:-1}
((localBlockHeightNum=16#$localBlockHeightNum));
((remoteBlockHeightNum=16#$remoteBlockHeightNum));
diffBlockHeight=$(expr $remoteBlockHeightNum - $localBlockHeightNum)

if [ $diffBlockHeight -gt 10 ]
  then
    isSynced=false
    status=error
    note="syncing $localBlockHeightNum/$remoteBlockHeightNum"
  else
    isSynced=true
    status=ok
fi

echo localHeight       =   $localBlockHeightNum
echo remoteHeight      =   $remoteBlockHeightNum
echo isSynced          =   $isSynced
echo status            =   $status
echo note              =   $note
echo network           =   $network
echo type              =   $type
echo id                =   $id
echo version           =   $version