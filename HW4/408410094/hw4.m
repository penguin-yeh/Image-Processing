
%pool
img = imread('pool.png');
edge_img = edge_detect(img);
subplot(231);
imshow(img);
title('original pool');
subplot(234);
imshow(edge_img);
title('edge of pool');


%peppers
img = imread('peppers.png');
edge_img = edge_detect(img);
subplot(232)
imshow(img);
title('original peppers');
subplot(235);
imshow(edge_img);
title('edge of peppers');

%baboon
img = imread('baboon.png');
edge_img = edge_detect(img);
subplot(233)
imshow(img);
title('original babbon');
subplot(236);
imshow(edge_img);
title('edge of babbon');