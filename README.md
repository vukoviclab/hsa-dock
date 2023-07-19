# hsa-dock

This is a comprehensive pipeline for measuring the center of mass for residues in a protein data bank (PDB) file, performing molecular docking using Vina, splitting the ligands, and removing unnecessary residues.

The pipeline consists of four main scripts:

1. `measure.sh`: A script to measure the center of mass for residues in PDB files.
2. `run-vmd.sh`: A script to run the VMD commands.
3. `run_dock.sh`: A script to perform docking using Vina.
4. `run_exclude.sh`: A script to exclude unnecessary residues.

## Prerequisites

Before you begin, ensure you have met the following requirements:

* You have installed the latest version of [VMD](https://www.ks.uiuc.edu/Research/vmd/) and [AutoDock Vina](http://vina.scripps.edu/).
* You have a `*.pdb` file that you want to analyze.
* Your PDB files should have a naming pattern of `1e7*.pdb`.

## Using Scripts

To use these scripts, follow these steps:

**Step 1:** Run the `measure.sh` script to measure the center of mass of residues in PDB files. It creates temporary `*.tcl` scripts for each PDB file and measures the center of mass for residues.

```bash
bash measure.sh
```

**Step 2:** Run the `run-vmd.sh` script to execute the VMD commands written in `*.tcl` scripts.

```bash
bash run-vmd.sh
```
**Step 3:** Run the `run_dock.sh` script to perform molecular docking using Vina. Make sure you replace `vina_var` and `vina_var_split` variables in the script with the path to your Vina and Vina_split executables.

```bash
bash run_dock.sh
```
**Step 4:** Run the `run_exclude.sh` script to exclude unnecessary residues.

```bash
bash run_exclude.sh
```

## Contributing to the Project

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the terms of the MIT license.

## Contact

You can reach me at `payamkelich@github.io` if you want to contact me.
