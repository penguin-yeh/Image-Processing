function output_img = histogram_equal(img)
    
    [row, col] = size(img);
    output_img = uint8(zeros(row, col));
    pixels = row*col;
    
    frequency = zeros(256, 1);
    pmf = zeros(256, 1);
    cumulative = zeros(256, 1);
    result = zeros(256, 1);

    for i = 1 : row
        for j = 1 : col
            value = img(i, j);
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
            output_img(i, j) = result(img(i, j) + 1);
        end
    end
    
end