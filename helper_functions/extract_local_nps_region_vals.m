function NPS_region_vals = extract_local_nps_region_vals(fmri_data_object, my_region)
%% Helper function to extract local NPS region values from DAT object

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
%     [NPS_region_vals] = extract_local_nps_region_vals(fmri_data_object, nps_region_of_interest)
%
%
% :Inputs:
%   1.) An fmri_data object: This is most likely created by using the
%   canlab 2nd level scripts, which can create a DAT object with the
%   property NPSsubregions
%
%   2.) An NPS region of interest: This can be any of the positive or
%   negative regions of the NPS, which include:
%
%       posnames: {'vermis'  'rIns'  'rV1'  'rThal'  'lIns'  'rdpIns'  'rS2_Op'  'dACC'}
%       negnames: {'rLOC'  'lLOC'  'rpLOC'  'pgACC'  'lSTS'  'rIPL'  'PCC'}
%
%  :Outputs:
%   1.) NPS_region_vals: A data structure with the following properties
%        A.) Region: This is the NPS region from which the function is extracting data
%        B.) condition_data: Values from input fmri_data_object 
%             (usually DAT from 2nd level analysis) that correspond to NPS activation 
%              in input my_region. Values grouped by conditions in input fmri_data_object. 
%              This function pulls from fmri_data_object.NPSsubregions
%        C.) condition_names: Names of conditions from
%             fmri_data_object (usually DAT from 2nd level analysis) that
%             describe the condition_data groups. This function pulls from input
%             fmri_data_object.conditions
%        D.) contrast_data: Values from input fmri_data_object 
%             (usually DAT from 2nd level analysis) that correspond to NPS activation 
%              in input my_region. Values grouped by contrasts in input fmri_data_object. 
%              This function pulls from fmri_data_object.NPSsubregions
%        E.) contrast_names: Names of contrasts from fmri_data_object 
%              (usually DAT from 2nd level analysis) that describe the 
%               contrast_data groups. This function pulls from input
%             fmri_data_object.contrastnames
%        F.) colors: Colors pulled from input fmri_data_object for plotting
%        by conditions
%        G.) contrast_colors: Colors pulled from input fmri_data_object for
%        plotting by contrasts
%


% INPUTS

myregion = 'dACC';
%myregion = 'rdpIns';

% DAT

% FUNCTION - GET DATA
% see documentation_template.m

DATA_STRUCT = [];
DATA_STRUCT.region = myregion;

k = length(DAT.conditions);
kc = length(DAT.contrastnames);

% find index of region
wh_region = strcmp(DAT.NPSsubregions.posnames, myregion);

pos_or_neg_field = 'npspos_by_region';

% check for problems
if sum(wh_region) > 1 || sum(wh_region) == 0, error('Bad region name'); end

% get the condition data
DATA_STRUCT.condition_data = cell(1, k);
DATA_STRUCT.conditions = DAT.conditions;

for i = 1:k
    DATA_STRUCT.condition_data{i} = DAT.NPSsubregions.(pos_or_neg_field){i}(:, wh_region);
end

% get the contrast data
DATA_STRUCT.contrastnames = DAT.contrastnames;

myfield = [pos_or_neg_field '_contrasts'];

for i = 1:kc
    DATA_STRUCT.contrast_data{i} = DAT.NPSsubregions.(myfield){i}(:, wh_region);
end

% Copy colors for use later in plotting

DATA_STRUCT.colors = DAT.colors;
DATA_STRUCT.contrastcolors = DAT.contrastcolors;












