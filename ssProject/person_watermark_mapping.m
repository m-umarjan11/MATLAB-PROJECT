function person_watermark_mapping(person_id, watermark)
    
    mapping_file = 'watermark_mapping.mat';

    if exist(mapping_file, 'file') == 2
        load(mapping_file, 'person_watermark_map');
        
        watermark_str = num2str(watermark);
        
        person_watermark_map(person_id) = watermark_str;
        
    else
        person_watermark_map = containers.Map('KeyType','char','ValueType','char');
        
        watermark_str = num2str(watermark);
        
        person_watermark_map(person_id) = watermark_str;
    end

    save(mapping_file, 'person_watermark_map');
    
    disp('Person-watermark mapping saved successfully.');
end