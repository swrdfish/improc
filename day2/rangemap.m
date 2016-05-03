clc;
clear all;

image = importdata('l256.dat');
a = min(image(:));
b = max(image(:));
c = 0;
d = 50;

temp = image;

temp = temp - a;
ratio = (d - c)/(b - a);

temp = temp*ratio;
temp = temp + c;

temp = mat2gray(temp, [0,255]);
imshow(temp);
imwrite(temp, 'dynamic.png');