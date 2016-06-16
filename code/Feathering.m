function im_out = Feathering(Source_Wrapped, m_Source, Destination_Wrapped, m_Destination, mode)
%-------------------------------- Step 7 ---------------------------------%
% Composite all the images using a feathering algorithm that uses a bilinear 
% weighting function for all of the pixels contributing at a given point. 
% This method is described in Equation (9) in the paper by R. Szeliski, 
% Video mosaics for virtual environments, IEEE Computer Graphics and 
% Applications 16(2), 1996, 22-30. This is done to avoid any seams that
% might be noticedafter the finalmosaic is created...

%converting the inputs to double and then to binary source...
display('Blending all images together...')
height = size(Source_Wrapped, 1);
width = size(Source_Wrapped, 2);

if strcmp(mode, 'overlay')
    m_Destination = ~m_Destination;
    im_out = double(Source_Wrapped) .* cat(3, m_Destination, m_Destination, m_Destination) + double(Destination_Wrapped);
end

if strcmp(mode,'blend')
    m_Source = ~ logical(m_Source);
    m_Destination = ~ logical(m_Destination);
    
    Destination_f =bwdist(m_Source);
    Destination_f = Destination_f./max(max(Destination_f));
    
    Destination_h =bwdist(m_Destination);
    Destination_h = Destination_h./max(max(Destination_h));    
    Destination_t = Destination_f + Destination_h;
    nzidx = find(Destination_t > 0);
    Source_Wrapped = double(Source_Wrapped);
    Destination_Wrapped = double(Destination_Wrapped);

    weightFish = 1 : -1/(width-1) : 0;
    weightFishMatrix = repmat(weightFish, size(Source_Wrapped, 1), 1);

    weightHorse = 1 - weightFish;
    weightHourseMatrix = repmat(weightHorse, size(Destination_Wrapped, 1), 1);

    im_out = zeros(size(Source_Wrapped));
    for i = 1 : 3
      im_out(:, :, i) = ((Source_Wrapped(:, :, i) .* Destination_f + Destination_Wrapped(:, :, i) .* Destination_h));
    end
    r = im_out(:,:,1);
    g = im_out(:,:,2);
    b = im_out(:,:,3);
    r(nzidx) = r(nzidx)./Destination_t(nzidx);
    g(nzidx) = g(nzidx)./Destination_t(nzidx);
    b(nzidx) = b(nzidx)./Destination_t(nzidx);
    im_out(:,:,1) = r;
    im_out(:,:,2) = g;
    im_out(:,:,3) = b;
end
im_out = uint8(im_out);
end