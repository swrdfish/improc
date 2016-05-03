file = 'D:\binayak\images dat files\l256.dat';
mat = importdata(file);
% file = 'D:\binayak\day1\ass2\down128.jpg';
% mat = imread(file, 'jpg');
[x, y] = size(mat);

downsample = zeros(x/2, y/2);

for i = 1:2:x
    for j = 1:2:y
        downsample(ceil(i/2), ceil(j/2)) = mat(i, j);
    end
end

image = mat2gray(downsample, [0, 255]);
imwrite(image,'D:\binayak\day1\ass2\down128.jpg' );