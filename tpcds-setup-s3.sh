#!/bin/bash
# This script is a modification of the tpcds-setup.sh script.  The idea is that
# you have previously run the tpcds-setup.sh to generate the data files on HDFS
# and have subsequently copied those files to S3.  This script will create
# external tables which point to the ORC file locations you have copied to S3.

function usage {
	echo "Usage: tpcds-setup.sh scale_factor s3_warehouse_location"
	exit 1
}

function runcommand {
	if [ "X$DEBUG_SCRIPT" != "X" ]; then
		$1
	else
		$1 2>/dev/null
	fi
}

if [ ! -f tpcds-gen/target/tpcds-gen-1.0-SNAPSHOT.jar ]; then
	echo "Please build the data generator with ./tpcds-build.sh first"
	exit 1
fi
which hive > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Script must be run where Hive is installed"
	exit 1
fi

# Get the parameters.
SCALE=$1
DIR=$2

if [ "X$DEBUG_SCRIPT" != "X" ]; then
	set -x
fi

# Sanity checking.
if [ X"$SCALE" = "X" ]; then
	usage
fi

if [ X"$DIR" = "X" ]; then
    echo "You must specify the S3 bucket location."
	exit 1
fi

if [ $SCALE -eq 1 ]; then
	echo "Scale factor must be greater than 1"
	exit 1
fi

# Tables in the TPC-DS schema.
DIMS="date_dim time_dim item customer customer_demographics household_demographics customer_address store promotion warehouse ship_mode reason income_band call_center web_page catalog_page web_site"
FACTS="store_sales store_returns web_sales web_returns catalog_sales catalog_returns inventory"

# Create the partitioned and bucketed tables.
if [ "X$FORMAT" = "X" ]; then
	FORMAT=orc
fi

LOAD_FILE="load_${FORMAT}_${SCALE}.mk"
SILENCE="2> /dev/null 1> /dev/null" 
if [ "X$DEBUG_SCRIPT" != "X" ]; then
	SILENCE=""
fi

echo -e "all: ${DIMS} ${FACTS}" > $LOAD_FILE

i=1
total=24
DATABASE=tpcds_bin_partitioned_${FORMAT}_${SCALE}
MAX_REDUCERS=2500 # maximum number of useful reducers for any scale 
REDUCERS=$((test ${SCALE} -gt ${MAX_REDUCERS} && echo ${MAX_REDUCERS}) || echo ${SCALE})

# Populate the smaller tables.
for t in ${DIMS}
do
	COMMAND="hive -i settings/load-partitioned.sql -f ddl-tpcds/s3/${t}.sql \
	    -d DB=tpcds_bin_partitioned_${FORMAT}_${SCALE} \
        -d SCALE=${SCALE} \
	    -d REDUCERS=${REDUCERS} \
		-d LOCATION=${DIR}"
	echo -e "${t}:\n\t@$COMMAND $SILENCE && echo 'Optimizing table $t ($i/$total).'" >> $LOAD_FILE
	i=`expr $i + 1`
done

for t in ${FACTS}
do
	COMMAND="hive -i settings/load-partitioned.sql -f ddl-tpcds/s3/${t}.sql \
	    -d DB=tpcds_bin_partitioned_${FORMAT}_${SCALE} \
        -d SCALE=${SCALE} \
	    -d BUCKETS=${BUCKETS} \
	    -d RETURN_BUCKETS=${RETURN_BUCKETS} \
		-d REDUCERS=${REDUCERS} \
		-d LOCATION=${DIR}"
	echo -e "${t}:\n\t@$COMMAND $SILENCE && echo 'Optimizing table $t ($i/$total).'" >> $LOAD_FILE
	i=`expr $i + 1`
done

make -j 2 -f $LOAD_FILE

echo "Data loaded into database ${DATABASE}."
