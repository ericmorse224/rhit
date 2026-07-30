%% Lab 5
%% Section 5
h=pass_through(41);
X=imread('parrots.png'); 
figure(1)
imshow(imfilter(X,h))
figure(2)
imshow(imfilter(X,h,'full'))
avg=ones(41)/41^2;
figure(3)
imshow(imfilter(X,avg,'full'))
figure(4)
imshow(imfilter(X,avg))
figure(5)
imshow(imfilter(X,h,'full','circular'))
figure(6)
imshow(imfilter(X,avg,'full','circular'))
figure(7)
imshow(imfilter(X,h,'full','replicate'))
figure(8)
imshow(imfilter(X,avg,'replicate'))
figure(9)
imshow(imfilter(X,h,'full','symmetric'))
figure(10)
imshow(imfilter(X,avg,'symmetric'))
figure(11)
h3=[-1 0 1; -1 0 1; -1 0 1];
imshow(imfilter(X,h3,'full','symmetric'))