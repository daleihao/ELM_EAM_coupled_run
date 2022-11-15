import os
from e3sm_diags.parameter.core_parameter import CoreParameter
from e3sm_diags.run import runner

param = CoreParameter()

param.reference_data_path = '/compyfs/e3sm_diags_data/obs_for_e3sm_diags/climatology/'
param.ref_timeseries_input = False
# Years to slice the ref data, base this off the years in the filenames.
param.ref_start_yr = '2000'
param.ref_end_yr   = '2014'

param.test_data_path = '/compyfs/haod776/e3sm_scratch/E3SM_couple/seasonal_output/'
param.test_name = 'ELM_TOP_SNOW_PP_Koch_10years'

param.test_timeseries_input = False
# Years to slice the test data, base this off the years in the filenames.
param.test_start_yr = '2000'
param.test_end_yr   = '2014'

param.seasons = ["ANN","DJF", "MAM", "JJA", "SON"]   #all seasons will run,if comment out"

prefix = '/compyfs/www/haod776/doc_examples/'
param.results_dir = os.path.join(prefix, 'lat_lon_demo')

# Use the following if running in parallel:
#param.multiprocessing = True
#param.num_workers = 32

# Use below to run all core sets of diags:
#runner.sets_to_run = ['lat_lon','zonal_mean_xy', 'zonal_mean_2d', 'polar', 'cosp_histogram', 'meridional_mean_2d']
# Use below to run lat_lon map only:
runner.sets_to_run = ['lat_lon']
runner.run_diags([param])
