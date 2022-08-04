# Haiti_Earthquake_2021

Post-Earthquake Damage Assessment for Haiti Earthquake 2021 imagery for Analysis of High Resolution Imagery Class (WWU Münster).

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
  - satellite position slightly to the east
  - good image quality
  - not many shadows
  - RGBA
- 10300100B4C41A00.tif
  - Feb. 27, 2021
  - satellite position to the south-west
  - good image quality
  - RGBA
- 1050010024A51F00.tif
  - May 31, 2021
  - satellite position to the south
  - RGBA
  - blurry due to clouds, noisy
- 10300100C1BBC200.tif
  - July 13, 2021
  - satellite position to the south-east
  - RGBA

Post-event imagery:
- 10200100B6492E00.tif
  - Aug. 14, 2021
  - satellite position to the south-west
  - low spatial resolution
  - Grayscale
- 104001006CA11700.tif
  - Aug. 15, 2021
  - satellite position to the north
  - good image quality
  - RGBA
- 10200100B5C6CC00.tif
  - Aug. 15, 2021
  - satellite position to the south-east
  - Grayscale

For the pre-event imagery we used an image cropped to the study area from the image 10300100A450A500.tif because of the good image qualtity and steep viewing angle. This image can be compared to the post-event image 104001006CA11700.tif from the 15th August 2021. The post-event image is also an RGB image, taken from a lower angle from the north. In some of the images artefacts are present (white spots with sharp black borders). Because the spatial resolution of the grayscale images provided by Maxar is not higher than the resolution of the multispectral images, we only considered the multispectral images for the analysis.


## References 

[1] "Haiti: Earthquake – Flash Update No. 2 (16 August 2021) – Haiti". ReliefWeb. 2021. Archived from the original on 16 August 2021. Retrieved 16 August 2021.
