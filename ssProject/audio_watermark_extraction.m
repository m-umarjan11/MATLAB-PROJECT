function extracted_watermark = audio_watermark_extraction(watermarked_audio_file, watermark_length, host)

    [w_sig, ~] = audioread(watermarked_audio_file);
    
    [a_sig, ~] = audioread(host);
    
    extracted_watermark = w_sig(1:watermark_length) - a_sig(1:watermark_length);

    extracted_watermark = extracted_watermark > 0.5;
    
end


