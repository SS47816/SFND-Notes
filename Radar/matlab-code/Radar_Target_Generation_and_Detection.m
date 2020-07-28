clear all;
close all;
clc;

%% Radar Specifications 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Frequency of operation = 77GHz
% Max Range = 200m
% Range Resolution = 1 m
% Max Velocity = 100 m/s
%%%%%%%%%%%%%%%%%%%%%%%%%%%

fc= 77e9;       % carrier freq
R_max = 200;    % max range
R_res = 1.0;    % range resolution
v_max = 100;    % max velocity

%speed of light = 3e8
c = 3e8;

%% User Defined Range and Velocity of target
% *%TODO* :
% define the target's initial position and velocity. Note : Velocity
% remains contant

R_target = 100;
v_target = 20;

%% FMCW Waveform Generation

% *%TODO* :
%Design the FMCW waveform by giving the specs of each of its parameters.
% Calculate the Bandwidth (B), Chirp Time (Tchirp) and Slope (slope) of the FMCW
% chirp using the requirements above.

B = c/(2*R_res)
Tchirp = 5.5*2*R_max/c
slope = B/Tchirp
                                                          
%The number of chirps in one sequence. Its ideal to have 2^ value for the ease of running the FFT
%for Doppler Estimation. 
Nd = 128;                   % #of doppler cells OR #of sent periods % number of chirps

%The number of samples on each chirp. 
Nr = 1024;                  % for length of time OR #of range cells

% Timestamp for running the displacement scenario for every sample on each
% chirp
t = linspace(0,Nd*Tchirp,Nr*Nd); %total time for samples


%Creating the vectors for Tx, Rx and Mix based on the total samples input.
Tx = zeros(1,length(t)); %transmitted signal
Rx = zeros(1,length(t)); %received signal
Mix = zeros(1,length(t)); %beat signal

%Similar vectors for range_covered and time delay.
r_t = zeros(1,length(t));
td = zeros(1,length(t));


%% Signal generation and Moving Target simulation
% Running the radar scenario over the time. 

for i=1:length(t)         
    
    % *%TODO* :
    %For each time stamp update the Range of the Target for constant velocity. 
    r_t(i) = R_target + (v_target*t(i));
    td(i) = 2*r_t(i)/c;
    
    % *%TODO* :
    %For each time sample we need update the transmitted and
    %received signal. 
    Tx(i) = cos(2*pi*(fc*t(i) + slope * (t(i)^2)/2));
    Rx (i) = cos(2*pi*(fc*(t(i) - td(i)) + slope*((t(i)-td(i))^2)/2));
    
    % *%TODO* :
    %Now by mixing the Transmit and Receive generate the beat signal
    %This is done by element wise matrix multiplication of Transmit and
    %Receiver Signal
    Mix(i) = Tx(i).*Rx(i);
    
end

%% RANGE MEASUREMENT


 % *%TODO* :
%reshape the vector into Nr*Nd array. Nr and Nd here would also define the size of
%Range and Doppler FFT respectively.
Mix = reshape(Mix, [Nr,Nd]);

 % *%TODO* :
%run the FFT on the beat signal along the range bins dimension (Nr) and
%normalize.
sig_fft1 = fft(Mix, Nr)./Nr;

 % *%TODO* :
% Take the absolute value of FFT output
sig_fft1 = abs(sig_fft1);

 % *%TODO* :
% Output of FFT is double sided signal, but we are interested in only one side of the spectrum.
% Hence we throw out half of the samples.
sig_fft1 = sig_fft1(1 : Nr/2);

%plotting the range
figure ('Name','Range from First FFT')
subplot(2,1,1)

 % *%TODO* :
 % plot FFT output 
plot(sig_fft1);
axis ([0 200 0 1]);
title('1D FFT Output');
xlabel('Range (m)');
ylabel('Amplitude');



%% RANGE DOPPLER RESPONSE
% The 2D FFT implementation is already provided here. This will run a 2DFFT
% on the mixed signal (beat signal) output and generate a range doppler
% map.You will implement CFAR on the generated RDM


% Range Doppler Map Generation.

% The output of the 2D FFT is an image that has reponse in the range and
% doppler FFT bins. So, it is important to convert the axis from bin sizes
% to range and doppler based on their Max values.

Mix = reshape(Mix,[Nr,Nd]);

% 2D FFT using the FFT size for both dimensions.
sig_fft2 = fft2(Mix,Nr,Nd);

% Taking just one side of signal from Range dimension.
sig_fft2 = sig_fft2(1:Nr/2,1:Nd);
sig_fft2 = fftshift (sig_fft2);
RDM = abs(sig_fft2);
RDM = 10*log10(RDM);

%use the surf function to plot the output of 2DFFT and to show axis in both
%dimensions

doppler_axis = linspace(-100,100,Nd);
range_axis = linspace(-200,200,Nr/2)*((Nr/2)/400);
figure ('Name','2D FFT Output')
surf(doppler_axis,range_axis,RDM);
title('2D FFT Output RDM');
xlabel('Velocity (m/s)');
ylabel('Range (m)');
zlabel('Signal Strength (dB)');

%% CFAR implementation

%Slide Window through the complete Range Doppler Map

% *%TODO* :
%Select the number of Training Cells in both the dimensions.
Tr = 12;
Td = 9;

% *%TODO* :
%Select the number of Guard Cells in both dimensions around the Cell under 
%test (CUT) for accurate estimation
Gr = 5;
Gd = 3;

% *%TODO* :
% offset the threshold by SNR value in dB
SNR = pow2db(2.1);

% *%TODO* :
%Create a vector to store noise_level for each iteration on training cells
noise_level = zeros(1,1);


% *%TODO* :
%design a loop such that it slides the CUT across range doppler map by
%giving margins at the edges for Training and Guard Cells.
%For every iteration sum the signal level within all the training
%cells. To sum convert the value from logarithmic to linear using db2pow
%function. Average the summed values for all of the training
%cells used. After averaging convert it back to logarithimic using pow2db.
%Further add the offset to it to determine the threshold. Next, compare the
%signal under CUT with this threshold. If the CUT level > threshold assign
%it a value of 1, else equate it to 0.


% Use RDM[x,y] as the matrix from the output of 2D FFT for implementing
% CFAR

% Normalise radar measurement to [0, 1]
max_element = max(max(RDM)); % max element in db
RDM = RDM - max_element; % normalise in pow

% loop through all cells in range direction
for i = Tr+Gr+1 : Nr/2-(Gr+Tr)
    % loop through all cells in doppler direction
    for j = Td+Gd+1 : (Nd)-(Gd+Td)
        
        noise_level = zeros(1,1); % reset noise level to zero for every literation
        % loop through the selected window
        for r = i-(Tr+Gr) : i+(Tr+Gr)
            for d = j-(Td+Gd) : j+(Td+Gd)
                % if this cell is a training cell
                if (abs(i-r) > Gr || abs(j-d) > Gd)
                    noise_level = noise_level + db2pow(RDM(r,d));
                end
            end
        end
        
        % total num of training cells
        num_T_cells = 2*(Td+Gd+1)*2*(Tr+Gr+1) - (2*Gr+1)*(2*Gd+1);
        % noise threshold
        noise_threshold = pow2db(noise_level/num_T_cells);
        %Add the SNR to the threshold
        noise_threshold = SNR + noise_threshold; % use plus instead of times here cuz in log
        
        %Measure the signal in Cell Under Test(CUT) and compare against
        CUT = RDM(i,j);
        if (CUT < noise_threshold)
            RDM(i,j) = 0;
        else
            RDM(i,j) = 1;
        end
        
    end
end

   
% *%TODO* :
% The process above will generate a thresholded block, which is smaller 
%than the Range Doppler Map as the CUT cannot be located at the edges of
%matrix. Hence,few cells will not be thresholded. To keep the map size same
% set those values to 0. 
RDM(1:(Tr+Gr), :) = 0;
RDM(end-(Tr+Gr-1):end, :) = 0;
RDM(:, 1:(Td+Gd)) = 0;
RDM(:, end-(Td+Gd-1):end) = 0;


% *%TODO* :
%display the CFAR output using the Surf function like we did for Range
%Doppler Response output.
figure('Name', 'CA-CFAR Filtered RDM')
surf(doppler_axis,range_axis,RDM);
colorbar;
title('CA-CFAR Filtered RDM');
xlabel('Velocity (m/s)');
ylabel('Range (m)');
zlabel('Normalized Amplitude [0,1]');

 
 