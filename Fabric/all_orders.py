from pyspark.sql import SparkSession
from pyspark.sql.functions import col, substring, when, lit, isnull, upper, max, current_date, current_timestamp, expr

# Dynamic Parameters which are populated during pipeline run
storage_url = ''
file_path = ''
Input_Oeogo = ''
Input_oe_order = ''
Input_PAG0_Project_Class = ''
Input_PAGO_Projects = ''
Input_allrepairorder = ''

# SQL server parameters
jdbc_hostname = ''
jdbc_port = ''
jdbc_database = ''
jdbc_username = ''
azure_key_vault_name = ''
secret_key = ''
linked_service_name = ''

# Initialize a Spark session with the LEGACY int96RebaseModeInRead configuration
spark = SparkSession.builder.appName("YourAppName") \
    .config("spark.sql.parquet.int96RebaseModeInRead", "LEGACY") \
    .getOrCreate()

# Reading inputs from BLOB
oeog0_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_Oeogo}')
oe_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_oe_order}')
Project_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_PAG0_Project_Class}')
pago_df = spark.read.parquet(f'{storage_url}/{file_path}/{Input_PAGO_Projects}')
allrepair_df = spark.read.csv(f'{storage_url}/all-repair-orders/output/{Input_allrepairorder}', header='true', inferSchema=True)

# Function to remove '_' and apply Initcaps
def initcapsremoveunderscore(df):
    transformed_columns = [
        col(column).alias(column.title().replace("_", " "))
        for column in df.columns
    ]
    transformed_df = df.select(*transformed_columns)
    return transformed_df

oeog0_df = initcapsremoveunderscore(oeog0_df)
Project_df = initcapsremoveunderscore(Project_df)
pago_df = initcapsremoveunderscore(pago_df)

# Selecting required columns and renaming
oeog0_select_df = oeog0_df.select(
    'Bill To Customer Name', 'Cost Group Item Cost', 'Customer Po Number', 'Head$Program Manager', 'Header Ship From Org',
    'Item Description', 'Item Number', 'Line Creation Date', 'Line Number', 'Line Quantity', 'Line Ship From Org',
    'Line Status', 'Om Or Pc', 'Open Line Quantity', 'Order Booked Date', 'Order Created By', 'Order Created Date',
    'Order Number', 'Order Status', 'Order Type Name', 'Project Number', 'Promised Date', 'Requested Date',
    'Scheduled Ship Date', 'Ship From Location', 'Ship To Customer Name', 'Shipped Quantity', 'Sold To Customer Name',
    'Task Number', 'Unit Selling Price', 'Uom'
).withColumnRenamed('Head$Program Manager', 'Program Manager') \
 .withColumn('Line Creation Date', col('Line Creation Date').cast('Date')) \
 .withColumn('Cost Group Item Cost', col('Cost Group Item Cost').cast('string')) \
 .withColumn('Open Line Quantity', col('Open Line Quantity').cast('string')) \
 .withColumn('Order Booked Date', col('Order Booked Date').cast('string')) \
 .withColumn('Order Created Date', col('Order Created Date').cast('string')) \
 .withColumn('Promised Date', col('Promised Date').cast('string')) \
 .withColumn('Requested Date', col('Requested Date').cast('string')) \
 .withColumn('Scheduled Ship Date', col('Scheduled Ship Date').cast('string')) \
 .withColumn('Shipped Quantity', col('Shipped Quantity').cast('string')) \
 .withColumn('Unit Selling Price', col('Unit Selling Price').cast('string'))

# Filtering by dates
df_filtered = oeog0_select_df.filter((col("Order Created Date") >= "2016-01-01") & (col("Order Created Date") <= current_date()))

# Left joining
LeftJoin_df = df_filtered.join(oe_df, on=[col("Order Number") == col("ORDER_NUMBER")], how="left").drop('ORDER_NUMBER')

# Apply formula
formula_df = LeftJoin_df.withColumn("Order Created Date",
                   when(col("Om Or Pc") == "Order Management", col("CREATION_DATE"))
                   .otherwise(col("Order Created Date")))

# Left joining with input 3
Project_df = Project_df.withColumnRenamed('Project Number', 'Right_Project Number')
LeftJoin_df2 = formula_df.join(Project_df, on=[col("Project Number") == col("Right_Project Number")], how="left")

# Apply formula
formula_df2 = LeftJoin_df2.withColumn("Product Line Business Area",
                   when(col("Line Ship From Org").isin("75", "76"), "AS")
                   .when(isnull(col("Product Line Business Area")), "Unknown")
                   .otherwise(col("Product Line Business Area"))) \
                   .withColumn("Product Line",
                   when(isnull(col("Product Line")), "Unknown")
                   .otherwise(col("Product Line"))) \
                   .withColumn("Bill To Customer Name",
                   when(isnull(col("Bill To Customer Name")), col("Ship To Customer Name"))
                   .otherwise(col("Bill To Customer Name"))) \
                   .withColumn("Bill To Customer Name",
                   when(isnull(col("Bill To Customer Name")), col("Sold To Customer Name"))
                   .otherwise(col("Bill To Customer Name")))

# Renaming columns
renaming_Df = formula_df2.withColumnRenamed('Bill To Customer Name', 'customer_bill') \
                        .withColumnRenamed('Customer Po Number', 'customer_po') \
                        .withColumnRenamed('Item Number', 'item_number') \
                        .withColumnRenamed('Line Creation Date', 'line_create_date') \
                        .withColumnRenamed('Line Number', 'line_number') \
                        .withColumnRenamed('Line Quantity', 'line_qty') \
                        .withColumnRenamed('Line Ship From Org', 'org') \
                        .withColumnRenamed('Line Status', 'line_status') \
                        .withColumnRenamed('Om Or Pc', 'order_type') \
                        .withColumnRenamed('Order Booked Date', 'order_booked_date') \
                        .withColumnRenamed('Order Created By', 'created_by') \
                        .withColumnRenamed('Order Created Date', 'order_create_date') \
                        .withColumnRenamed('Order Number', 'order_number') \
                        .withColumnRenamed('Order Status', 'order_status') \
                        .withColumnRenamed('Order Type Name', 'order_type_name') \
                        .withColumnRenamed('Product Line', 'product_line') \
                        .withColumnRenamed('Product Line Business Area', 'business_area') \
                        .withColumnRenamed('Project Number', 'project_number') \
                        .withColumnRenamed('Promised Date', 'promised_date') \
                        .withColumnRenamed('Scheduled Ship Date', 'scheduled_ship_date') \
                        .withColumnRenamed('Ship To Customer Name', 'customer_ship') \
                        .withColumnRenamed('Shipped Quantity', 'shipped_qty') \
                        .withColumnRenamed('Item Description', 'item_description') \
                        .withColumnRenamed('Task Number', 'task_number') \
                        .withColumnRenamed('Cost Group Item Cost', 'cost_group_item_cost') \
                        .withColumnRenamed('Unit Selling Price', 'unit_selling_price') \
                        .withColumnRenamed('Program Manager', 'program_manager') \
                        .withColumn('order_booked_date', col('order_booked_date').cast('Date')) \
                        .withColumn('order_create_date', col('order_create_date').cast('Date')) \
                        .withColumn('promised_date', col('promised_date').cast('Date')) \
                        .withColumn('scheduled_ship_date', col('scheduled_ship_date').cast('Date')) \
                        .withColumn('shipped_qty', col('shipped_qty').cast('Double')) \
                        .withColumn('cost_group_item_cost', col('cost_group_item_cost').cast('Double')) \
                        .withColumn('unit_selling_price', col('unit_selling_price').cast('Double'))

# Drop unwanted columns
drop_df = renaming_Df.drop('Header Ship From Org', 'Open Line Quantity', 'Requested Date', 'Right_Project Number', 'Ship From Location', 'Uom', 'Sold To Customer Name', 'CREATION_DATE')

# Input 4
pago_df = pago_df.withColumn('Project Creation Date', col('Project Creation Date').cast('Date'))

# Grouping
grouped_df = pago_df.groupBy('Project Number').agg(max('Project Creation Date').alias('Project Creation Date'))

# After reading the allrepair order daily
allrepair_df = allrepair_df.withColumn('Repair Order Creation Date', col('Repair Order Creation Date').cast('date'))
filtered_df = allrepair_df.filter((col("Repair Order Creation Date") >= "2016-01-01") & (col("Repair Order Creation Date") <= current_date()))

select_df = filtered_df.select(
    col("Business Area").alias("business_area"), col('Customer Name').alias('customer_bill'),
    col('Item Description').alias('item_description'), col('Item Number').alias('item_number'),
    col('Product Line').alias('product_line'), col('Project Number').alias('project_number'),
    col('Repair Line Id').alias('line_number'), col('Repair Number').alias('order_number'),
    col('Repair Order Creation Date').alias('order_create_date').cast('Date'),
    col('Repair Order Promised Date').alias('promised_date'), col('Repair Order Task').alias('task_number'),
    col('Repair Status'), col('Repair Type'), col('Ship Date').alias('shipped_date').cast('Date'),
    col('Sr Owner Name').alias('created_by'), col('Unit Selling Price').alias('unit_selling_price').cast('double'),
    col('Warehouse Code').alias('org')
)

# Performing adding new columns and drop unwanted columns
formula_df3 = select_df.withColumn('order_type', lit('DRO')) \
              .withColumn('line_create_date', col('order_create_date')) \
              .withColumn('order_status', col('Repair Status')) \
              .withColumn('line_status', col('Repair Status')) \
              .withColumn('order_type_name', col('Repair Type')) \
              .withColumn('line_qty', lit(1)) \
              .withColumn('shipped_qty', col('Repair Type')) \
              .withColumn('shipped_qty', when(col('shipped_date').isNull(), 0).otherwise(1)) \
              .drop('Repair Status', 'Repair Type', 'shipped_date') \
              .withColumn('promised_date', col('promised_date').cast('Date'))

# Unioning
union_df = drop_df.unionByName(formula_df3, allowMissingColumns=True)
rightJoin_df = grouped_df.join(union_df, on=[col("Project Number") == col("project_number")], how="right").drop('Project Number')

final_df = rightJoin_df.withColumn('Date Published', current_timestamp() - expr("INTERVAL 8 HOURS")) \
                       .withColumn('Workflow Publishing Data', lit('all_orders'))

# Ordering final df same as alteryx
selected_columns = [
    'Project Creation Date', 'customer_bill', 'customer_po', 'item_number', 'line_create_date',
    'line_number', 'line_qty', 'org', 'line_status', 'order_type', 'order_booked_date',
    'created_by', 'order_create_date', 'order_number', 'order_status', 'order_type_name',
    'product_line', 'business_area', 'project_number', 'promised_date', 'scheduled_ship_date',
    'customer_ship', 'shipped_qty', 'item_description', 'task_number', 'cost_group_item_cost',
    'unit_selling_price', 'program_manager', 'Date Published', 'Workflow Publishing Data'
]

finalselect = final_df.select(*selected_columns)

# Azure SQL Server Configuration
jdbc_url = f"jdbc:sqlserver://{jdbc_hostname}:{jdbc_port};database={jdbc_database}"
target_table_allorders = '[ops-datascience-5026].all_orders'

# Writing the final result dataframes to SQL
finalselect.write.format("jdbc").option("url", jdbc_url).option("dbtable", target_table_allorders).option("user", f"{connection_string}").option("password", jdbc_password).mode("overwrite").save()