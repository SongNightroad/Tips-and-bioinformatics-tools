#!/bin/sh
ls  //core-pool/storage/users/apetukhova/bones_exomes/calling_results/xgen_controls/*.bam > names_of_samples_xgen_controls
file="names_of_samples_xgen_controls"
while read line; do
line_2=${line:80}
echo "start with $line file"
bedtools coverage -a ./data/CPNE9 -b $line -d > ./bedcoverage_xgen_controls/CPNE9.$line_2.bedcoverage
bedtools coverage -a ./data/SHPRH -b $line -d > ./bedcoverage_xgen_controls/SHPRH.$line_2.bedcoverage
bedtools coverage -a ./data/RAB31 -b $line -d > ./bedcoverage_xgen_controls/RAB31.$line_2.bedcoverage
samtools view -c -F 260 $line > ./samtools_xgen_controls/$line_2.samtools
echo "done with $line file"
done < $file
