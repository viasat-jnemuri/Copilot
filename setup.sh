#!/bin/bash 

#setup python path
PYTHON_PATH=/usr/local/bin/python3
export PYSPARK_PYTHON=$PYTHON_PATH
export PYSPARK_DRIVER_PYTHON=$PYTHON_PATH

#setup spark home path
