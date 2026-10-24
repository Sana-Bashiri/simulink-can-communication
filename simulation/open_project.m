function open_project(modelName)
% Resolve the bundled database independently of the current MATLAB folder.
% Open only: this helper does not start CAN traffic or run the simulation.
if nargin == 0, modelName = 'SIMULINK'; end
validatestring(modelName, {'SIMULINK','CANoe_and_simulink'});
projectDir = fileparts(mfilename('fullpath'));
addpath(projectDir);
load_system(fullfile(projectDir, [modelName '.slx']));
blocks = find_system(modelName, 'LookUnderMasks','all', ...
    'FollowLinks','on', 'Type','Block');
for k = 1:numel(blocks)
    params = get_param(blocks{k}, 'DialogParameters');
    if isstruct(params) && isfield(params, 'CANdbFile')
        set_param(blocks{k}, 'CANdbFile', fullfile(projectDir,'ATLAS_database.dbc'));
    end
end
open_system(modelName);
fprintf('Opened %s. Check device/channel and timing before running.\n',modelName);
end
