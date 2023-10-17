function extracted_watermark = audio_watermark_extraction_emd(processed, host, watermark_length)
    [sig1, ~] = audio_read(processed);
    residual_1 = sig1;
    [sig2, ~] = audio_read(host);
    residual_2 = sig2;
    
    imf1 = residual_1 - mean(residual_1);
    imf2 = residual_1 - mean(residual_2);
    
    extracted_watermark = imf2(1:watermark_length, 1) - imf1(1:watermark_length, 1);
end