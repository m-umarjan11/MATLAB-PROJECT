function load_mapfile()
    mapping_file = 'watermark_mapping.mat';
    load(mapping_file, 'person_watermark_map');

    keys = person_watermark_map.keys;
    values = person_watermark_map.values;

    disp('Person-Watermark Mapping:');
    for i = 1:length(keys)
        disp(['Person ID: ', keys{i}]);
        disp('Watermark:');
        for j = 1:numel(values{i})
            fprintf('%s ', num2str(values{i}(j)));
        end
        disp(' ');
        disp('-------------------------');
    end
end
