time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teragen \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
-Dmapred.map.output.compress=true \
500000000 \
/user/cloudbreak/terasort-input-50 >> teragen-results-50.log 2>&1

time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar terasort \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
-Dmapred.map.output.compress=true \
/user/cloudbreak/terasort-input-50 \
/user/cloudbreak/terasort-output-50 >> terasort-results-50.log 2>&1

time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teravalidate \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
/user/cloudbreak/terasort-output-50 \
/user/cloudbreak/terasort-report-50 >> teravalidate-results-50.log 2>&1
