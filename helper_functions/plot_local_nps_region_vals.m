function plot_local_nps_region_vals(nps_region_extract, save_dir)
%% Helper function to visualize local NPS region values from nps region extract (can be created by extract_local_nps_region_vals.m).

%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
% ..
%
% :Usage:
% ::
%
%      plot_local_nps_region_vals(NPS_region_values_object)
%
%
% :Inputs:
%   1.) An fmri_data object: This should be a data object including only
%   data from one NPS subregion. This object can be created using the
%   extract_local_nps_region_vals.m
%
%  :Outputs:
%   1.) Two plots: One of the data from the NPS subregion of interest by
%   condition and one by contrast.
%
%  :Example:
%   plot_local_nps_region_vals(NPS_region_vals)

% Get input data
DATA_STRUCT = nps_region_extract;

% Create empty plot 
f1 = create_figure(DATA_STRUCT.region, 1, 2);

% Get condition data and specify options to be plotted
mydata = DATA_STRUCT.condition_data;
input_options = {'colors', DATA_STRUCT.colors, 'nofig', 'names', DATA_STRUCT.conditions, 'noind'};

% Plot condition data
barplot_columns(mydata, input_options{:});

% Populate labels for conditions plot
title('Conditions');
ylabel(sprintf('%s local pattern response', DATA_STRUCT.region));
xlabel(sprintf('Condition'));

subplot(1, 2, 2);

% Get contrast data and specify options for plotting
mydata = DATA_STRUCT.contrast_data;
input_options = {'colors', DATA_STRUCT.contrastcolors, 'nofig', 'names', DATA_STRUCT.contrastnames, 'noind'};

% Plot contrast data
barplot_columns(mydata, input_options{:});

% Populate labels for contrasts plot
title('Contrasts');
ylabel(sprintf('%s local pattern response', DATA_STRUCT.region));
xlabel(sprintf('Contrast'));

%save output as Support vector graphics file image (SVG)
print(f1, [save_dir '/' DATA_STRUCT.region '_condition_contrast_violin_plot'] , '-dsvg');
clear f1;
end
