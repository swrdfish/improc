clc;
clear all;

image = importdata('l256.dat');
transl = zeros(size(image));
[m n] = size(image);

trany = input('Translate X: ');
tranx = input('Translate Y: ');

for x =1:m
    for y = 1:n
        j = (x + tranx);
        k = (y - trany);
        if j > 1 && j<m
            if k > 1 && k<n
                transl(x,y) = image(j,k);
            end
        end
    end
end

imshow(mat2gray(transl));