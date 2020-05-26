clear 
clc

%Recording task(Task2)

disp('Start recording for the user')

recObj=audiorecorder;
disp('Start speaking') 

recordblocking(recObj,10);

disp('End of recording')

o=getaudiodata(recObj);


Fs=10000;%sampling frequency
file='recording.wav';
audiowrite(file,o,Fs);


clear Fs
[y,Fs]=audioread('recording.wav');

t=linspace(0.1,0.2,1000);


%plot for message signal
subplot(4,1,1)
plot(y)
  title('Input signal')
  
 Fc=4000;%carrier frequency
  
  
 
  
  subplot(4,1,2)
  C= sin(2*pi*Fc*t); %carrier signal
  plot(t,C)
  title('Carrier signal')
 
  subplot(4,1,3)
   
   l=modulate(y,Fc,Fs,'am'); %modulated signal
 
  plot(l)
 title('Modulated signal') 
  
  subplot(4,1,4)
  
  d=demod(l,Fc,Fs,'am'); %Demodulated signal
  
  plot(d)
  
  title('Demodulated  signal')
  
  pause(5)
  
  sound(d)
  
  

    
   
  
  
  