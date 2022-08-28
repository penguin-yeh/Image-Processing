%resatrt
clc;
clear;
close all;

%aloe
figure;
img = imread('./aloe.jpg');
subplot(241);
imshow(img);
title('Orginal aloe');

%(1)RGB
RGB_enhanced = RGB(img);
subplot(242);

imshow(RGB_enhanced);
title('RGB enhancement');

%(2)HSI
HSI_aloe = RGB2HSI(img);
HSI_enhanced = HSI(HSI_aloe);
RGB_aloe = HSI2RGB(HSI_enhanced);
subplot(243);
imshow(RGB_aloe);
title('HSI enhancement');

%(3)La*b*
Lab_aloe = RGB2Lab(img);
Lab_enhanced = Lab(Lab_aloe, 2, 10);
RGB_aloe = Lab2RGB(Lab_enhanced);
subplot(244);
imshow(RGB_aloe);
title('La*b* enhancement');

%kitchen
img = imread('./kitchen.jpg');
subplot(245);
imshow(img);
title('Orginal kitchen');

%(1)RGB
RGB_enhanced = RGB(img);
subplot(246);
imshow(RGB_enhanced);
title('RGB enhancement');

%(2)HSI
HSI_aloe = RGB2HSI(img);
HSI_enhanced = HSI(HSI_aloe);
RGB_aloe = HSI2RGB(HSI_enhanced);
subplot(247);
imshow(RGB_aloe);
title('HSI enhancement');

%(3)La*b*
Lab_kitchen = RGB2Lab(img);
Lab_enhanced = Lab(Lab_kitchen, 1.6, -45);
RGB_aloe = Lab2RGB(Lab_enhanced);subplot(248);
imshow(RGB_aloe);
title('La*b* enhancement');

%house
figure;
img = imread('./house.jpg');
subplot(241);
imshow(img);
title('Orginal house');

%(1)RGB
RGB_enhanced = RGB(img);
subplot(242);
imshow(RGB_enhanced);
title('RGB enhancement');


%(2)HSI
HSI_aloe = RGB2HSI(img);
HSI_enhanced = HSI(HSI_aloe);
RGB_aloe = HSI2RGB(HSI_enhanced);
subplot(243);
imshow(RGB_aloe);
title('HSI enhancement');

%(3)La*b*
Lab_house = RGB2Lab(img);
Lab_enhanced = Lab(Lab_house, 1.8, -70);
RGB_aloe = Lab2RGB(Lab_enhanced);subplot(244);
imshow(RGB_aloe);
title('La*b* enhancement');

%church
img = imread('./church.jpg');
subplot(245);
imshow(img);
title('Orginal church');

%(1)RGB
RGB_enhanced = RGB(img);
subplot(246);
imshow(RGB_enhanced);
title('RGB enhancement');


%(2)HSI
HSI_aloe = RGB2HSI(img);
HSI_enhanced = HSI(HSI_aloe);
RGB_aloe = HSI2RGB(HSI_enhanced);
subplot(247);
imshow(RGB_aloe);
title('HSI enhancement');

%(3)La*b*
Lab_church = RGB2Lab(img);
Lab_enhanced = Lab(Lab_church, 2, -10);
RGB_aloe = Lab2RGB(Lab_enhanced);subplot(248);
imshow(RGB_aloe);
title('La*b* enhancement');





