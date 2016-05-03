clc;
clear all;

image = importdata('l256.dat');

sy = input('ScaleX: ');
sx = input('ScaleY: ');

[m n] = size(image);

o = floor(m*sx);
p = floor(n*sy);

transl = zeros([o p]);

for x =1:o
    for y = 1:p
        j = ceil(x / sx);
        k = ceil(y / sy);
        if j >= 1 && j <= m
            if k >= 1 && k <= n
                transl(x,y) = image(j,k);
            end
        end
    end
end

figure(1), imshow(mat2gray(image));
figure(2), imshow(mat2gray(transl));