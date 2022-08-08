library(raster)
library(glcm)
library(mapview)

input <- stack("data/After/clipped.tif")

plotRGB(input)

#GLCM features in R: mean, mean_ENVI, variance, variance_ENVI, homogeneity, contrast, dissimilarity, entropy, second_moment, correlation.

glcm_3x3 <- glcm(x=input[[2]],window = c(3,3),shift=list(c(0,1),c(1,1),c(1,0),c(1,-1)))
writeRaster(x=glcm_3x3,file="outputs/glcm_r_3x3_mean.tif", overwrite = T)

glcm_5x5 <- glcm(x=input[[2]],window = c(5,5),shift=list(c(0,1),c(1,1),c(1,0),c(1,-1)))
writeRaster(x=glcm_5x5,file="outputs/glcm_r_5x5_mean.tif", overwrite = T)

glcm_7x7 <- glcm(x=input[[2]],window = c(7,7),shift=list(c(0,1),c(1,1),c(1,0),c(1,-1)))
writeRaster(x=glcm_7x7,file="outputs/glcm_r_7x7_mean.tif", overwrite = T)

glcm_11x11 <- glcm(x=input[[2]],window = c(11,11),shift=list(c(0,1),c(1,1),c(1,0),c(1,-1)))
writeRaster(x=glcm_11x11,file="outputs/glcm_r_11x11_mean.tif", overwrite = T)