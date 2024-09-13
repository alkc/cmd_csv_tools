#/bin/bash

rerun_sample_id="$1"

usage() {
    echo "Look for CSVs and SH scripts for reruns in Paul's CSV folder on /fs1/paul/csv"
    echo ""
    echo "Usage: find-paul-rerun NEW_RERUN_SAMPLE_ID"
    echo ""
    echo "  -h, --help               Show this help message and exit."
    echo ""
    echo "If no options are provided, the help message is shown."
    echo ""
    echo "NEW_RERUN_SAMPLE_ID: New sample id of rerun sample."
}

# Check if no arguments are provided or if help is requested
if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then
    usage
    exit 0
fi

grep $rerun_sample_id /fs1/paul/csv/*.csv | cut -f 1 -d : | sort | uniq | while read csv_path; do csv_basename=$(basename $csv_path); echo "$csv_path "$(grep $csv_basename /fs1/paul/csv/*.sh | cut -f 1 -d : | sort | uniq)""; done
