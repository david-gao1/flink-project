#!/usr/bin/env bash
#set config path
time=$(date "+%Y-%m-%d %H:%M:%S")

USER_RUN_HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "$time get use run home : $USER_RUN_HOME"




### 参数1、2：jar_path
file_path=$1
file_name=$2
jar_path=${USER_RUN_HOME}/flink-1.16.1/tmp/flink_user_jar
echo "$time user jar home dir: $jar_path" 
if [ ! -d "$jar_path" ]; then
    mkdir -p "$jar_path"
    echo "user jar local dir: $directory created."
fi
if [ "$(ls -A "$jar_path")" ]; then
    rm -rf "$jar_path"/*
    echo "old user jar local in $directory deleted."
fi
prepare_download=$?
if [ $prepare_download -ne 0 ];then
    exit $prepare_download
fi
echo "Preparing to download user jar locally."
wget -P $jar_path $file_path
success_download=$?
if [ $success_download -ne 0 ];then
    echo "Download failed."
    exit $success_download
fi
echo "File downloaded successfully, preparing to run the user's Flink job."


job_run_mode="yarn-per-job"
#if test ${3} && test ${3} != "null" ;then
#  job_run_mode=$3
#  echo "$time INFO: set yarn run mode :${job_run_mode}"  
#fi  


###参数3


jar_class_name=$3
echo "$time INFO: set user class name :${jar_class_name}"  


###param 4
job_params=""
if test "${4}" && test "${4}" != "null" ;then
  job_params=${4}
  # --kafka-topic ggggggggggg --brokers localhost:1111
  echo "$time INFO: get job params :${job_params}"
fi   




###参数5
randomstr=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)    
yarn_job_name="flink_user_jar_job_${randomstr}"
if test ${5} && test ${5} != "null" ;then
  yarn_job_name="${5}"
  echo "$time INFO: set yarn job name :${yarn_job_name}"  
fi   

###param 6
yarn_queue_name="logsget"
if test ${6} && test ${6} != "null" ;then
  yarn_queue_name="${6}"
  echo "$time INFO: set yarn_queue_name :${yarn_queue_name}"
fi  



/bin/bash ${USER_RUN_HOME}/flink-1.16.1/bin/flink run \
  -d  \
  -m yarn-cluster \
  -ynm ${yarn_job_name} \
  -yqu ${yarn_queue_name} \
  --target ${job_run_mode} \
  -c ${jar_class_name} \
   ${jar_path}/${file_name}  ${job_params}




#  /data01/chunjun-master-dev/flink-1.16.1/examples/streaming/StateMachineExample.jar





