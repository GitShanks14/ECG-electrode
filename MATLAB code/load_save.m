% Clears workspace and command line, closes all figures. 
clc;
close all;
clear;

% Opens save file
recs = matfile('recs.mat');
v = recs.v;
t = recs.t;

% Displays the figures
figure;
plot(t,v(1:length(t)));
xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Voltage vs Time signal");
xlim([0 t(end)]);
ylim([-1 6]);