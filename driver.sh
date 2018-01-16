#!/bin/bash

tar xzvf flinkML.tar

cd flinkML

mvn clean install -Pbuild-jar

export PATH=/usr/local/flink/bin:$PATH
export PATH=/usr/local/jdk1.8.0_40/bin:$PATH

flink run -m yarn-cluster -yn 1 \
-c ml.task1 \
target/ml-1.0-SNAPSHOT.jar \
--input1 hdfs:///share/cytometry/large/ \
--input2 hdfs:///share/cytometry/experiments.csv \
--output hdfs:///user/szha5691/assignment2TrueFinal/task1


flink run -m yarn-cluster -yn 1 \
-c ml.task2 \
target/ml-1.0-SNAPSHOT.jar \
--input1 hdfs:///share/cytometry/large/ \
--output hdfs:///user/szha5691/assignment2TrueFinal/task2


flink run -m yarn-cluster -yn 1 \
-c ml.task3 \
target/ml-1.0-SNAPSHOT.jar \
--input1 hdfs:///share/cytometry/large/ \
--output hdfs:///user/szha5691/assignment2TrueFinal/task3

