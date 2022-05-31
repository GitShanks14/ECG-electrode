# Arduino programs

## ECG_test
The folder ECG_test contains a program that samples and records the input signal at the specified frequency, and sends the data to the host computer over a serial connection. 

The specifications of the system are as follows:
1. Default sampling frequency; 1000 Hz
2. Analog pin A0 used, 10 bit ADC output recorded
3. Pin 9 controls an LED to indicate the amplitude of the recorded signal

The circuit diagram is shown below:
![alt text](https://github.com/GitShanks14/ECG-electrode/blob/main/Assets/ECG_test_bb.png)

The given circuit diagram shows a test circuit. The potentiometer circuit should be replacd with the EKG BTA vernier protoboard adapter for recording the ECG signals. The analog output of the adapter should be connected to A0, and power and ground should be connected to the respective pins, as shown in the diagram below. 

![alt text](https://github.com/GitShanks14/ECG-electrode/blob/main/Assets/protoboard_pinout.png)

Compatible with MATLAB scripts Measure_N and Measure_T. Upload the program to the Arduino, disconnect the serial connection between the Arduino IDE and the board, run MATLAB script init followed by the script of choice. 

To change the sampling frequency, please change the interval defined in the Arduino program, and the sampling frequencies defined in the MATLAB scripts. For ECG signals, a sampling frequency of 1000 Hz is neither insufficient nor excessive. 
