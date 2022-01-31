#!/bin/bash


vina_var=vina
vina_var_split=vina_split

while IFS=, read -r resname resid x y z; do

	echo "receptor = ${resname}_pro.pdbqt
ligand = rff.pdbqt

center_x = $x
center_y = $y
center_z = $z

size_x = 26
size_y = 26
size_z = 26" > conf-$resid

$vina_var --config conf-$resid --num_modes 100 --energy_range 3 --cpu 24 --out out-$resname-$resid.pdbqt --log out-$resname-$resid.log --seed 99999999


mkdir $resname-$resid-dir
mv out-$resname-$resid.* $resname-$resid-dir

cp $resname.pdb $resname-$resid-dir
cd $resname-$resid-dir
resname_true=`cut -d- -f1 <<< $resid`
resid_true=`cut -d- -f2 <<< $resid`

echo "mol load pdb $resname.pdb
set sel1 [atomselect top \"protein or resname $resname_true and resid $resid_true\"]
\$sel1 writepdb $resname-f.pdb 
exit" > exclude.tcl


$vina_var_split --input out-$resname-$resid.pdbqt
mv out-$resname-$resid.pdbqt bk.pdbqt

#sed -i '$ d' $resname-f.pdb
cd ..

done < final.csv
