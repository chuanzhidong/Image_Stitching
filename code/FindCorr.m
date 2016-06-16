function [F_Vect, Discript] = FindCorr(im_Source, im_Dest)
%-------------------------------- Step 2 ---------------------------------%
% Using the SIFT matlab function we get the feature frames with center scale
% and orientation the descriptor of the respective frames are represented 
% by Discript. Finally, the matches from the descriptor indices of the image pair  
% are output representing the correspondences...
%-------------------------------- Specs ---------------------------------%
% Input --> the source and destination images...
% Output --> Feature vectors and descriptors...
% converting to classsingle and then to gray scale
display('Computing Correspondence with SIFT...')
im_Source = im2single(im_Source); 
g_source = rgb2gray(im_Source);
im_Dest = im2single(im_Dest); 
g_Dest = rgb2gray(im_Dest);
[F_Vect_s, Discript_s] = vl_sift(g_source);
[F_Vect_d, Discript_d] = vl_sift(g_Dest);
[matches, scores] = vl_ubcmatch(Discript_s, Discript_d);
F_Vect = F_Vect_s(1:2, matches(1, :))';
Discript = F_Vect_d(1:2, matches(2, :))';
end