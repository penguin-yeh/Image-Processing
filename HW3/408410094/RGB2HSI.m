function HSI = RGB2HSI(rgb)
    
    rgb = im2double(rgb);
    
    R = rgb(:,:,1);
    G = rgb(:,:,2);
    B = rgb(:,:,3);
    
    r = R./(R+G+B+eps);
    g = G./(R+G+B+eps);
    b = B./(R+G+B+eps);
        
    numerator = 0.5*((r-g) + (r-b));
    denominator = sqrt(((r-g).^2) + ((r - b).*(g - b)));
    theta = acos(numerator./(denominator+eps));
    H = theta;
    H(b > g) = (2*pi - H(b>g));
    H = H/(2*pi);
    
    S = 1 - (3*(min(min(r,g),b))./(r+g+b+eps));
    I = (R+G+B)/(3);
    %disp(I);
    tmp = zeros(0,0,0);
    tmp(:,:,1) = H;
    tmp(:,:,2) = S;
    tmp(:,:,3) = I;
    HSI = (tmp);
 
end