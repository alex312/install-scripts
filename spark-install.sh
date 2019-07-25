spark_home=$HOME/spark
spark_envFile=$HOME/spark/env
echo 'export SPARK_HOME='$spark_home >> $spark_envFile
echo 'export HADOOP_HOME='$spark_home >> $spark_envFile
echo 'export PATH="$SPARK_HOME/bin:$PATH"' >> $spark_envFile

