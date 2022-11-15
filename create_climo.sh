#!/bin/bash
#SBATCH -N 1
#SBATCH -t 06:00:00
#SBATCH --time-min=06:00:00 
#SBATCH -q regular
#SBATCH --account=ESMD


source /share/apps/intel/2020/compilers_and_libraries_2020.0.166/linux/bin/compilervars.sh intel64 # Compy
module purge
module load intel/20.0.0
module load intelmpi/2020 # Required for ncclimo/ncremap in MPI-mode
module load netcdf/4.6.3

export PATH="~zender/bin:${PATH}"
export LD_LIBRARY_PATH="~zender/lib:${LD_LIBRARY_PATH}"

export RUNDIR=/compyfs/haod776/e3sm_scratch/E3SM_couple
export MAPFILE=/compyfs/inputdata/cpl/gridmaps/ne30pg2/map_ne30pg2_to_r05_mono.200220.nc
export CASE_REF=ELM_TOP_SNOW_PP_Koch_20years
export MODEL=eam
export STARTYEAR=2000
export ENDYEAR=2014

# ----- Create seasonal and annual mean climatology datasets -----
ncclimo \
--case=${CASE_REF} \
--jobs=1 \
--thr=1 \
--parallel=bck \
--map=${MAPFILE} \
--vars=FLDS \
--yr_srt=${STARTYEAR} \
--yr_end=${ENDYEAR} \
--input=${RUNDIR}/${CASE_REF}/run \
--output=${RUNDIR}/seasonal_output_15years/${CASE_REF} \
--drc_rgr=${RUNDIR}/seasonal_output_15years_regridd/${CASE_REF} \
--prc_typ=${MODEL}
