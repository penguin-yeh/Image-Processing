function edge = edge_detect(img)

    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);


    R = sobel(R);
    G = sobel(G);
    B = sobel(B);

    edge = (R+G+B)/3;

    %{
    tmp = zeros(0,0,0);
    tmp(:,:,1) = R;
    tmp(:,:,2) = G;
    tmp(:,:,3) = B;
    edge = (tmp);
    %}
    
end