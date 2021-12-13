N=8;
inp_matrix=zeros(N,N);
for i=1:N
    for j=1:N
       inp_matrix(i,j)=i+j;
    end
end
inp_matrix=[1,0,0,0,0,0,0,0;0,0,1,0,-1,0,0,0;0,0,-1,-1,1,0,0,0;0,0,1,0,-1,1,0,0;0,-1,1,-1,1,0,0,1;0,0,0,0,-1,0,0,0;0,0,-1,0,1,0,0,0;1,0,0,0,0,0,0,1];
new_matrix=zeros(N,N);
y=[0,1,1,2,3,5,8,13,21,34,55];

%FFT OF 2d matrix:
%Column nwise
for c=1:N
    temp=inp_matrix(c,:);
    DFT=FT(temp);
    for d=1:N
        new_matrix(c,d)=DFT(d);
    end
end
%Row wise
for c=1:N
    temp=new_matrix(:,c);
    temp=transpose(temp);
    DFT=FT(temp);
    for d=1:N
        new_matrix(d,c)=DFT(d);
    end
end














function DFT =FT(x)
    N=length(x);%Length of the sequence
    %DFT Matrix
    DFT_matrix=zeros(N,N);%initializing the DFT mat1rix
    %Nth root of unity
    omega=exp(-1i*2*pi/N);
    for m=1:length(DFT_matrix)
       for n=1:length(DFT_matrix)
           DFT_matrix(m,n)=power(omega,(m-1)*(n-1));
       end
   
    end
       %Calculating DFT sequence

     x_t=transpose(x);%Taking transpose of input sequence matrix

     DFT=DFT_matrix*x_t;%DFT of the input sequence


end

