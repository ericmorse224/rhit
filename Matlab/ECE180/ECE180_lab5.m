%%Eric Morse and Lian Xiu
%%Lab 5
%% Part 1
load lab_5_verify;
h = ones(3)/3^2;
Z = medfilt2(X);
B = conv3X3(X,ones(3)/3^2);
answer = isequal(B, Yconv3x3);

%%isequal(med3X3(X), Ymed3X3);