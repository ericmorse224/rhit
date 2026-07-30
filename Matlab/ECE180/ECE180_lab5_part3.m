%%Part 4 of ECE180 Lab 5
A = imread('camera.png');
%kernel is the filtering tool that is wished to be used
kernel = 'sharpen';
switch kernel
    case 'average'
        %averages the surrounding pixels
        h = ones(3)/3^2;
    case 'hedges'
        %horizontal edge filter of surrounding pixels
        h = [-1 0 1; -1 0 1; -1 0 1];
    case 'vedges'
        %vertical edge filter of surrounding pixels
        h = [-1 -1 -1; 0 0 0; 1 1 1];
    case 'edges'
        %edge filter of surrounding pixels
        h = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    case 'Laplacian'
        %Laplacian filter of surrounding pixels
        h = [0 -1 0; -1 4 -1; 0 -1 0];
    case 'sharpen'
        %sharpening filter
        h = [0 -1 0; -1 5 -1; 0 -1 0];
    case 'pass'
        %returns original image
        h = [0 0 0; 0 1 0; 0 0 0];
    otherwise
        %no filter used and chose to not return an image, so returns no image
        h = [0 0 0; 0 0 0; 0 0 0];
end
imshowpair(A, conv3X3(A, h), 'montage')
        
        