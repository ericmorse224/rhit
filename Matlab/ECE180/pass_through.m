function kernel = pass_through(N)
%%creates a 2D array of all zeros except center element is 1
%pass-through kernel
%N is assumed to be odd
kernel = zeros(N);
kernel((N+1)/2,(N+1)/2) = 1;
end