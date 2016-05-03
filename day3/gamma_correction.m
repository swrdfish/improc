clc;
clear all;

gamma = input('Specify gamma value: ');
constant = input('Specify  constant value: ');

image = importdata('l256.dat');
image = mat2gray(image);

temp = constant * (image.^gamma);
temp = mat2gray(temp, [0, 1]);

imshow(temp);
imwrite(temp, 'gamma.jpg');