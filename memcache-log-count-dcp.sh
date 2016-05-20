#!/bin/bash
FILE=$1
echo Looking at $FILE
if [ -r $FILE ]
then
  echo Reading $FILE...
  #
  LINES=`cat $FILE | wc -l `
  DCP=`grep dcp $FILE | wc -l`
  BACKFILL=`grep dcp $FILE | grep Backfill | wc -l`
  CREATESTREAM=`grep dcp $FILE | grep "Creating stream" | wc -l`
  CREATETOSTREAM=`grep dcp $FILE | grep "Creating takeover stream" | wc -l`
  STREAMCREATED=`grep dcp $FILE | grep "stream created!" | wc -l`
  SENDINGDS=`grep dcp $FILE | grep "Sending disk snapshot" | wc -l`
  DEADSTATE=`grep dcp $FILE | grep "Setting stream to dead state" | wc -l`
  CFCB=`grep dcp $FILE | grep "Conn flow control buffer" | wc -l`
  RR=`grep dcp $FILE | grep "Received response" | wc -l`
  VBD=`grep dcp $FILE | grep "Vbucket marked as dead" | wc -l`
  SDDC=`grep dcp $FILE | grep "Shutting down dcp connections" | wc -l`
  ATA=`grep dcp $FILE | grep "Attempting to add" | wc -l`
  STC=`grep dcp $FILE | grep "Stream closing" | wc -l`
  STCR0=`grep dcp $FILE | grep "Stream created with start seqno 0 and" | wc -l`
  #
  VBU=`grep dcp $FILE | grep vb | cut -f7- -d":" | cut -f2- -d"(" | cut -f1 -d")" | sort -u | wc -l`
  #
  echo "Total lines in this log file                :  $LINES"
  echo "Total dcp lines                             :  $DCP"
  echo "Total Stream Created!                       :  $STREAMCREATED"
  echo "Total Create Stream                         :  $CREATESTREAM"
  echo "Total Stream closing                        :  $STC"
  echo "Total Backfill                              :  $BACKFILL"
  echo "Total dead state                            :  $DEADSTATE"
  echo "Total Attempting to add                     :  $ATA"
  echo "Total Sending disk snapshot                 :  $SENDINGDS"
  echo "Total Create Takeover Stream                :  $CREATETOSTREAM"
  echo "Total Vbucket marked as dead                :  $VBD"
  echo "Total Conn flow control buffer              :  $CFCB"
  echo "Total Received response                     :  $RR"
  echo "Total Shutting down dcp connections         :  $SDDC"
  echo "Total Stream created with start seqno 0 and :  $STCR0"
  ACCOUNTEDFOR=$((BACKFILL + CREATESTREAM + STREAMCREATED + CREATETOSTREAM + SENDINGDS + DEADSTATE + CFCB + RR + VBD + SDDC + ATA + STC + STCR0))
  UNACCOUNTED=$((DCP - ACCOUNTEDFOR))
  echo "Total Accounted for                   :  $ACCOUNTEDFOR"
  echo "Total Unaccounted for                 :  $UNACCOUNTED"
  echo "Total unique vbs mentioned            :  $VBU"
else
  echo Could not read $FILE
fi
