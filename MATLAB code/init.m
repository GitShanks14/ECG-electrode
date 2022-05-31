% Initialize serial connection to Arduino. 
port = "/dev/tty.usbserial-10";     % Will vary from system to system
arduino = serialport(port,115200);  % Initialize serial connection