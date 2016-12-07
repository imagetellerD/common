#!/bin/bash

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; pwd`
cd $BASEDIR
echo "run in dir $BASEDIR"

echo "rm gen-cpp ..."
rm gen-cpp -rf

echo "begin to generate cpp code ..."
# 对于所有.thrift文件，生成cpp代码
#find .. -type f -name '*.thrift' -exec thrift -r --gen cpp {} \;
#使用xargs执行的时候，任意的一次执行失败都会有一个非0的返回值
find .. -type f -name '*.thrift' |xargs -n 1 thrift -r --gen cpp
if [ $? -ne 0 ] 
then
	echo "gen cpp failed"
	exit -1
fi

# Finance/finance.thrift 中有一个变量名是errno，在低版本的g++上编译不过，删掉它的文件
rm gen-cpp/Finance* gen-cpp/finance_types.* gen-cpp/finance_constants.*

make

# 替换代码中的include，改为相对路径
find cpp/include/domob_thrift -type f -name "*.h" -exec \
sed  -e 's/^#include "/#include "domob_thrift\//' -i {} \;


if [ $? -ne 0 ] 
then
	echo "make cpp failed"
	exit -1
fi


echo done.
