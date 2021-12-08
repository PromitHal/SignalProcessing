%DISCRETE FOURIER TRANSFORM

%x[n]={x[0],x[1],...x[N-1]}
%total N samples
%X[k]=summation(n goes from zero to N-1)x[n]exp(-j*2*pi/N*k*n)
% k goes from 0 to N-1
%Input discrete sequence:
x=[100,400,300,600,900];

N=length(x);
%DFT Matrix
DFT=zeros(N,N);%initializing the DFT matrix
%Nth root of unity
omega=exp(-i*2*pi/N);
for i=1:length(DFT)
  for j=1:length(DFT)
      DFT(i,j)=power(omega,(i-1)*(j-1));
  end
 
end

%final DFT
x_t=transpose(x);
X=DFT*x_t;%DFT of the input sequence
