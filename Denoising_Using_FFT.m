%This is a demonstration of how a signal can be de noised using FFT 
%The basic idea is to compute the FFT and obtain the Power Spectral Density
%of the signal.On observing the PSD plot,we can set a threshold PSD to
%identify the sample frequencies at which the PSD is below the
%threshold.Then, we can remove those samples from the fft of the given
%signal and apply ifft to obtain the signal in the time domain
%Obtaining the signal in the time domain
dt = 1/2200;
%Sampling rate
fs=1/dt;
%Sampling interval
t = 0:dt:5;
%Clean Signal
f_clean = sin(2*pi*50*t)+cos(2*pi*100*t) ;
%Adding some noise to the signal
f = f_clean + 2.5*randn(size(t)); 
n = length(t);
% Compute the fast Fourier transform
fhat =fft(f,n); 
%Power specteral density 
PSD = fhat.*conj(fhat)/n; 
freq = 1/(dt*n)*(0:n);
% Only plot the first half of freqs since FFT is symmetrical around half
% of the sampling frequency
L = 1:(floor(n/2)+1); 

%Plotting 
subplot(5,1,1)
plot(t,f_clean);%Clean signal

subplot(5,1,2)
plot(t,f);%noisy signal

subplot(5,1,3)
plot(freq(L),abs(fhat(L)));%FFT plot

%Compute PSD
subplot(5,1,4)
plot(freq(L),PSD(L));%PSD Plot
%Setting threshold energy
min=60;
indices=PSD>60;
PSDClean=PSD.*indices;%Removing frequency components having lesser energy than threshold
ffiltered = indices.*fhat;
f_new=ifft(ffiltered);
subplot(5,1,5)
plot(t,f_new);
%sound(f_clean,fs);
%Finally concluding
