clc;
clear all;

image = importdata('fu256.dat');

laplacian = image;
laplacian2 = image;

A = input('Enter constant value:');

% create the mask
mask = padarray(-8, [1 1], 1);
mask2 = [[0 1 0]; [1 -4 1]; [0 1 0]];
mask3 = padarray(A+8, [1 1], -1);

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

% apply the mask2
for x = 2:m-1
    for y = 2:n-1
        temp = image(x-1:x+1,y-1:y+1);
        temp = temp.*mask3;
        laplacian2(x-1, y-1) =sum(temp(:));
    end
end



image = image(2:m-1,2:n-1);

figure(1), imshow(mat2gray(laplacian, [0, 255]));
figure(2), imshow(mat2gray(laplacian2, [0, 255]));
figure(3), imshow(mat2gray(image, [0, 255]));
