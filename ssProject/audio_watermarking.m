function sig = audio_watermarking(host_audio_file, output_file, watermark_length)
    
    [host_audio, sample_rate] = audioread(host_audio_file);
    
    watermark = generate_watermark(watermark_length);
    
    watermarked_audio = host_audio;
    
    watermark = reshape(watermark, size(watermarked_audio(1:watermark_length)));

    watermarked_audio(1:watermark_length) = watermarked_audio(1:watermark_length) + watermark;

    audiowrite(output_file, watermarked_audio, sample_rate);
    sig = host_audio;
end
