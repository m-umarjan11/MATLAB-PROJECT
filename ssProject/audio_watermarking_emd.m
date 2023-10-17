function processed_audio = audio_watermarking_emd(host_audio, watermark, output_file)

    [audio_sig, sample_rate] = audioread(host_audio);
    fs = length(audio_sig)/sample_rate;
    audio_sig = audio_sig(:);
    imfs = []; imf = [];
    residual = audio_sig;
    while any(residual)
        imf = residual - mean(residual);
        padding = zeros(length(imf) - length(watermark));
        watermark_padded = [watermark padding];
        imf = imf + watermark_padded;
        [~, h] = freqz(imf, 1, fs);
        if abs(h(1)) > abs(h(end))
            imf = -imf;
        end
        imfs = [imfs imf];
        residual = residual - imf;
    end
    
    signal = zeros(length(imfs(1)), 1);

    for i = 1:length(imfs)
        signal = signal + imfs(i);
    end

    processed_audio = audiowrite(output_file, signal, sample_rate);
    
end