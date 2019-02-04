function plot_local_nps_region_vals(nps_region_extract)
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
%      nps_region_plot = plot_local_nps_region_vals(NPS_region_vals)
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


create_figure(DATA_STRUCT.region, 1, 2);

mydata = DATA_STRUCT.condition_data;
input_options = {'colors', DATA_STRUCT.colors, 'nofig', 'names', DATA_STRUCT.conditions, 'noviolin', 'noind'};

barplot_columns(mydata, input_options{:});

title('Conditions');
ylabel(sprintf('%s local pattern response', DATA_STRUCT.region));

subplot(1, 2, 2);

mydata = DATA_STRUCT.contrast_data;
input_options = {'colors', DATA_STRUCT.contrastcolors, 'nofig', 'names', DATA_STRUCT.contrastnames,'noviolin', 'noind'};

barplot_columns(mydata, input_options{:});

title('Contrasts');
ylabel(sprintf('%s local pattern response', DATA_STRUCT.region));

% save as SVG
