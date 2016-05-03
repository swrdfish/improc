clc;
clear all;

image = importdata('l256.dat');
laplacian = image;

% create the mask
mask = padarray(-8, [1, 1], 1);

% pad the imput image
image = padarray(image, [1,1], 0);
[m n] = size(image);

% apply the mask
for x = 2:m-1
    for y = 2:n-1
        temp = image(x-1:x+1,y-1:y+1);
        temp = temp.*mask;
        laplacian(x-1, y-1) = sum(temp(:));
    end
end

laplacian = mat2gray(laplacian, [0,255]);
image = image(2:m-1,2:n-1);
image = mat2gray(image, [0, 255]);

figure(1), imshow(laplacian);
figure(2), imshow(image);