clc;
clear all;

gamma = input('Specify gamma value: ');
constant = input('Specify  constant value: ');

invgamma = 1/gamma;
invconst = 1/constant;

image = imread('gamma.jpg');
image = mat2gray(image);

temp = invconst * (image.^invgamma);

temp = mat2gray(temp, [0, 1]);
imshow(temp);
imwrite(temp, 'gammainv.jpg');