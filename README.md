# Damage Assessment with Satellite Imagery for the 2021 Haiti Earthquake

Post-earthquake damage assessment with satellite imagery for the 2021 Haiti earthquake in context of the course *Analysis of High-Resolution Remote Sensing Imagery* (WWU Münster, Germany)

## Introduction

Haiti is a region that has been affected by many different earthquakes in its history. In the morning of the 14th August 2021, a magnitude 7.2 earthquake struck the Tiburon Peninsula in the Caribbean nation of the country. According to the Haitian Civil Protection Agency, at least 37,300 or more homes were destroyed and 46,000 others were damaged as of August 16 [1]. 


## Study Area

The study area is focused in a small portion of the city of Les Cayes, which is Haiti's third-largest city and was the closest one to the epicenter of the earthquake.


## Data

The [MAXAR](https://www.maxar.com/open-data) open data portal provides high resolution imagery for select sudden onset major crisis events. The data covers different years (2010-present) and most of it is separate in pre and post event images. The specific data for the Haiti Earthquake can be found [here](https://www.maxar.com/open-data/haiti-earthquake-2021).

The data for the study area is provided as Analysis-Ready Data (ARD) from Maxar Technologies. Below the images which cover the study area are listed.

Pre-event imagery:
- 10300100A450A500.tif
  - April 05, 2020
  - Satellite position slightly to the east
  - Good image quality
  - Low amount of shadows
  - RGB
- 10300100B4C41A00.tif
  - Feb. 27, 2021
  - Satellite position to the south-west
  - Good image quality
  - RGB
- 1050010024A51F00.tif
  - May 31, 2021
  - Satellite position to the south
  - Blurry due to clouds, noisy
  - RGB
- 10300100C1BBC200.tif
  - July 13, 2021
  - Satellite position to the south-east
  - RGB

Post-event imagery:
- 10200100B6492E00.tif
  - Aug. 14, 2021
  - Satellite position to the south-west
  - Low spatial resolution
  - Grayscale
- 104001006CA11700.tif
  - Aug. 15, 2021
  - Satellite position to the north
  - Good image quality
  - RGB
- 10200100B5C6CC00.tif
  - Aug. 15, 2021
  - Satellite position to the south-east
  - Grayscale

For the pre-event imagery we used an image cropped to the study area from the image 10300100A450A500.tif because of the good image quality and steep viewing angle. This image can be compared to the post-event image 104001006CA11700.tif from the 15th August 2021. The post-event image is also an RGB image, taken from a lower angle from the north. In some of the images artefacts are present (white spots with sharp black borders). Because the spatial resolution of the grayscale images provided by Maxar is not higher than the resolution of the multispectral images, we only considered the multispectral images for the analysis.

## Methodology

The image processing workflow is carried out with the QGIS Processing Toolbox. At first, the pre-event and post-event images are cropped to the study area with the function ``gdal:cliprasterbymasklayer``.

Afterwards we tried out different approaches on the selected images:

- Edge detection
- Texture analysis

- GEOBIA
In the Object-Based Image Analysis (GEOBIA) approach we tried two different workflows. In the first workflow we used the following tools:
  - Generic Region Merging (OTB) -> to do the segmentation itself 
  - Polygone raster to vector (Gdal) -> transform the output from the GRM tool that is a raster file to a shape file
  - Polygon shape indices (saga) -> increase the information that will be shown in the attribute table
  - Zonal statistics -> based on the original input image and the vector file from the segmentation some statistics are returned (mean, stdev, max, min)
As a last step, there is the possibility to use the extract by attribute (vector selection) tool for selecting specific wanted features based on the zonal statistics results. However, by looking at the values, we were not able to identify the two main destroyed buildings in the study area selected for this study.
In the second approach, instead of using the Generic Region Merging module, we used the following workflow:
  - create sample polygons that are going to be used to classify the objects 
  - Segmentation (OTB) -> to do the segmentation itself
  - Zonal Statistics (OTB) -> return statistics (mean, stdev, max, min) based on the original image of the study area 
  - Join attributes by location (vector general) -> join the result from zonal statistics with the sample points that will be used to classify the structures 
  - TrainVectorClassifier (otb) -> train the classification model by using the result of (mean, stdev) from the zonal statistics tool (together with the sample polygons that were joined in the previous step)
  - VectorClassifier (otb) -> use the trained model with the original value of zonal statistics (without the sample polygons)
In this approach, different classifiers can be used when training the model. One layer for each one of the following classifiers were done: libsvm, knn, rf, bayes, boost.  


## Results

By using the GEOBIA approach, when using both segmentation approaches described in the methodology section (GenericRegionMerging and Segmentation), the results were not conclusive. Even using different classifiers when training the classification model the two main destroyed buildings and other partially destroyed buildings were not fully identified. The trees and grass areas were easily identified by most of the classifiers (except by the boost). 

## References 

[1] "Haiti: Earthquake – Flash Update No. 2 (16 August 2021) – Haiti". ReliefWeb. 2021. Archived from the original on 16 August 2021. Retrieved 16 August 2021.
