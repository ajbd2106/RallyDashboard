#!/bin/bash

SPARK_PATH=$SPARK_HOME

APP_NAME="[Spark App] Change this with your app name."
SPARK_MASTER="yarn"
SPARK_EXECUTOR_CORES="2"
SPARK_DRIVER_MEMORY="2g"
SPARK_EXECUTOR_MEMORY="2g"
SPARK_EXECUTOR_INSTANCES="2"

$SPARK_PATH/spark-submit \
	--master yarn \
	--deploy-mode cluster \
	--conf "spark.app.name=$APP_NAME" \
	--conf "spark.master=$SPARK_MASTER" \
	--conf "spark.executor.cores=$SPARK_EXECUTOR_CORES" \
	--conf "spark.driver.memory=$SPARK_DRIVER_MEMORY" \
	--conf "spark.executor.memory=$SPARK_EXECUTOR_MEMORY" \
	--conf "spark.executor.instances=$SPARK_EXECUTOR_INSTANCES" \
	--jars sqljdbc42.jar \
	--driver-class-path sqljdbc42.jar \
	--py-files src.zip \
    main.py