global track_properties;
track_properties = struct('debug', 0, 'cache', 1, 'indent', 0, 'pack', 1, ...
     'bundle', 'http://box.vicos.si/vot/vot2013.zip', 'repeat', 5, 'cleanup', 1);

print_text('Running VOT experiments ...');

if exist('configuration') ~= 2
	print_text('Please copy configuration_template.m to configuration.m and configure it.');
	error('Setup file does not exist.');
	return;
end;

configuration;

mkpath(track_properties.directory);

sequences_directory = fullfile(track_properties.directory, 'sequences');
results_directory = fullfile(track_properties.directory, 'results');

print_text('Loading sequences ...');

sequences = load_sequences(sequences_directory);

if isempty(sequences)
	error('No sequences available. Stopping.');
	return;
end;

print_text('Preparing tracker %s ...', tracker_identifier);

tracker = create_tracker(tracker_identifier, tracker_command, fullfile(results_directory, tracker_identifier));
