clc;
clear all;

image = imread('filament.jpg');
image = rgb2gray(image);
image = double(image);
result = image;
lmean = image;
lstd = image;

winsize = input('Enter window size:');
if(mod(winsize, 2) == 0)
    display('error: wrong window size');
    quit cancel;
end
winsize = floor(winsize/2);

E = 4;
K0 = 0.4;
K1 = 0.02;
K2 = 0.4;

% E = input('Enter value of E:');
% K0 = input('Enter value of K0:');
% K1 = input('Enter value of K1:');
% K2 = input('Enter value of K2:');

globalMean = mean(image(:));
globalStd  = std(image(:), 0, 1);

% pad the imput image
image = padarray(image, [winsize, winsize], 0);
[m n] = size(image);

for x = winsize+1:m-winsize
    for y = winsize+1:n-winsize
        temp = image(x-winsize:x+winsize,y-winsize:y+winsize);
        lm = mean(temp(:));
        ld = std(temp(:), 0, 1);
        lmean(x-winsize, y-winsize) = lm;
        lstd(x-winsize, y-winsize) = ld;
    end
end

[o p] = size(result);
for x = 1:o
    for y = 1:p
        if((lmean(x,y) <= K0*globalMean) && lstd(x,y) <= K2*globalStd &&  lstd(x,y) >= K1*globalStd)
            result(x,y) = E*result(x,y);
%         else
%             result(x,y) = 0;
        end
    end
end

result = mat2gray(result);
image = image(winsize+1:m-winsize,winsize+1:n-winsize);
image = mat2gray(image, [0, 255]);

figure(1), imshow(result);
figure(2), imshow(image);