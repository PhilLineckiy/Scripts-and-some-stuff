#!/bin/bash

# Specify the dump file and output file
INPUT_DUMP="moneycat.vn.sql"
OUTPUT_DUMP="fixed_dump.sql"

# Replace ROW_FORMAT=COMPACT with ROW_FORMAT=DYNAMIC
sed 's/ROW_FORMAT=COMPACT/ROW_FORMAT=DYNAMIC/g' "$INPUT_DUMP" > "$OUTPUT_DUMP"

# Replace ROW_FORMAT=REDUNDANT with ROW_FORMAT=DYNAMIC
sed -i 's/ROW_FORMAT=REDUNDANT/ROW_FORMAT=DYNAMIC/g' "$OUTPUT_DUMP"

# Now, you can import the modified dump file into your database
mysql -u root -p saigoncredit_vn < "$OUTPUT_DUMP"
