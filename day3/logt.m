clc;
clear all;

const = input('Enter the constant value: ');

image = importdata('l256.dat');
image = mat2gray(image);

temp = const * log(image +1);

imshow(temp);
imwrite(temp, 'log.jpg');
