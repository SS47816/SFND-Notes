
R_max = 300;
R_res = 1;
c = 3*10^8;

% TODO : Find the Bsweep of chirp for 1 m resolution
B_sweep = c/2*R_res; % in Hz

% TODO : Calculate the chirp time based on the Radar's Max Range 
T_chirp = 5.5*2*R_max/c; % in s

% TODO : define the frequency shifts for all 4 targets
beat_freq = [0 1.1e6 13e6 24e6]; % in Hz
calculated_range = c*beat_freq*T_chirp/(2*B_sweep);

% Display the calculated range
disp(calculated_range);
