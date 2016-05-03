clc;
clear all;

a = input('Specify the lower limit: ');
b = input('Specify  the upper limit: ');

image = importdata('l256.dat');
[x, y] = size(image);
temp = zeros(x,y);

if a > b
    c = a;
    a = b;
    b = c;
end

for i=1:x
   for j=1:y
       if a <= image(i,j) && image(i, j) <= b
           temp(i,j) = 1;
       end
   end
end

imshow(temp);