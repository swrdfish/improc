file = 'D:\binayak\images dat files\newimg.dat';
mat = importdata(file);
% file = 'D:\binayak\day1\ass2\upsample128.jpg';
% mat = imread(file, 'jpg');
[x, y] = size(mat);

downavg = zeros(x/2, y/2);

for i = 1:2:x
    for j = 1:2:y
        temp1  = mat(i, j);
        temp2 = mat(i+1, j);
        temp3 = mat(i+1, j+1);
        temp4 = mat(i, j+1);
        avg = (temp1 + temp2 + temp3 + temp4)/4;
        downavg(ceil(i/2), ceil(j/2)) = avg;
    end
end

image = mat2gray(downavg, [0, 255]);
imwrite(image, 'D:\binayak\day1\ass2\downavg.jpg');