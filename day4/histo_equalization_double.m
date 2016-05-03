clc;
clear all;

image = importdata('l256.dat');

histo = zeros(1, 256);
normhisto = zeros(1, 256);

% calculate the histogram
[x, y] = size(image);
for i = 1:x
    for j = 1:y
        histo(image(i,j)) = histo(image(i,j)) + 1;
    end
end

% calculate the normalized histogram
total_px = x*y;
for i = 1:256
    normhisto(i) = (histo(i))/total_px;
end

% histogram equalization
equalized = zeros(x, y);
sum = 0;
for i = 1:x
    for j = 1:y
        sum = 0;
        for k = 1:image(i,j)
            sum = sum + normhisto(k);
        end
        equalized(i,j) = floor(256*sum);
    end
end


%%%% DO A SECOND PASS %%%%
histo = zeros(1, 257);
normhisto = zeros(1, 257);

% calculate the histogram
for i = 1:x
    for j = 1:y
        histo(equalized(i,j)+1) = histo(equalized(i,j)+1) + 1;
    end
end

% calculate the normalized histogram
total_px = x*y;
for i = 1:256
    normhisto(i) = (histo(i))/total_px;
end

% histogram equalization
equalized2 = zeros(x, y);

for i = 1:x
    for j = 1:y
        sum = 0;
        for k = 1:equalized(i,j)
            sum = sum + normhisto(k);
        end
        equalized2(i,j) = floor(256*sum);
    end
end

image = mat2gray(image);
figure(1), imshow(image);

equalized = mat2gray(equalized);
figure(2), imshow(equalized);

equalized2 = mat2gray(equalized2);
figure(3), imshow(equalized2);
