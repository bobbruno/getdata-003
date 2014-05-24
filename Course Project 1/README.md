# getdata-003
# Coursera John Hopkin's "Getting and Cleaning Data" Course project
===========

This directory contains the `run_analysis.R` file, which processes the _SAMSUNG Dataset_ provided by the course staff. The dataset itself is not on github, so it should be downloaded and decompressed to the same directory as the R script. The script was written and tested in Linux, and therefore will try to load files located on the **"./"** directory. Should this script be run in Windows, the slash must be changed to an inverted slash.

The script executes the following steps:

1. Read all the features from the `features.txt` file;
2. Uses regular expression matching to filter only mean and standard deviation features.
    * We decided to purge the `angle([XYZ], _feature_)` features from the tidy dataset as they did 
      not seem to be a mean or a standard deviation, but a calculatio from other features.
3. Uses regular expression substitution to generate nicer names for these features:
    * Parts of names were separated with dots
    * Parentheses were eliminated
4. Load dat for training and testing sets. A function called `getSet` was created to encapsulate:
    * Generating filenames for datasets, labels and subjects
    * Loading the 3 datafiles for each set
    * Filtering only the relevant features as described before
    * Applying the generated descriptive names
    * Merging data, labels and subjects on a single dataframe
5. Binding train and test data in one complete dataset
6. Generating a *tidy* dataset with the means of all variables by subject and activity

The *tidy* dataset has 180 observations of 62 variables derived directly from those described on the original dataset.
