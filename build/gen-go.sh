#!/bin/bash

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; pwd`

cd $BASEDIR
echo "run in dir $BASEDIR"

echo "rm gen-go ..."
rm gen-go -rf

echo "begin to generate go code ..."

# 对于所有.thrift文件，生成py代码
#find .. -type f -name '*.thrift' -exec thrift -r --gen py:new_style {} \;
#使用xargs执行的时候，任意的一次执行失败都会有一个非0的返回值
find .. -type f -name '*.thrift' |xargs -n 1 /usr/local/domob/current/thrift/bin/thrift -nowarn --gen go:package_prefix=gen_go/

if [ $? -ne 0 ] 
then
	echo "gen go failed"
	exit -1
fi

echo done.
