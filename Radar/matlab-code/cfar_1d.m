% Implement 1D CFAR using lagging cells on the given noise and target scenario.

% Close and delete all currently open figures
close all;

% Data_points
Ns = 1000;

% Generate random noise
s = abs(randn(Ns,1));

%Targets location. Assigning bin 100, 200, 300 and 700 as Targets with the amplitudes of 8, 9, 4, 11.
s([100 ,200, 300, 700]) = [8 9 4 11];

%plot the output
plot(s);

% TODO: Apply CFAR to detect the targets by filtering the noise.

% 1. Define the following:
% 1a. Training Cells
T = 12;
% 1b. Guard Cells
G = 5;

% Offset : Adding room above noise threshold for desired SNR 
offset = 3;

% Vector to hold threshold values
threshold_cfar = [];

%Vector to hold final signal after thresholding
signal_cfar = [];

% 2. Slide window across the signal length
for i = 1:(Ns-2*(G+T))

    % 2. - 5. Determine the noise threshold by measuring it within the training cells
    lagging_noise = sum(s(i : i+G+T-1));
    leading_noise = sum(s(i+G+T+1 : i+2*(G+T)));
    
    noise_level = (leading_noise + lagging_noise)/(2*T);
    noise_threshold = offset * noise_level;
    
    threshold_cfar = [threshold_cfar, {noise_threshold}];
    
    % 6. Measuring the signal within the CUT
    signal = s(i+T+G);

    % 8. Filter the signal above the threshold
    if (signal < noise_threshold)
        signal = 0;
    end
        
    signal_cfar = [signal_cfar, {signal}];
end




% plot the filtered signal
plot (cell2mat(signal_cfar),'g--');

% plot original sig, threshold and filtered signal within the same figure.
figure,plot(s);
hold on,plot(cell2mat(circshift(threshold_cfar,G)),'r--','LineWidth',2)
hold on, plot (cell2mat(circshift(signal_cfar,(T+G))),'g--','LineWidth',4);
legend('Signal','CFAR Threshold','detection')