% Measure_T: Measures the signal for the specified duration, T

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Set parameters                                      %                              
T  = 10;            % Set T : recording time in seconds 
fname = "recs.mat"; % Set file name eg xyz.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Flush Arduino serial buffer
flush(arduino);

% Recording parameters
Fs = 1000;      % Sampling Frequency
t  = 0:1/Fs:T;
x  = zeros(size(t));

% Loop variables
t_el    = 0;
tic;
ii   = 1;

% Recording loop
while t_el < T
    x(ii) = read(arduino,1,"uint16");
    if ( x(ii) > 1023 )
        d = uint16(x(ii));
        d_1 = idivide( d , uint16(256) );
        d_2 = rem ( d , uint16(256) );
        x(ii) = d_1 + d_2 * 256;
    end
    % delay(0.001);
    t_el  = t_el + toc;
    tic;
    ii    = ii + 1;
end

% Post-processing
ii = ii - 1;
msg = sprintf("Number of samples: %d",ii-1);
disp(msg);

ii = min(length(t),ii);

% Calculate voltage value from bits
v = x/1024*5;

% Display recorded signal
figure;
plot(t(1:ii),v(1:ii));
xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Voltage vs Time signal");
xlim([0 T]);
ylim([-1 6]);

% Save recorded signal
save(fname,'v','t');