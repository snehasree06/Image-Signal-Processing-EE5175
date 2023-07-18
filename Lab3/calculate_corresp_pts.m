function [X_prime, Y_prime] = calculate_corresp_pts(H, x)
    % x is of the form [x1, y1, 1], i.e., in homogenous coordinates.
    %  H is the homography matrix 
    x_prime = H*x;
    if x_prime(end) ~= 0
        x_prime = x_prime(1:end-1)./x_prime(end);
    else
        x_prime = [0;0];
    end
    X_prime = x_prime(1);
    Y_prime = x_prime(2);
end