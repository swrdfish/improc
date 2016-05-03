clc;

image = importdata('l256.dat');

[x, y] = size(image);

neg = zeros(x,y);

for i = 1:x
    for j = 1:y
        bin = dec2binvec(image(i, j));
        nbin = ~bin;
        neg(i, j) = binvec2dec(nbin); 
    end
end

image = mat2gray(image);
neg = mat2gray(neg);

figure('name','Original'), imshow(image);
figure('name','Negative'), imshow(neg);

