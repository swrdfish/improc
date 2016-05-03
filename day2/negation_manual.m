clc;
clear all;

image = importdata('l256.dat');

[x, y] = size(image);

neg = zeros(x,y);
bin = zeros(1, 8);
nbin = bin;

for i = 1:x
    for j = 1:y
        dec = image(i,j);
        for k = 1:8
            bin(k) = mod(dec, 2);
            dec = floor(dec/2);
        end
        nbin = ~bin;
        dec = 0;
        for k = 8:-1:1
            dec = dec*2 + nbin(k);
        end
        neg(i,j) = dec;
    end
end

image = mat2gray(image);
neg = mat2gray(neg);

figure('name','Original'), imshow(image);
figure('name','Negative'), imshow(neg);

