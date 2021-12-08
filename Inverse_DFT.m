%DISCRETE FOURIER TRANSFORM
%x[n]={x[0],x[1],...x[N-1]}
%total N samples
%X[k]=summation(n goes from zero to N-1)x[n]exp(-j*2*pi/N*k*n)
% k goes from 0 to N-1
%Input discrete sequence:
X=[1,2,3,4];

N=length(X);
%DFT Matrix
DFT=zeros(N,N);%initializing the DFT matrix
%Nth root of unity
omega=exp(-i*2*pi/N);
for i=1:length(DFT)
  for j=1:length(DFT)
      DFT(i,j)=power(omega,(i-1)*(j-1));
  end

end
DFT_inv=conj(DFT);
%final DFT
X_t=transpose(X);
x=DFT_inv*X_t/N;%DFT of the input sequence
%Plotting the DFT coefficients

%Real coefficients
figure,
n=[1,2,3,4];
stem(n,real(x),'green');
xlabel('index of sequence');
ylabel('Real part of Sequence');
title('Inverse DFT');

%Imaginary coefficients
figure,
n=[1,2,3,4];
stem(n,imag(x),'red');
xlabel('index of sequence');
ylabel('Imaginary part of Sequence');
title('Inverse DFT');
