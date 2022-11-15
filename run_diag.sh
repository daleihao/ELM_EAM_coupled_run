#!/bin/bash
#SBATCH -N 1
#SBATCH -t 06:00:00
#SBATCH --time-min=06:00:00 
#SBATCH -q regular
#SBATCH --account=ESMD
#SBATCH --job-name=diags

source /share/apps/E3SM/conda_envs/load_latest_e3sm_unified_compy.sh
python run_e3sm_diags.py --multiprocessing --num_workers=32
