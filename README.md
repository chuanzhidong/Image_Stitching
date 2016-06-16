###Image Mosaic Generation

##Image Mosaic:
The task here is to generate a single image from a collection of smaller, overlapping, multiple photographic images. The process itself is divided into three main categories, namely image registration, calibration and blending.

##Registration
The whole purpose of registration is to be able to compare or integrate the data obtained from these different measurements. This process involves transformation different sets of data into one coordinate system and finds its applications in compiling and analysing images and data from satellites, target recognition for military, brain mapping and biomedical imaging.

##Calibration
When images are taken with wide-angle lenses, it is often necessary to model lens distortions such as radial distortion. This paradigm is generally used to eliminate the defects such as distortions, exposure differences between images, camera response etc., that might have been induced by the camera. This process is usually followed by image alignment where we transform an image to match the view point of the image it is being composted with.

##Blending
In this process we remap the images to an output projection by executing the modifications that we figure out in the previous stages. The objective here is to minimize the visibility of seams between images by minimizing intensity difference of the overlapping images and removing the wavy effect of the output mosaic.
Images acquired by a camera rotating about its centre are related to each other by a planar homography. A set of such images may be registered with the plane of one of the images by projectively warping the other images, a few such examples have been shown in the results section. The most important task of this process is to Compute the homography H which maps one of the other images of the set to this reference image. These homographies are calculated by picking four corresponding points on the image set. One of the purposes of this assignment is realization of the importance of the camera centre. The paradigm discussed here is referred to as plane projective transformation and is applicable only for those images which are obtained with the same camera centre since such images are projectively equivalent and so have the same projective properties.

The implementation of planar panoramic mosaicking with projective transformation has been discussed in detail below. The process has been explained briefly with the help of flow chart followed by a detailed explanation on the steps taken to write the code and the methods used to accomplish each step.

https://drive.google.com/open?id=0B2o4ZpVQh__LclZNT1lGZnFSM00


###How to run:

Before running the code, please make sure that the folder sift_lib along with all the 'mov' folders containing the image sequences are in the same folder.
open the file Run_Test_Images.m in matlab and uncomment the sequence you wish to run. It is suggested to comment all other lines in the file to avoid confusion.

Happy Image Stitching!!!!
-Syed Ahmed... 