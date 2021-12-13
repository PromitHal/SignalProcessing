%Declaring the 2-D matrix whose DFT has to be computed
inp_matrix=[1,0,0,0,0,0,0,0;
            0,0,1,0,-1,0,0,0;
            0,0,-1,-1,1,0,0,0;
            0,0,1,0,-1,1,0,0;
            0,-1,1,-1,1,0,0,1;
            0,0,0,0,-1,0,0,0;
            0,0,-1,0,1,0,0,0;
            1,0,0,0,0,0,0,1];
        
N=length(inp_matrix);       
%Declaring a zero matrix         
result_2D_DFT=zeros(N,N);

%Calculating DFT of the 2D Matrix

%Calculating column-wise DFT
for c=1:N
    temp=inp_matrix(c,:);%Extracting a row
    DFT=FT(temp);%DFT of the respective row
    for d=1:N
        result_2D_DFT(c,d)=DFT(d);%Storing the DFT into a matrix
    end
end

%Calculating column-wise DFT
for c=1:N
    temp=result_2D_DFT(:,c);%Extracting a column
    temp=transpose(temp);%Takng transpose of the column matrix
    DFT=FT(temp);%DFT of the respective column
    for d=1:N
        result_2D_DFT(d,c)=DFT(d);%Storing the DFT into a matrix7
    end
end

%Function for calculating  one-dimensional DFT of a sequence
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

