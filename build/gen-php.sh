#!/bin/bash

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; pwd`

cd $BASEDIR
echo "run in dir $BASEDIR"

echo "rm gen-php ..."
rm gen-php -rf
rm gen-php.tar.gz

mkdir gen-php
echo "begin to generate php code ..."

# 对于所有.thrift文件，生成php代码
#find .. -type f -name '*.thrift' -exec thrift -r --gen py:new_style {} \;
#使用xargs执行的时候，任意的一次执行失败都会有一个非0的返回值
find ../OMG -type f -name '*.thrift'| sort |xargs -n 1 /usr/local/domob/current/thrift/bin/thrift -nowarn --gen php -out gen-php

#find ../Common -type f -name '*.thrift' |xargs -n 1 /usr/local/domob/current/thrift/bin/thrift -nowarn --gen php -out gen-php

if [ $? -ne 0 ] 
then
	echo "gen php failed"
	exit -1
fi

tar zcvf gen-php.tar.gz gen-php

echo done.
