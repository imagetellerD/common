#!/bin/bash

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; pwd`

cd $BASEDIR
echo "run in dir $BASEDIR"

echo "rm gen-php ..."
rm gen-php -rf

echo "begin to generate php code ..."
# 对于所有.thrift文件，生成php代码
#find .. -type f -name '*.thrift' -exec thrift -r --gen php {} \;
#使用xargs执行的时候，任意的一次执行失败都会有一个非0的返回值
/usr/local/domob/prog.d/thrift-0.9.1/bin/thrift -r --gen php ../RTB/rtb_model_server.thrift
if [ $? -ne 0 ] 
then
	echo "gen php failed"
	exit -1
fi

# 替换代码中的include，改为相对路径
find gen-php -type f -exec \
sed  -e "s/\\\$GLOBALS\['THRIFT_ROOT'\].'\/packages/dirname(__FILE__).'\/../" -i {} \;

echo done.
