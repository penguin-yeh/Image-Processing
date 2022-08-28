%resatrt
clc;
close all;

%Lena

figure(1);

[img_Lena, map_Lena] = imread('./Lena.bmp');

%global of Lena
[row, col] = size(img_Lena);
glo_Lena = uint8(zeros(row, col));
pixels = row*col;

frequency = zeros(256, 1);
pmf = zeros(256, 1);
cumulative = zeros(256, 1);
result = zeros(256, 1);


for i = 1 : row
    for j = 1 : col
        value = img_Lena(i, j);
        frequency(value+1) = frequency(value+1) + 1;
        pmf(value+1) = frequency(value+1)/pixels;
    end
end

% cumulative convert to gray level
sum = 0;
L = 255;
for i = 1 : 256
    sum = sum + frequency(i);
    cumulative(i) = sum/pixels;
    result(i) = uint8(round(cumulative(i)*L));
end

for i = 1 : row
    for j = 1 :col
         %img_Lena's value:0~255, result'size:1~256
        glo_Lena(i, j) = result(img_Lena(i, j) + 1);
    end
end

%Local of Lena
loc_Lena = uint8(zeros(row, col));

pos = 17;
num = 1;

for i = 0 : 3
    for j = 0 : 3

        %var
        frequency = zeros(256, 1);
        pmf = zeros(256, 1);
        cumulative = zeros(256, 1);
        result = zeros(256, 1);
        block = zeros(64, 64);
        pixels = 64*64;

        for a = i*64+1 : i*64+64
            for b = j*64+1 : j*64+64
                value = img_Lena(a, b);
                frequency(value+1) = frequency(value+1) + 1;
                pmf(value+1) = frequency(value+1)/pixels;
            end
        end

        % cumulative convert to gray level
        sum = 0;
        L = 255;
        for a = 1 : 256
            sum = sum + frequency(a);
            cumulative(a) = sum/pixels;
            result(a) = uint8(round(cumulative(a)*L));
        end

        for a = i*64+1 : i*64+64
            for b = j*64+1 : j*64+64
                loc_Lena(a, b) = result(img_Lena(a, b) + 1);
                block(a-i*64, b-j*64) = loc_Lena(a, b);
            end
        end

        sen = 'block ';
        str = num2str(num);
        sen = [sen, str];
        num = num + 1;

        subplot(8, 4, pos);
        histogram(block);
        title(sen);
        pos = pos + 1;
    end
end


%peppers
[img_peppers, map_pep] = imread('./peppers.bmp');
tmp = img_peppers;

%global of peppers
[row, col] = size(img_peppers);
glo_pep = uint8(zeros(row, col));
pixels = row*col;

frequency = zeros(256, 1);
pmf = zeros(256, 1);
cdf = zeros(256, 1);
result = zeros(256, 1);
cumulative = zeros(256, 1);

for i = 1 : row
    for j = 1 : col
        value = img_peppers(i, j);
        frequency(value+1) = frequency(value+1) + 1;
        pmf(value+1) = frequency(value+1)/pixels;
    end
end

% cumulative convert to gray level
sum = 0;
L = 255;
for i = 1 : 256
    sum = sum + frequency(i);
    cumulative(i) = sum/pixels;
    result(i) = uint8(round(cumulative(i)*L));
end

for i = 1 : row
    for j = 1 :col
        glo_pep(i, j) = result(img_peppers(i, j) + 1);
    end
end

%local of peppers
loc_pep = uint8(zeros(row, col));

pos = 17;
num = 1;

for i = 0 : 3
    for j = 0 : 3

        %var
        frequency = zeros(256, 1);
        pmf = zeros(256, 1);
        cumulative = zeros(256, 1);
        result = zeros(256, 1);
        pixels = 64*64;
        block = zeros(64, 64);

        for a = i*64+1 : i*64+64
            for b = j*64+1 : j*64+64
                value = img_peppers(a, b);
                frequency(value+1) = frequency(value+1) + 1;
                pmf(value+1) = frequency(value+1)/pixels;
            end
        end

        % cumulative convert to gray level
        sum = 0;
        L = 255;
        for a = 1 : 256
            sum = sum + frequency(a);
            cumulative(a) = sum/pixels;
            result(a) = uint8(round(cumulative(a)*L));
        end

        for a = i*64+1 : i*64+64
            for b = j*64+1 : j*64+64
                loc_pep(a, b) = result(img_peppers(a, b) + 1);
                block(a-i*64, b-j*64) = loc_pep(a, b);
            end
        end
        
        sen = 'block ';
        str = num2str(num);
        sen = [sen, str];
        num = num + 1;

        figure(2);
        subplot(8, 4, pos);
        histogram(block);
        title(sen);
        pos = pos + 1;
    end
end

figure(1);
subplot(261);
imshow(img_Lena, map_Lena);
title('Original Lena');

subplot(262);
histogram(img_Lena);
title('Original Lena');

subplot(263);
imshow(glo_Lena, map_Lena);
title('Global Lena');

subplot(264);
histogram(glo_Lena);
title('Global Lena');

subplot(265);
imshow(loc_Lena, map_Lena);
title('Local Lena');

subplot(266);
histogram(loc_Lena);
title('Local Lena');

%peppers
figure(2);
subplot(261);
imshow(img_peppers, map_pep);
title('Original peppers');

subplot(262);
histogram(img_peppers);
title('Original peppers');

subplot(263);
imshow(glo_pep, map_pep);
title('Global peppers');

subplot(264);
histogram(glo_pep);
title('Global peppers');

subplot(265);
imshow(loc_pep, map_pep);
title('Local peppers');

subplot(266);
histogram(loc_pep);
title('Local peppers');





