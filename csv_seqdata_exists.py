#!/usr/bin/env python3

import os
import csv
import argparse

def check_paths(csv_file, print_csv_path=False):
    """
    Check if file in read1 and read2 exists for each sample
    """

    output_header = ["sample_id", "read", "read_filepath", "file_exists"]
    if print_csv_path:
        output_header = ["csv"] + output_header

    with open(csv_file, mode='r') as file:
        reader = csv.DictReader(file)

        print("\t".join(output_header))
        for row in reader:
            id_ = row['id']
            read1_path = row['read1']
            read2_path = row['read2']

            read1_exists = os.path.exists(read1_path)
            read2_exists = os.path.exists(read2_path)

            if print_csv_path:
                print(f"{csv_file}\t{id_}\tread1\t{read1_path}\t{read1_exists}")
                print(f"{csv_file}\t{id_}\tread2\t{read2_path}\t{read2_exists}")
            else:
                print(f"{id_}\t{read1_path}\tread1\t{read1_exists}")
                print(f"{id_}\t{read2_path}\tread1\t{read2_exists}")

if __name__ == "__main__":
    # Argument parsing
    parser = argparse.ArgumentParser(
        description="Check if files defined in read1 and read2 exist."
    )
    parser.add_argument("csv_file", type=str, help="Path to the CSV file")
    parser.add_argument("--print-csv-path", action="store_true",
                        help="Include the CSV file path in the output")

    args = parser.parse_args()

    # Call the function to check paths
    check_paths(args.csv_file, args.print_csv_path)
