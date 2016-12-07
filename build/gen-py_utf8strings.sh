#!/bin/bash

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; pwd`

cd $BASEDIR
echo "run in dir $BASEDIR"

echo "rm gen-py ..."
rm gen-py -rf

echo "begin to generate py code ..."

# 对于所有.thrift文件，生成py代码
#find .. -type f -name '*.thrift' -exec thrift -r --gen py:new_style {} \;
#使用xargs执行的时候，任意的一次执行失败都会有一个非0的返回值
find .. -type f -name '*.thrift' |xargs -n 1 /usr/local/domob/prog.d/thrift-0.9.1/bin/thrift --gen py:new_style,utf8strings

if [ $? -ne 0 ] 
then
	echo "gen python failed"
	exit -1
fi

# 代码中可能有中文，声明utf-8编码
find  gen-py -type f -exec \
sed "1i# -*- coding: utf-8 -*-" -i {} \;

echo done.
