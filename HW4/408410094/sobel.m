function enhanced = sobel(img)

    [row, column, numberofchannel] = size(img);

    img = im2double(img);

    %padding
    zero_edge_img = zeros(row+2, column+2, numberofchannel);
    for k = 1:numberofchannel
        for i = 2:row+1
            for j = 2:column+1
                zero_edge_img(i, j, k) = img(i-1, j-1, k);
            end
        end
    end

    %sobel filtering
    a_image = zeros(row, column, numberofchannel);
    sobel_mask = [-1 -2 -1; 0 0 0; 1 2 1];
    for k = 1:numberofchannel
        for i = 2:row+1
            for j = 2:column+1
                for a = 1:3
                    for b = 1:3
                        a_image(i-1, j-1, k) = a_image(i-1, j-1, k) + zero_edge_img(i-2+a, j-2+b, k)*sobel_mask(a, b);
                    end
                end
            end
        end
    end

    b_image = zeros(row, column, numberofchannel);
    sobel_mask = [-1 0 1; -2 0 2; -1 0 1];
    for k = 1:numberofchannel
        for i = 2:row+1
            for j = 2:column+1
                for a = 1:3
                    for b = 1:3
                        image(i-1, j-1, k) = b_image(i-1, j-1, k) + zero_edge_img(i-2+a, j-2+b, k)*sobel_mask(a, b);
                    end
                end
            end
        end
    end

    for i = 1:row
        for j = 1:column
            if a_image(i, j) < 0
                a_image(i, j) = a_image(i, j) * (-1);
            end
        end
    end

     for i = 1:row
        for j = 1:column
            if b_image(i, j) < 0
                b_image(i, j) = b_image(i, j) * (-1);
            end
        end
    end

    enhanced = a_image + b_image;
end