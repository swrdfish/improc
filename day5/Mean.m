clc;
clear all;

image = importdata('l256.dat');
winsize = input('Enter window size:');

if(mod(winsize, 2) == 0)
    display('error: wrong window size');
    quit cancel;
end

padsize = floor(winsize/2);
image = padarray(image, [padsize padsize], 0);

for x = padsize + 1:padsize+257
    
end