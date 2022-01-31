#!/bin/bash

for i in *pat.tcl
do
	vmd -dispdev text -e $i > tmp-measuared
	echo `head -1 $i |  grep -o -P '(?<=pdb ).*(?=.pdb)' && echo ',' && echo "$i" | grep -o -P '(?<=measure-).*(?=-pat.tcl)' && echo ',' && awk '($1+0)' tmp-measuared | sed 's/ /,/g'` >> final.csv
	rm $i

done
