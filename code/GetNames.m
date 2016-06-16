function [myinput,im_in] = GetNames(testfolder)
%-------------------------------- Step 1 ---------------------------------%
% This function is used to arrange the images in a mov folder in the
% required order. My approach is to make the center image as the base image
% and then stitch the corresponding images on left and right dynamically.
%-------------------------------- Specs ---------------------------------%
% Input --> the folder containing the images to be stitched...
% Ex: GetNames('mov2') or GetNames('mov3')
% Output --> gives the elements of the cell array in the required order
% Ex: im_in{9},im_in{10},im_in{8},im_in{11},im_in{7}
% where im_in{9} is the based image present at the center of the required picture
% followed by the respective images on its left and right. 
testdata = dir(sprintf('%s/*.jpg', testfolder)); % collect the names of the test images...
n = length(testdata);% Number of test images % find the total number of images...
for i = 1:n
   fname = testdata(i).name; % retrive each image name...
   im_fname = im2single(imread(fname)); % get the image... 
   im_in{i} = im_fname; % store all images in an array...
end

c = round(n/2); % find base image
myinput = sprintf('im_in{%d}',c);
for i = 1:floor(n/2)
	% align the images in proper order...
	myinput = strcat(myinput,sprintf(',im_in{%d}',c-i),sprintf(',im_in{%d}',c+i));
end
end