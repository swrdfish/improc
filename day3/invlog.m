clc;
clear all;

const = input('Enter the constant value: ');

% image = importdata('l256.dat');
image = imread('log.jpg');
image = mat2gray(image);

temp = exp(image/const) -1;

imshow(temp);
imwrite(temp, 'invlog.jpg');
