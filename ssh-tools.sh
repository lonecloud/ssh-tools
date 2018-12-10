#/bin/bash
echo 请选择你的机器列表
# define BASE PATH
BASE_PATH=$(dirname "$0")
# 定义数据相关的文件
DATA_FILE=$BASE_PATH/data/ssh.dat
# 定义执行ssh的文件
DIRECT_FILE=$BASE_PATH/exp/direct.exp
STEP_FILE=$BASE_PATH/exp/step.exp
TYPE_ARR=($(awk '{print $1}' $DATA_FILE))
HOST_ARR=($(awk '{print $2}' $DATA_FILE))
PASS_ARR=($(awk '{print $3}' $DATA_FILE))
FORWARD_ARR=($(awk 'BEGIN {i=0}{if($1 !~ /^#/) i+=1} END {print $3}' $DATA_FILE))
FORWARD_ARR=($(awk 'BEGIN {i=0}{if($1 !~ /^#/) i+=1} END {print $4}' $DATA_FILE))
DEFAULT_TYPE=$1
DEFAULT_SOURCE=$2
DEFAULT_TARGET=$3
TEMP_ADDR="roo@127.0.0.1 22"
# def for host
function splitAddr(){
  address=$1
  arr=(${address//:/ })
  if [[ ${#arr[@]} -eq 2  ]]; then
    TEMP_ADDR="${arr[0]} ${arr[1]}"
  else
    TEMP_ADDR="${arr[0]} 22"
  fi
}
# 用于打印服务器列表
function printList(){
  for (( i = 0; i < $arr_len; i++ )); do
    if [[ ${TYPE_ARR[$i]} -eq $1 ]]; then
      echo "$i ${HOST_ARR[$i]}"
    fi
  done
  echo 请输入你需要直接进入的服务器
}
# 直接连接的函数   
function direct()
{
    if [[ -n $DEFAULT_SOURCE ]]; then
      select=$DEFAULT_SOURCE
      # using split port
      splitAddr ${HOST_ARR[$select]};
      expect $DIRECT_FILE $TEMP_ADDR ${PASS_ARR[$select]}
    else
      printList 0
      read select
      if [[ ${arr_len} -gt $select ]]; then
        # 直接连接的机器
        echo 正在连接服务器 ${HOST_ARR[$select]}
        splitAddr ${HOST_ARR[$select]}
        expect $DIRECT_FILE $TEMP_ADDR ${PASS_ARR[$select]}
      else
        echo 输入的数字不正确
      fi   
    fi
}
# 跳板机
function step(){
  if [[ -n $DEFAULT_SOURCE ]]; then
    select=$DEFAULT_SOURCE
    splitAddr ${HOST_ARR[$select]}
    SOURCE_ADDR=$TEMP_ADDR
    target=$DEFAULT_TARGET
    splitAddr ${HOST_ARR[$target]}
    TARGET_ADDR=$TEMP_ADDR
    expect $STEP_FILE  $SOURCE_ADDR ${PASS_ARR[$select]} ${TARGET_ADDR} ${PASS_ARR[$target]} 
  else
    echo '选择跳板机'
    printList 1
    read select
    if [[ ${arr_len} -gt $select ]]; then
        printList 2
        read   -p "选择目标机:" target
        # 直接连接的机器
        if [[ ${TYPE_ARR[$target]} -eq 2 ]]; then
          splitAddr ${HOST_ARR[$select]}
          SOURCE_ADDR=$TEMP_ADDR
          splitAddr ${HOST_ARR[$target]}
          TARGET_ADDR=$TEMP_ADDR
          echo 正在连接服务器 ${HOST_ARR[$select]}
          expect $STEP_FILE $SOURCE_ADDR ${PASS_ARR[$select]} $TARGET_ADDR ${PASS_ARR[$target]}
        fi
    else
        echo 输入的数字不正确
    fi
  fi
}
# fefault type
arr_len=${#HOST_ARR[@]} 
if [[ -n $DEFAULT_TYPE ]]; then
  type=$DEFAULT_TYPE
else
  echo "请选择连接的类型：1直接连接，2 跳板"
  read type
fi
case "$type" in
    "1")
       direct 
       ;;
    "2")
       step 
       ;;
    *)
       #其它输入
       echo "output error,please input 1/2/2"
       ;;
esac

