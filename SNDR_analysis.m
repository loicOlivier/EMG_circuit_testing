filename = 'analog.csv';
data = readtable(filename);

time = data.;
signal = data.;

fs = 1.5624 * 10^6; %Hz

SINAD = sinad(signal, fs);