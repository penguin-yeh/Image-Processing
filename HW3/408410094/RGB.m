function enhanced_image = RGB(original_image)

    %split
    [row, col, channel] = size(original_image);
    red_channel = original_image(:,:,1);
    green_channel = original_image(:,:,2);
    blue_channel = original_image(:,:,3);

    red_channel = histogram_equal(red_channel);
    red_channel = im2double(red_channel);
    green_channel = histogram_equal(green_channel);
    green_channel = im2double(green_channel);
    blue_channel = histogram_equal(blue_channel);
    blue_channel = im2double(blue_channel);


    %cat
    tmp = zeros(0,0,0);
    tmp(:,:,1) = red_channel;
    tmp(:,:,2) = green_channel;
    tmp(:,:,3) = blue_channel;
    enhanced_image = (tmp);
end