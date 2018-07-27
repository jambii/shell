#!/bin/bash
function ks() {
echo "Knife node search results for "${1}":"
knife search "name:*"${1}"*" 
echo "Log into shell? (y/n)"
read reply
case $reply in
  y)
    ssh $(knife search "name:*"${1}"*" -a ipaddress 2> /dev/null | grep ipaddress | awk -F: {'print $2'}) -vv
    ;;
  n)
    exit
    ;;
esac
}
ks $1
