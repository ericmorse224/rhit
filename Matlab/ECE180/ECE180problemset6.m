%%Eric Morse ECE180 Problem Set 6
%% 1(c) and 1(d)
X = [0 0 0 0 1 1 1 2 2 2 5 5 5 5 5 0 0 0 0 0 0];
Y = filter([1 0 -1], 1, X);
%stem(-5:15, X);
%stem(-5:15, Y);
%% 2(c) and 2(d)
Y = filter([1/3 1/3 1/3], 1, X);
%stem(-5:15, X);
%stem(-5:15, Y);
%% 3
format compact;
X = 5 * cos(pi/4*(0:20));
Y = filter([1 0 0 0 1], 1, X);
%stem(0:20, X);
stem(0:20, Y);
%% 4
h = [3 -2 4 -4 5 -10];
X = [2 4 10 0 -10 0];
conv(X, h)
%% 5
h = [-10 5 -4 4 -2 3];
X = [2 4 10 0 -10];
conv(X, h)