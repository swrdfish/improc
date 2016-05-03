clc;
clear all;

image = importdata('l256.dat');

% sy = input('ScaleX: ');
% sx = input('ScaleY: ');

A = input('Angle: ');
A = deg2rad(A);

[m n] = size(image);

transl = zeros([m n]);

for x =1:m
    for y = 1:n
        j = ceil(x*cos(A) - y*sin(A));
        k = ceil(x*sin(A) + y*cos(A));
        if j >= 1 && j <= m
            if k >= 1 && k <= n
                transl(x,y) = image(j,k);
            end
        end
    end
end

figure(1), imshow(mat2gray(image));
figure(2), imshow(mat2gray(transl));