"""
CsvToDataframeApp.py - CSV ingestion in a dataframe.
@author Ashish Jha
"""
from pyspark.sql import SparkSession
import os


current_dir = os.path.dirname(__file__)

relative_path = "file:///app/issue_export_dataframe.csv"
absolute_file_path = os.path.join(current_dir, relative_path)


# Creates a session on a local master
session = SparkSession.builder.appName("CSV to Dataset").master("local[*]").getOrCreate()


def extract_data():
    # Reads a CSV file with header, called books.csv, stores it in a dataframe
    df = session.read.csv(header=True, inferSchema=True, path=relative_path)

    # Shows at most 5 rows from the dataframe
    df.show(5)

    # Good to stop SparkSession at the end of the application
    session.stop()
