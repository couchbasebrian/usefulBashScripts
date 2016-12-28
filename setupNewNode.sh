#!/bin/bash
# setupNewCluster.sh 
# Brian Williams 5/18/2016
# Install some commonly used utilities
# including helpful bash scripts
#
echo "--- Installing wget"
yum -y install wget 
echo "--- Installing zlib dependency"
yum -y install zlib-devel
echo "--- Getting Couchbase Repository RPM ---"
wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-2-x86_64.rpm
echo "--- Installing Couchbase Repository RPM ---"
rpm -ivh couchbase-release-1.0-0-x86_64.rpm
echo "--- Installing Couchbase C client ---"
yum -y install libcouchbase-devel libcouchbase2-bin gcc gcc-c++
echo "--- Installing git ---"
yum -y install git
echo "--- Install some utilities"
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
yum -y install telnet 
echo "--- Get the rest of the repository ---"
git clone https://github.com/couchbasebrian/usefulBashScripts.git
echo "--- Set up ruby ---"
yum -y install ruby ruby-devel rubygems
echo "--- Set up couchbase for ruby ---"
gem install couchbase
echo "--- Done Installing ---"
exit 0

