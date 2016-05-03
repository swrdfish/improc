clc;
clear all;

image = importdata('l256.dat');
a = min(image(:));
b = max(image(:));
c = input('Specify  lower range: ');
d = input('Specify  upper range: ');

image = image - a;
ratio = (d - c)/(b - a);

image = floor(image*ratio);
image = image + c;

histo = zeros(1, 256);
normhisto = zeros(1, 256);

% calculate the histogram
[x, y] = size(image);
for i = 1:x
    for j = 1:y
        histo(image(i,j) + 1) = histo(image(i,j) + 1) + 1;
    end
end

% calculate the normalized histogram
total_px = x*y;
for i = 1:256
    normhisto(i) = (histo(i))/total_px;
end

figure(5), plot(histo);

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

histoeq = zeros(1, 257);
for i = 1:x
    for j = 1:y
        histoeq(equalized(i,j) + 1) = histoeq(equalized(i,j) + 1) + 1;
    end
end

figure(6), plot(histoeq);

image = mat2gray(image, [0, 255]);
figure(1), imshow(image);

equalized = mat2gray(equalized);
figure(2), imshow(equalized);
