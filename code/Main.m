function mosaic = Main(varargin)
%-------------------------------- Step 2 ---------------------------------%
% The main function calls the all other functions taking care of the pipeline
% and finally generating the required mosaic.
% With the helpof other functions, implements the following...
% Homography transformation
% computation of correspondences
% feathering
%-------------------------------- Specs ---------------------------------%
% Input --> the images in the correct order as mentioned in GetNames.m
% Ex: im_in{9},im_in{10},im_in{8},im_in{11},im_in{7}
% where im_in{9} is the based image present at the center of the required picture
% followed by the respective images on its left and right.
% Output --> The required Mosaic
% All the obtainedimages have been showed in the report and have also been
% shared in the folder named 'results'

time = tic(); % keeping track of time required to ouput the final image...
n = length(varargin); %number of images...
b = varargin{1}; % the base image (center)... 
r_err_alg = 2; % the inlier threshold for RANSAC...
r_limit = 500; % number of iterations for RANSAC...
width_of_base = size(b,2);
height_of_base = size(b,1);
display('Sit back and relax....')
display('the images are being stitched for you...')
B_box = [1 width_of_base 1 height_of_base];
H = zeros(3,3,n); % Initialization of H_3x3 Homography matries
H(:,:,1) = eye(3);
for i = 2 : n
    width_of_Source = size(varargin{i},2);
	height_of_Source = size(varargin{i},1);
    %finding the corresponces between image pairs with the help of SIFT feature descriptors
	% more information has been given in FindCorr.m
    [F_Vec, Descrip] = FindCorr(varargin{i},varargin{i-1});
    %Removing outliers with the help of RANSAC
	%more information has been given in RemOut.m
    [~, H_3x3] = RemOut(F_Vec, Descrip, r_limit, r_err_alg);
    H(:,:,i) = H(:,:,i-1)*H_3x3; %now we have the rqequired H_3x3 homography Matrix...
    SourceB_box = [1 1;width_of_Source 1;1 height_of_Source;width_of_Source height_of_Source];
    %using the computed matrix for Homograaphy transformation....
	%more information has been given in HomTra.m
	BaseB_box = HomTra(H(:,:,i),SourceB_box);
    maxxy = max(BaseB_box);
	minxy = min(BaseB_box);
    
    B_box = [ ceil(min(B_box(1), minxy(1))) ...
        ceil(max(B_box(2), maxxy(1))) ...
        ceil(min(B_box(3), minxy(2))) ...
        ceil(max(B_box(4), maxxy(2))) ];
end

%Co-ordinate Offsets for the base...
xosb = 1 - B_box(1); 
yosb = 1 - B_box(3);
%Translation Matrix....
T_Mat = eye(3);
T_Mat(1,3) = xosb;
T_Mat(2,3) = yosb;
% bounding boxfor the final image....
final_BB = [1+B_box(2) - B_box(1) 1+B_box(4) - B_box(3)];
%Backward warping of the images....
%more information has been given in WarpBack.m
m = cell(1,n); % total images....
mask = cell(1,n);
for i = 1 : n
    T_H = T_Mat*H(:,:,i);
    T_H = inv(T_H); %Translate H...
    [mask{i}, m{i}] = WarpBack(varargin{i}, T_H, final_BB);
end
% Finally feathering the resuting images...
% more information has been given in Feathering.m
mosaic = m{1};
tmp_mask = mask{1};
for i = 2:n
    mosaic = Feathering(mosaic, im2uint8(tmp_mask).*255, m{i}, im2uint8(mask{i}).*255, 'blend');
    tmp_mask = tmp_mask | mask{i};
end

display('The image mosaic has been generated successfully...');
toc(time);% Stop time n report...
end