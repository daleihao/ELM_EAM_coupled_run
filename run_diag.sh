#!/bin/bash -l
#SBATCH --job-name=diags
#SBATCH --output=diags.o%j
#SBATCH --account=e3sm
#SBATCH --nodes=1
#SBATCH --time=01:00:00

source /share/apps/E3SM/conda_envs/load_latest_e3sm_unified_compy.sh
python run_e3sm_diags.py --multiprocessing --num_workers=32
