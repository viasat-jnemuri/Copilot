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