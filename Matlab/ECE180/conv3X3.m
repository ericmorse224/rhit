function Y = conv3X3(A, h)
%%function does 3X3 array convlution multiplication of input array A
%%to match medfilt2, h needs to be ones(3)/3^2
A = double(A);  
%%allocates space for output array Y
Y = zeros(size(A));
%%attains dimension imformation of array A
[rows, cols] = size(A);
for r=2:(rows-1)
    for c=2:(cols-1)
        w = A((r-1):(r+1),(c-1):(c+1));
        arrayh = w.*h;
        arrayh = arrayh(:);
        Y(r,c) = sum(arrayh);
    end
end
Y = uint8(Y);
end
