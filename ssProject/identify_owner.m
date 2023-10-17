function ownerInfo = identify_owner(output, mappingFile, host_file, len)
   
    watermark = audio_watermark_extraction(output, len, host_file);
    
    watermark_str = num2str(watermark);
    watermark_str = reshape(watermark_str, 1, []);
    load(mappingFile, 'person_watermark_map');
    
    person_ids = keys(person_watermark_map);
    watermarks = values(person_watermark_map);
    
    for i = 1:length(watermarks)
        
        watermark1 = strrep(watermarks{i}, ' ', '');
        watermark2 = strrep(watermark_str, ' ', '');
        
        
        
        if strcmp(watermark1, watermark2)
            ownerInfo = person_ids{i};
            disp('Owner Information:');
            disp(ownerInfo);
            return; 
        end
    end
    
    disp('No matching owner found for the watermarked audio.');
    ownerInfo = '';
end