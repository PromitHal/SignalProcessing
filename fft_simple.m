Fs=22000;
dt=1/Fs;
t=0:dt:5;
z=sin(500*2*pi*t)+cos(1000*2*pi*t);
N=length(z);
y=fft(z,N);
e=y(1:floor(N/2)+1);

f=linspace(0,Fs/2,floor(N/2)+1);
plot(f,abs(e));