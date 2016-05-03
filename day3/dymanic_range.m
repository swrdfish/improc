clc;
clear all;

constant = input('Specify  constant value: ');

image = importdata('l256.dat');
image = mat2gray(image);

for gamma = 1:-0.1:0
   temp = constant * (image.^gamma);
   figure, imshow(temp), title(gamma);
end


