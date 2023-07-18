function [intensity_val, incanvas] = bilinearInterpolation(image, x, y)
    
    [x1, y1] = size(image);% shape of the zero padded image
    %shape of the original image
    x1 = x1-2; 
    y1 = y1-2;
    %the passed image here is a zero padded image so we need to add 1 to each co-ordinate so that 
    %the bilinear interpolation is performed on source image
    x = x+1;
    y = y+1;

    % x', y', a, b 
    x_prime = floor(x);
    y_prime = floor(y);
    a = x-x_prime;
    b = y-y_prime;

    if x_prime >= 1 && x_prime <= x1+1 && y_prime >= 1 && y_prime <= y1+1
        % intensity value using bilinear interpolation
        intensity_val = (1-a)*(1-b)*image(x_prime, y_prime) + (1-a)*b*image(x_prime, y_prime+1) + a*(1-b)*image(x_prime+1, y_prime) + a*b*image(x_prime+1, y_prime+1);
        % If the requested (xs, ys) lies within the source image canvas
        % set incanvas = 1
        incanvas = 1;
    else
        % If the (xs, ys) does not exist in the source imagee, set incanvas = 0
        intensity_val = 0;
        incanvas = 0;
    end

end