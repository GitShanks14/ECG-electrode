% Measure_: Measures N samples of the signal at the specified sampling freq

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Set parameters                                      %                              
N  = 10000;         % Set N : number of samples to be recorded
fname = "recs.mat"; % Set file name eg xyz.mat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Flush Arduino serial buffer
flush(arduino);

% Recording parameters
n  = 0:1:N-1;
x  = zeros(size(n));

% Loop variables
ii   = 1;
tic;

% Recording loop
while ii < N
    x(ii) = read(arduino,1,"uint16");
    if ( x(ii) > 1023 )
        d = uint16(x(ii));
        d_1 = idivide( d , uint16(256) );
        d_2 = rem ( d , uint16(256) );
        x(ii) = d_1 + d_2 * 256;
    end
    ii    = ii + 1;
end

% Post-processing
t_end = toc;
t = linspace(0,t_end,N);

% Calculate voltage value from bits
v = x/1024 * 5;

% Display recorded signal
figure;
plot(t,v);
xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Voltage vs Time signal");
xlim([0 t_end]);
ylim([-1 6]);

% Save recorded signal
save(fname,'v','t');


