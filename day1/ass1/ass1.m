file = 'D:\binayak\images dat files\newimg.dat';
mat = importdata(file);
[x, y] = size(mat);
min = 255;
max = 0;
bin = zeros(x, y);

for index = 1:numel(mat)
    elem = mat(index);
    if elem > max
        max = elem;
    end
    if elem < min
        min = elem;
    end
end
thresh = (min + max)/2;
disp(['Min: ', num2str(min)]);
disp(['Max: ',  num2str(max)]);
disp(['Thresh', num2str(thresh)]);
for index = 1:numel(mat)
    elem = mat(index);
    if elem > thresh
        bin(index) = 1;
    end
end
binary =  mat2gray(bin, [0 1]);
imwrite(binary, 'D:\binayak\binary1.jpg');

for index = 1:numel(mat)
    elem = mat(index);
    if elem > 128
        bin(index) = 1;
    end
end
binary =  mat2gray(bin, [0 1]);
imwrite(binary, 'D:\binayak\binary2.jpg');
