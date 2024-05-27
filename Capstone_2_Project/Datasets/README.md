# Datasets for Capstone 2 Project
* The data we are using for this project is called **Automated measurement of fetal head circumference using 2D ultrasound images**.
* The data for this project originated from a medical imaging challenge that began in the year 2018 called “Automated measurement of fetal head circumference using 2d ultrasound images”. The results were originally published in a journal article by van den Heuvel et al.
      * Citation: Thomas L. A. van den Heuvel, Dagmar de Bruijn, Chris L. de Korte and Bram van Ginneken. Automated measurement of fetal head circumference using 2D ultrasound images. PloS one, 13.8 (2018): e0200412.
      * Citation: Thomas L. A. van den Heuvel, Dagmar de Bruijn, Chris L. de Korte and Bram van Ginneken. Automated measurement of fetal head circumference using 2D ultrasound images [Data set]. Zenodo. http://doi.org/10.5281/zenodo.1322001


* The dataset source links:
     * Main Data files: https://zenodo.org/records/1327317
     * Metadata info: https://ieee-dataport.org/documents/automated-measurement-fetal-head-circumference-using-2d-ultrasound-images


## The dataset has 4 files:
1. **test_set.zip** - a file of `.png` images
2. **test_set_pixel_size.csv** - the test set pixel size measurements in mm for each `.png` file
3. **training_set.zip** - a file of `.png` training images and associated "annotation" image with labels for training our models. The annotations in this file we will use to create "masks" in data pre-processing steps for training a model.
3. **training_set_pixel_size_and_HC.csv** - similar to the test set CSV file this has the pixel size measurements for each `.png` file as well as another column for head circumference in mm which is one of the prediction tasks for this project to attempt to measure the head circumference of a fetus in each image.
