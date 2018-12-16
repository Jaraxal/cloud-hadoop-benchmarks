time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teragen \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
-Dmapred.map.output.compress=true \
1000000000 \
/user/cloudbreak/terasort-input-100 >> teragen-results-100.log 2>&1

time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar terasort \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
-Dmapred.map.output.compress=true \
/user/cloudbreak/terasort-input-100 \
/user/cloudbreak/terasort-output-100 >> terasort-results-100.log 2>&1

time hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar teravalidate \
-Dmapred.map.tasks=79 \
-Dmapred.reduce.tasks=79 \
/user/cloudbreak/terasort-output-100 \
/user/cloudbreak/terasort-report-100 >> teravalidate-results-100.log 2>&1
