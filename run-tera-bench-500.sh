time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teragen \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
-Dmapred.map.output.compress=true \
5000000000 \
/user/cloudbreak/terasort-input-500 >> teragen-results-500.log 2>&1

time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar terasort \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
-Dmapred.map.output.compress=true \
/user/cloudbreak/terasort-input-500 \
/user/cloudbreak/terasort-output-500 >> terasort-results-500.log 2>&1

time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teravalidate \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
/user/cloudbreak/terasort-output-500 \
/user/cloudbreak/terasort-report-500 >> teravalidate-results-500.log 2>&1
