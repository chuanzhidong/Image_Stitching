% Run one sequence at a time...

[myinput,im_in] = GetNames('mov2');
mymosaic = Main(im_in{11},im_in{10},im_in{12},im_in{9},im_in{13},im_in{8},im_in{14},im_in{7},im_in{15},im_in{6},im_in{16},im_in{5},im_in{17},im_in{4},im_in{18},im_in{3},im_in{19},im_in{2},im_in{20},im_in{1},im_in{21});
imshow(mymosaic)

% [myinput,im_in] = GetNames('mov1');
% mymosaic = Main(im_in{13},im_in{12},im_in{14},im_in{11},im_in{15},im_in{10},im_in{16},im_in{9},im_in{17},im_in{8},im_in{18},im_in{7},im_in{19},im_in{6},im_in{20},im_in{5},im_in{21},im_in{4},im_in{22},im_in{3},im_in{23},im_in{2},im_in{24},im_in{1},im_in{25});
% imshow(mymosaic)
% 
% [myinput,im_in] = GetNames('mov3');
% mymosaic = Main(im_in{9},im_in{8},im_in{10},im_in{7},im_in{11},im_in{6},im_in{12},im_in{5},im_in{13},im_in{4},im_in{14},im_in{3},im_in{15},im_in{2},im_in{16},im_in{1},im_in{17});
% imshow(mymosaic)
% 
% [myinput,im_in] = GetNames('mov4');
% mymosaic = Main(im_in{3},im_in{2},im_in{4},im_in{1},im_in{5});
% imshow(mymosaic)
% 
% [myinput,im_in] = GetNames('mov5');
% mymosaic = Main(im_in{4},im_in{3},im_in{5},im_in{2},im_in{6},im_in{1},im_in{7});
% imshow(mymosaic)
% 
% [myinput,im_in] = GetNames('mov6');
% mymosaic = Main(im_in{3},im_in{2},im_in{4},im_in{1},im_in{5});
% imshow(mymosaic)
% 
