%reload second level analysis objects
addpath(genpath('/home/lukie/Documents/CANlab/breathlessness'));
a_set_up_paths_always_run_first;
b_reload_saved_matfiles

% Example to extract dACC from DAT
NPS_local_dACC = extract_local_nps_region_vals(DAT, 'dACC')

% Example to plot newly extrated dACC object
plot_local_nps_region_vals(NPS_local_dACC)