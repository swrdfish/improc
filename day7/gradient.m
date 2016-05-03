clc;
clear all;

image = importdata('l256.dat');
delx = image;
dely = image;
result = image;

A = input('Enter constant value:');

% create the mask
mask1 = [1 0 -1];
mask2 = [1; 0; -1];
mask3 = padarray(A+8, [1 1], -1); % sharpning mask

% pad the imput image
image = padarray(image, [1,1], 0);
[m n] = size(image);

% apply the mask1
for x = 2:m-1
    for y = 2:n-1
        temp = image(x:x,y-1:y+1);
        temp = temp.*mask1;
        delx(x-1, y-1) = sum(temp(:));
    end
end

% apply the mask2
for x = 2:m-1
    for y = 2:n-1
        temp = image(x-1:x+1,y:y);
        temp = temp.*mask2;
        dely(x-1, y-1) = sum(temp(:));
    end
end

gradsum = abs(delx) + abs(dely);

% gradsum = delx.*delx + dely.*dely;
% gradsum = sqrt(gradsum);

gradsum = padarray(gradsum, [1, 1], 0);

% apply the mask3
for x = 2:m-1
    for y = 2:n-1
        temp = gradsum(x-1:x+1,y-1:y+1);
        temp = temp.*mask3;
        result(x-1, y-1) =sum(temp(:));
    end
end

result = mat2gray(result);

image = image(2:m-1,2:n-1);
image = mat2gray(image, [0, 255]);

figure(1), imshow(result);
figure(2), imshow(image);