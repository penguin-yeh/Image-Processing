function enhanced_image = HSI(original_image)

    H = original_image(:,:,1);
    S = original_image(:,:,2);
    I = original_image(:,:,3);

    I = im2uint8(I);
    I = histogram_equal(I);
    I = im2double(I);

    tmp = zeros(0,0,0);
    tmp(:,:,1) = H;
    tmp(:,:,2) = S;
    tmp(:,:,3) = I;
    enhanced_image = (tmp);
end