#!/bin/sh
ls ./data/*.bqsr.bam > names_of_samples
file="names_of_samples"
while read line; do
line_2=${line:7}
bedtools coverage -a ./data/apoc2.bed -b $line -d > apoc2.$line_2.bedcoverage
bedtools coverage -a ./data/apoa5.bed -b $line -d > apoa5.$line_2.bedcoverage
bedtools coverage -a ./data/lmf1.bed -b $line -d > lmf1.$line_2.bedcoverage
bedtools coverage -a ./data/gpihbp1.bed -b $line -d > gpihbp1.$line_2.bedcoverage
done < $file