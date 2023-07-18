function H = ransac(pts, corresp_pts, min_consensus, e, max_iterations, R)
    c=0; %initiall setting the cardinality of consensus set to 0
    d=ceil(min_consensus*R); %d=0.8*|P|
    total_samples=1:length(pts);
    random_samples=randperm(length(pts),R);
    points=pts(random_samples,:); %choosing 4 random points 
    corresponding_points=corresp_pts(random_samples,:); %choosing corresponding points of the before choosen random points
    %getting the remaining points
    remaining_samples=setdiff(total_samples,random_samples);
    remaining_points=pts(remaining_samples,:);
    %remaining_corresponding_points=corresp_pts(remaining_samples,:);
    i=0;
    while i<max_iterations
        for j=1:length(remaining_points)
            H=homography(points,corresponding_points);
            x=remaining_points(j,1);
            y=remaining_points(j,2);
            [x_prime,y_prime]=calculate_corresp_pts(H,[x;y;1]);
            error=sqrt((x-x_prime).^2+(y-y_prime).^2);
            if(error<e)
                c=c+1;
            end
            if(c>=d)
                return;   
            end
        end
        i=i+1;
    end
end