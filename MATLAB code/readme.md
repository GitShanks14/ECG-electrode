# MATLAB scripts

## init.m
Establishes serial connection between MATLAB and the Arduino board. This script should be run first, before attempting to record signals using the measure scripts. 
The path to the serial port must be changed according to the setup used. 

## measure_N.m
Records N samples of the signal at the specified sampling frequency, and displays the recorded signal. 

## measure_T.m
Records the signal for T seconds the specified sampling frequency, and displays the recorded signal. 

## terminate.m
Ends the connection between MATLAB and the Arduino board. This script should be run at the end of every session. This script needs to be run for reprogramming the Arduino board as well. 

## Saving the recorded signals:
By default, the files measure_N.m and measure_T.m save the signals to the file recs.mat. A sample save file is provided in the repository as well, where a potentiometer's output voltage was recorded for 10 seconds. 
The file name should be changed every time we record data. Else the previous save file would get overwritten. This issue will be fixed in a later version. 

## Loading saved signals: load_save.m
Load_save.m loads the signals saved in the format followed in the measure files if provided the correct path to the save files. The script also displays the saved signal.
