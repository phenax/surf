#!/bin/sh
#
# See the LICENSE file for copyright and license details. 
#

xidfile="/tmp/tabbed-surf.xid"
uri=""

if [ "$#" -gt 0 ]; then
	uri="$1"
fi

runtabbed() { tabbed -n tabbed-surf -r 2 surf -e '' "$uri"; }

if [ ! -r "$xidfile" ];
then
	runtabbed
else
	xid=$(cat "$xidfile")
	xprop -id "$xid" >/dev/null 2>&1
	if [ $? -gt 0 ];
	then
		runtabbed
	else
		surf -e "$xid" "$uri"
	fi
fi

