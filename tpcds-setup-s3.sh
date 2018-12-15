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

# Create the text/flat tables as external tables. These will be later be converted to ORCFile.
echo "Loading text data into external tables."
runcommand "hive -i settings/load-flat.sql -f ddl-tpcds/text/alltables-s3.sql -d DB=tpcds_bin_partitioned_orc_${SCALE} -d LOCATION=${DIR}"
echo "Data loaded into database ${DB}."

echo "Analyzing tables."
runcommand "hive -i settings/load-flat.sql -f ddl-tpcds/text/analyze_everything.sql -d DB=tpcds_bin_partitioned_orc_${SCALE}"
echo "Tables analyzed."