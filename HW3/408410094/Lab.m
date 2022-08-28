function enhanced_img = Lab(img, a_, b_)
  
    L = img(:,:,1);
    a = img(:,:,2);
    b = img(:,:,3);
    
    L = a_.*L + b_;
    

    tmp = zeros(0,0,0);
    tmp(:,:,1) = L;
    tmp(:,:,2) = a;
    tmp(:,:,3) = b;
    enhanced_img = (tmp);

end