%%ECE180 PS10
%% P-6.19
h = fvtool([1 2 0 0 -1 -1])
title('P-6.19 frequency response');
%% P-6.20 part a
fvtool([10 -(14*cos(0.2*pi)+3)])
title('P-6.20 part a frequency response');
%% P-6.20 part b
fvtool([54.5 -109*cos(0.2*pi) 54.5])
title('P-6.20 part b frequency response');