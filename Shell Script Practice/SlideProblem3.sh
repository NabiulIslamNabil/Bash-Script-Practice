#!/bin/bash

totalError=0
totalWarning=0

for file in $(find "sample_directory" -type f -name "*.log"); do
	errorCount=$(grep -iwc "error" "$file")
	warningCount=$(grep -iwc "warning" "$file")
	echo "$file: "ERROR=$(grep -iwc "error" "$file")" "WARNING=$(grep -iwc "warning" "$file")""
	totalError=$((totalError+errorCount))
	totalWarning=$((totalWarning+warningCount))
done

echo "Total ERROR lines: $totalError"
echo "Total WARNING lines: $totalWarning"
