#!/bin/bash
# Brian Williams
# June 23, 2016
# Insert a document into sync gateway
#
TIMENOW=`date +%F-%H%M%S`
KEY=testkey$TIMENOW-.$RANDOM
echo The key is $KEY
curl -v --trace-time http://localhost:4985/db/$KEY -X PUT  -H 'content-type: application/json' -H 'accept: application/json'  --data "{\"_id\":\"$KEY\"}" --compressed; echo
#
# eof
