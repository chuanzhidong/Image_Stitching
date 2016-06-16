function out = HomTra(H_3x3, in)
%-------------------------------- Step 5b ---------------------------------%
% Simplefunction used to Apply the calulated homography matrices....
    num_pts = size(in,1);
    homogeneous_coords = ones(num_pts,3);
    homogeneous_coords(:,1:2) = in;
    homogeneous_coords = homogeneous_coords';
    out = H_3x3*homogeneous_coords;
    out(2,:) = out(2,:)./out(3,:);
    out(1,:) = out(1,:)./out(3,:);
    out = out(1:2,:)';
end