% arduino = serialport("COM1",115200);

Fs = 1000;
T  = 10;
t  = 0:1/Fs:T;
x  = zeros(size(t));

t_el    = 0;
tic;
ii   = 1;

while t_el < T
    % x(ii) = read(arduino,1,"uint16");
    delay(0.00099);
    t_el  = t_el + toc;
    tic;
    ii    = ii + 1;
end

msg = sprintf("Number of samples: %d",ii-1);
disp(msg);


