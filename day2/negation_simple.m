image = importdata('l256.dat');
neg = 255 - image;

image = mat2gray(image);
neg = mat2gray(neg);

figure('name','Original'), imshow(image);
figure('name','Negative'), imshow(neg);

