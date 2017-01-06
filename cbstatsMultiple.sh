#!/bin/bash
# Check cbstats timings for multiple nodes and buckets
# Write the results to a file
# Reset the cbstats when finished
#
#
# You can list your nodes here, one per line
NODELIST="localhost
"
#
# You can list your buckets here, one per line
BUCKETLIST="BUCKETNAME
"
#
TIMENOW=`date +%F-%H%M%S`
echo "Time now is $TIMENOW"
#
for eachNode in $NODELIST 
do
  echo "Working on node $eachNode"
  for eachBucket in $BUCKETLIST
  do
    echo " Working on bucket $eachBucket"
    OUTPUTFILE=timings-$eachNode-$eachBucket-$TIMENOW.txt
    /opt/couchbase/bin/cbstats $eachNode:11210 -b $eachBucket timings > $OUTPUTFILE 2>&1
    /opt/couchbase/bin/cbstats $eachNode:11210 -b $eachBucket reset 
  done
done
#
echo "Done.  Goodbye."
exit 0
# eof
