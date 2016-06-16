function [mask, result_img] = WarpBack(Source, T_H,mosaic_spec)
%-------------------------------- Step 6 ---------------------------------%
% Function to Warp each image into the projection associated with one of the frames
% using the backward mapping methodand to finally compute the size of the output image 
% by finding the minimum and maximum x and y coordinates.
% Herebilinear interpolationmethodis used to do pixel sampling.... 
width = mosaic_spec(1); % Width of the mosaic image....
height = mosaic_spec(2); % Height of the mosaic image....
[xi yi] = meshgrid( 1:width, 1:height );
xx = (T_H(1,1)*xi+T_H(1,2)*yi+T_H(1,3))./(T_H(3,1)*xi+T_H(3,2)*yi+T_H(3,3));
yy = (T_H(2,1)*xi+T_H(2,2)*yi+T_H(2,3))./(T_H(3,1)*xi+T_H(3,2)*yi+T_H(3,3));
result_img = zeros(height,width,3);
result_img(:,:,1) = (interp2(Source(:,:,1),xx,yy,'*bilinear'));
result_img(:,:,2) = (interp2(Source(:,:,2),xx,yy,'*bilinear'));
result_img(:,:,3) = (interp2(Source(:,:,3),xx,yy,'*bilinear'));
result_img = im2uint8(result_img);
mask = ((result_img(:,:,3))>0);
end