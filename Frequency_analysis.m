% Step 1: Read the data from the CSV file
filename = 'analog.csv';
data = readtable(filename);

% Step 2: 
time = data.Time_s_;
signal = data.Channel0;

% Step 3: Perform FFT on the signal
n = length(signal);      % Number of samples
signal_fft = fft(signal); % Compute the FFT
signal_magnitude = abs(signal_fft/n); % Magnitude and normalize by number of samples

% Step 4: Compute the frequency axis
fs = 1/mean(diff(time)); % Sampling frequency (assumes uniform sampling intervals)
f = (0:n-1)*(fs/n);      % Frequency range

% Since FFT is symmetrical, use only the first half of the data
n_half = floor(n/2);
f_half = f(1:n_half);             % Frequency axis for plotting
signal_magnitude_half = signal_magnitude(1:n_half); % Magnitude spectrum for plotting

% Step 5: Plot the magnitude spectrum
figure;
plot(f_half, signal_magnitude_half);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of the Signal');
grid on;