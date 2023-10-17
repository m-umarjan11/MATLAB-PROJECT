len = 50;

mode = input('Enter the mode (search or store): ', 's');

if strcmp(mode, 'search')

    [host_file, input_path] = uigetfile('*.wav', 'Select the input audio file');
  
    [output, output_path] = uigetfile('*.wav', 'Enter the output audio file name');

    sig1 = audio_watermarking(host_file, output, len);
    sig2 = audio_watermark_extraction(output, len, host_file);
    person_watermark_mapping(prop, sig2);
    identify_owner(outstoreput, 'watermark_mapping.mat',host_file, len);
    %load_mapfile();
    
elseif strcmp(mode, 'store')
    prop = input('Enter Owner Name: ', 's');

   
    [host_file, input_path] = uigetfile('*.wav', 'Select the input audio file');
    
    
    [output, output_path] = uigetfile('*.wav', 'Enter the output audio file name');

    sig1 = audio_watermarking(host_file, output, len);
    sig2 = audio_watermark_extraction(output, len, host_file);
    person_watermark_mapping(prop, sig2);
    identify_owner(output, 'watermark_mapping.mat', host_file, len);
    load_mapfile();
    subplot(3,1,1);
    plot(sig1);
    title('Host signal');
    grid;
    subplot(3,1,2);
    plot(sig2);
    title('Watermark signal');
    axis([0, 100, -2, 2])
    grid;
    subplot(3,1,3);
    plot(audioread(output));
    title('Output File');
    grid;
    
end
