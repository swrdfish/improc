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
histoout = zeros(1, 256);

% calculate the histogram
[x, y] = size(image);
for i = 1:x
    for j = 1:y
        histo(image(i,j) + 1) = histo(image(i,j) + 1) + 1;
    end
end

% calculate the normalized histogram
total_px = x*y;
normhisto = histo/total_px;

% create the output histogram
for i = 1:256
    if(i<128)
        histoout(i) = i;
    else
        histoout(i) = 256-i;
    end
end

% calculate the normalized histogram
normhistout = histoout/sum(histoout);

% calculate the cdf for input and output histogram
cdf = zeros(1, 256);
cdf(1) = normhisto(1);
for i = 2:256
   cdf(i) = cdf(i-1) + normhisto(i);
end

cdfout = zeros(1, 256);
cdfout(1) = normhistout(1);
for i = 2:256
    cdfout(i) = cdfout(i-1) + normhistout(i);
end

% do the mapping from input to target
newimage = zeros(size(image));
for i = 1:x
    for j = 1:y
        s = cdf(image(i, j) + 1);
        % find the corresponding z
        for k = 1:256
            if(abs(cdfout(k) - s) < 0.005)
                newimage(i,j) = k;
                break;
            end
        end
    end
end

histofinal = zeros(1,256);
for i = 1:x
    for j = 1:y
        histofinal(newimage(i,j) + 1) = histofinal(newimage(i,j) + 1) + 1;
    end
end

figure(1), plot(normhistout);
figure(2), plot(normhisto);
figure(3), plot(cdf);
figure(4), plot(cdfout);
newimage = mat2gray(newimage);
figure(5), imshow(newimage);
image = mat2gray(image, [0,255]);
figure(6), imshow(image);
figure(7), plot(histofinal);