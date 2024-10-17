# Yes, you can run PySpark without using an Azure subscription. PySpark can be run locally on your machine or on other cloud platforms. Here are the steps to run PySpark locally:
# # Install PySpark
# You can install PySpark using pip:  
# ```
brew install openjdk@11
brew install apache-spark
brew install python
# This script installs the Finbar application using Homebrew.
# Homebrew is a package manager for macOS that simplifies the installation of software.
# The '--cask' option is used to install GUI applications.
brew install --cask finbar # or 
brew install finbar
brew install findspark
pip install pyspark
# ```
# # Set up the environment
# You need to set up the environment variables to run PySpark. You can do this by adding the following lines to your `.bashrc` or `.bash_profile` file:
# ```
export SPARK_HOME=/usr/local/Cellar/apache-spark/3.2.0/libexec
export PATH=$SPARK_HOME/bin:$PATH
export PYSPARK_PYTHON=/usr/local/bin/python3
export PYSPARK_DRIVER_PYTHON=/usr/local/bin/python3
# ```
# # Run PySpark
# You can run PySpark by running the following command:
# ```
pyspark
# ```
# This will start the PySpark shell, and you can start writing PySpark code in the shell. You can also run PySpark scripts by using the `spark-submit` command. For example:
# ```
spark-submit my_script.py
# ```
# This will run the PySpark script `my_script.py` using the PySpark engine. You can also run PySpark in Jupyter notebooks by installing the `pyspark` kernel. You can do this by running the following command: 
# ```
pip install jupyter
pip install jupyter-spark
jupyter notebook
# ```
# This will start a Jupyter notebook server, and you can create a new notebook with the `pyspark` kernel to run PySpark code in the notebook.
# # Conclusion
# You can run PySpark locally on your machine without using an Azure subscription. You can install PySpark using pip, set up the environment variables, and run PySpark using the `pyspark` command. You can also run PySpark scripts using the `spark-submit` command and run PySpark in Jupyter notebooks by installing the `pyspark` kernel.
# # References
# - [PySpark Installation](https://spark.apache.org/docs/latest/api/python/getting_started/install.html)
# - [PySpark Quick Start](https://spark.apache.org/docs/latest/api/python/getting_started/quickstart.html)
# - [PySpark Programming Guide](https://spark.apache.org/docs/latest/api/python/getting_started/index.html)
# - [Jupyter Spark](
#
# ) 
# - [PySpark on Jupyter Notebook](https://towardsdatascience.com/pyspark-in-jupyter-3a587f0e7f32)

#```
#Example of running PySpark locally without using an Azure subscription:
#```



# Import the required libraries
from pyspark.sql import SparkSession

# Initialize a Spark session
spark = SparkSession.builder.appName("LocalApp").getOrCreate()

# Define storage URL and file paths
storage_url = 'file:///path/to/local/storage'
file_path = 'data'
Input_Oeogo = 'oeog0.parquet'
Input_oe_order = 'oe_order.parquet'
Input_PAG0_Project_Class = 'project_class.parquet'
Input_PAGO_Projects = 'projects.parquet'
Input_allrepairorder = 'allrepairorder.csv'

# Reading inputs from local storage
oeog0_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_Oeogo}')
oe_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_oe_order}')
Project_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_PAG0_Project_Class}')
pago_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_PAGO_Projects}')
allrepair_df = spark.read.csv(f'{storage_url}/{file_path}/{Input_allrepairorder}', header='true', inferSchema=True)

# Show the dataframes
oeog0_df.show()
oe_df.show()
Project_df.show()
pago_df.show()
allrepair_df.show()