function [inliers, H] = RemOut(F_Vec, Descrip, r_limit, r_err_alg)
%-------------------------------- Step 4 ---------------------------------%
% In this function we remove theoutliers with RANSAC. 
% Four points are randomly selected and a Homography is computed based on those points, 
% transformed coordinates are compared with the matching point coordinates in the second image,
% Outliers are removed and the process is repeated.
inliers_limit = 0; % initialization
display('Removing outliers with RANSAC...')
% We need four points to pick H and we generate it randomly...
for i = 1:r_limit
    set4 = randperm(size(F_Vec,1),4);% set of random points on the image...
    source = F_Vec(set4,:);% the respective feature vectore for the point...
    destination = Descrip(set4,:);% the respective descriptor...
    H_temp = CalHom(source, destination);
    H_3x3 = HomTra(H_temp, F_Vec);
    mse = sqrt(sum(((H_3x3-Descrip).^2),2));
    [row,~,~] = find(mse < r_err_alg);
    temp_inliers_count = size(row,1);
    if temp_inliers_count > inliers_limit
        inliers = row;
        H = H_temp;
        inliers_limit = temp_inliers_count;
    end
end
end