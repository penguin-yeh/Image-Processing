
clear;

%read moon
moon_img = imread('./blurry_moon.tif');
[row, column, numberofchannel] = size(moon_img);%get size

subplot(231);
imshow(moon_img);
title('original');

%Laplacian of moon
moon_img = im2double(moon_img);
test_moon = moon_img;

%padding
zero_edge_img = zeros(row+2, column+2, numberofchannel);
for k = 1:numberofchannel
    for i = 2:row+1
        for j = 2:column+1
            zero_edge_img(i, j, k) = moon_img(i-1, j-1, k);
        end
    end
end

image = zeros(row, column, numberofchannel);
laplacian_mask = [0 1 0; 1 -4 1; 0 1 0];
for k = 1:numberofchannel
    for i = 2:row+1
        for j = 2:column+1
            for a = 1:3
                for b = 1:3
                    image(i-1, j-1, k) = image(i-1, j-1, k) + zero_edge_img(i-2+a, j-2+b, k)*laplacian_mask(a, b);
                end
            end
        end
    end
end
laplacian_moon = moon_img - image;
subplot(232);
imshow(laplacian_moon);
title('Laplacian');

%High-boost filtering
A = 2;
high_boost_moon = laplacian_moon + (A-1)*moon_img;
subplot(233);
imshow(high_boost_moon);
title('High boost filtering');

%read skeleton
skeleton_img = imread('./skeleton_orig.bmp');
[row, column, numberofchannel] = size(skeleton_img);%get size
subplot(234);
imshow(skeleton_img);
title('original');

%Laplacian of moon
skeleton_img = im2double(skeleton_img);
test_skeletion = skeleton_img;

%padding
zero_edge_img = zeros(row+2, column+2, numberofchannel);
for k=1:numberofchannel
    for i = 2:row+1
        for j = 2:column+1
            zero_edge_img(i, j, k) = skeleton_img(i-1, j-1, k);
        end
    end
end

image = zeros(row, column, numberofchannel);
laplacian_mask = [0 1 0; 1 -4 1; 0 1 0];
for k=1:numberofchannel
    for i = 2:row+1
        for j = 2:column+1
            for a = 1:3
                for b = 1:3
                    image(i-1, j-1, k) = image(i-1, j-1, k) + zero_edge_img(i-2+a, j-2+b, k)*laplacian_mask(a, b);
                end
            end
        end
    end
end
laplacian_skeleton = skeleton_img - image;
subplot(235);
imshow(laplacian_skeleton);
title('Laplacian');

%High-boost filtering
A = 3;
high_boost_skeleton = laplacian_skeleton + (A-1)*skeleton_img;
subplot(236);
imshow(high_boost_skeleton);
title('High boost filtering');
