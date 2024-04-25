#!/bin/sh
# sh restart.sh

# 设置全局变量
# git代码仓库路径
GIT_DIR="/home/source/jenkins-test"
# git代码分支
GIT_BRANCH="main"
# jar包名称
JAR_NAME="jenkins-test-0.0.1-SNAPSHOT.jar"
# jar包要启动的路径
WORK_DIR="/home/app/test"
# jar运行的端口
PORT=9091

#git clone https://github.com/nhjclxc/jenkins-test.git

# 1、进入后端代码的git路径，拉取最新的代码
# 进入工作目录
cd $GIT_DIR
# 进入指定分支
git checkout $GIT_BRANCH
# 更新代码 git pull origin master
git pull

# 2、mvn clean package
mvn clean package

# 3、将jar包移动到项目运行路径
cp -f target/$JAR_NAME $WORK_DIR

# 4、进入jar启动路径
cd $WORK_DIR

# 5、停止原有项目
sleep 1
PID=""
query(){
  PID=`lsof -i:$PORT |grep java |awk '{print $2}'`  #获取项目进程号 ，其中8082表示jar包运行的端口号
}

query
if [ x"$PID" != x"" ]; then
  kill -9 $PID
  echo "$JAR_NAME (pid:$PID) exiting..."
  echo "$JAR_NAME exited."
else
  echo "$JAR_NAME already stopped."
fi


# 6、启动新项目
sleep 1
nohup java -jar $JAR_NAME --spring.profiles.active=test > nohup.out 2>&1 &

sleep 0.5
echo "$JAR_NAME starting."
sleep 0.5
echo "$JAR_NAME starting.."
sleep 0.5
echo "$JAR_NAME starting..."
