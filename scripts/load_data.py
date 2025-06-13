#!/usr/bin/env python3
"""
load_data.py

Script to load raw procurement CSV files into a local SQLite database for downstream SQL analysis.

Usage:
    python scripts/load_data.py --input data/raw --output data/processed/procurement.db
"""
import argparse
import os
import sqlite3
import pandas as pd

def load_csvs_to_sqlite(input_dir, output_db):
    # Ensure output directory exists
    os.makedirs(os.path.dirname(output_db), exist_ok=True)

    # Connect to SQLite database (it will be created if it doesn't exist)
    conn = sqlite3.connect(output_db)
    print(f"Connected to database at {output_db}")

    # Iterate through all CSV files in the input directory
    for filename in os.listdir(input_dir):
        if not filename.lower().endswith('.csv'):
            continue
        table_name = os.path.splitext(filename)[0]
        file_path = os.path.join(input_dir, filename)
        print(f"Loading {filename} into table '{table_name}'...")

        # Read CSV into pandas DataFrame
        df = pd.read_csv(file_path)

        # Write DataFrame to SQLite
        df.to_sql(table_name, conn, if_exists='replace', index=False)
        print(f"Table '{table_name}' loaded: {df.shape[0]} rows, {df.shape[1]} columns")

    conn.close()
    print("All files loaded. Database connection closed.")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Load raw procurement CSVs into an SQLite database'
    )
    parser.add_argument(
        '--input', '-i', required=True,
        help='Path to directory containing raw CSV files'
    )
    parser.add_argument(
        '--output', '-o', required=True,
        help='Path to output SQLite database file'
    )
    args = parser.parse_args()

    load_csvs_to_sqlite(args.input, args.output)
