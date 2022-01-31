#!/bin/bash

for i in *-dir
do
	cd $i
	vmd -dispdev text -e exclude.tcl
	for j in out*.pdbqt
		do
        		cut -c1-60 $j | grep LIG > temp1
        		echo "END" >> temp1
			sed -i '$ d' $(cut -d- -f1 <<< $i)-f.pdb
			cat  $(cut -d- -f1 <<< $i)-f.pdb temp1 > fin-$(cut -d. -f1 <<< $j).pdb
     
		done
	cd ..
done
