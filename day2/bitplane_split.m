clc;

image = importdata('l256.dat');

[x, y] = size(image);

neg = zeros(x,y);
bitplane = zeros(x,y,8);

for i = 1:x
    for j = 1:y
        bin = dec2binvec(image(i, j));
        [m, n] = size(bin);
        for k = 1:n
            bitplane(i, j, k) = bin(k);
        end
    end
end

% image = mat2gray(image);
% neg = mat2gray(neg);

for i = 1:8

    plane1 = bitplane(:,:,i);
    plane1 = mat2gray(plane1);

    figure(), imshow(plane1);
% figure('name','Negative'), imshow(neg);

end