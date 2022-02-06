clear
clc
SF = 11 ;
BW = 125e3 ;
fc = 5e6 ;%% carrier freq
Power = 50 ;
message = "Hello" ;
%% Sampling
Fs = 15e6 ; 
Fc = 921.5e6 ; %% center of spectrum
%% Transmit Signal
signalIQ = LoRa_Tx(message,BW,SF,Power,Fs,fc) ;%% sadece fc yazarsan sampling frekansının yarısından az olmalı taşıyıc frekans
Sxx = 10*log10(rms(signalIQ).^2) ;
disp(['Transmit Power   = ' num2str(Sxx) ' dBm'])
%% Plots
figure(20)
spectrogram(signalIQ,500,0,500,Fs,'yaxis','centered')
figure(21)
obw(signalIQ,Fs) ;
%% Received Signal
message_out = LoRa_Rx(signalIQ,BW,SF,2,Fs, fc) ;
%% Message Out
disp(['Message Received = ' char(message_out)])

