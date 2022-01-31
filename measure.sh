#!/bin/bash


for i in 1e7*.pdb
do
	cat $i | grep REMARK\ 800\ SITE_DESCRIPTION > tmp-resid
	
	sed -i s/"REMARK 800 SITE_DESCRIPTION: BINDING SITE FOR RESIDUE "//g tmp-resid
	sed -i s/" A"/,/g tmp-resid
	
	cat tmp-resid | tr -d " \t\r" > tmp


	while IFS=, read -r resname resid
	do
	

	echo "mol load pdb $i
set sel1 [atomselect top \"resname $resname and resid $resid\"]
set com [measure center \$sel1 weight mass]

exit" > measure-$resname-$resid-pat.tcl
	
#	vmd -dispdev text -e measure.tcl >> test
	
	done < tmp

done


for i in *pat.tcl
do
	vmd -dispdev text -e $i > tmp-measuared
	echo `head -1 $i |  grep -o -P '(?<=pdb ).*(?=.pdb)' && echo ',' && echo "$i" | grep -o -P '(?<=measure-).*(?=-pat.tcl)' && echo ',' && awk '($1+0)' tmp-measuared | sed 's/ /,/g'` >> final.csv
	rm $i

done

rm tmp-measuared tmp tmp-resid

sed -i s/" "//g final.csv

