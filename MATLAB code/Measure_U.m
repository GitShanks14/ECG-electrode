% UNSTABLE VERSION. PLEASE DO NOT USE YET. 

% Resets Arduino serial buffer
flush(arduino);

% Initialize recording parameters
Fs = 1000;      % Sampling frequency
T  = 50;        % Time duration
t  = 0:1/Fs:T;  % time axis
x  = zeros(size(t));
v  = zeros(size(t));

t_el    = 0;
tic;
ii   = 1;

frames  = 60;
f_max   = idivide(int16(Fs),int16(frames));
T_window = 3;

figure;
hold on;
xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Voltage vs Time signal");
xlim([(ii-1)/Fs (ii-1)/Fs+T_window]);
ylim([-1 6]);
hold off;

skip_count = T_window*frames*2;

while t_el < T
    x(ii) = read(arduino,1,"uint16");
    if ( x(ii) > 1023 )
        d = uint16(x(ii));
        d_1 = idivide( d , uint16(256) );
        d_2 = rem ( d , uint16(256) );
        x(ii) = d_1 + d_2 * 256;
        v(ii) = x(ii)/1024*5;
    end

    if ( rem(ii,f_max) == 0 )        
        if skip_count > 0
            skip_count = skip_count-1;
        else
            plot(t(ii-T_window*Fs:ii),v(ii-T_window*Fs:ii));
            xlim([t(ii-T_window*Fs) t(ii)] );
        end
    end    
    
    % delay(0.001);
    t_el  = t_el + toc;
    tic;
    ii    = ii + 1;
end

ii = ii - 1;
msg = sprintf("Number of samples: %d",ii-1);
disp(msg);

ii = min(length(t),ii);

v = x/1024*5;

figure;
plot(t(1:ii),v(1:ii));
xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Voltage vs Time signal");
xlim([0 T]);
ylim([-1 6]);