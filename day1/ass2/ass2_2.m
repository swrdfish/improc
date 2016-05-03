% file = 'D:\binayak\images dat files\newimg.dat';
% mat = importdata(file);
file = 'D:\binayak\day1\ass2\upsample128.jpg';
mat = imread(file, 'jpg');
[x, y] = size(mat);

upsample = zeros(x*2, y*2);

for i = 1:x
    for j = 1:y
        m = i*2;
        n = j*2;
        upsample(m, n) = mat(i, j);
        upsample(m -1, n) = mat(i, j);
        upsample(m -1, n-1) = mat(i, j);
        upsample(m, n-1) = mat(i, j);
    end
end

image = mat2gray(upsample, [0, 255]);
imwrite(image, 'D:\binayak\day1\ass2\upsample256.jpg');