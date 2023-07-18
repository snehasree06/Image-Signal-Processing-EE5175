function kernel = generate_kernel(sigma)
        k_size = ceil(6*sigma+1);
        if mod(k_size, 2) == 0
                k_size = k_size+1;
        end
        d = ceil(k_size/2);
        if d == 0
                kernel = ones(w, w);
        else
                [x, y] = meshgrid(1:k_size, 1:k_size);
                exponent = -((x-d).^2 + (y-d).^2)/(2*sigma^2);
                kernel = exp(exponent);
                kernel = kernel/sum(kernel(:));
        end
end