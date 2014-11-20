tidydata
========

Getting and Cleaning Data Course Project

The only script for this project is run_analysis.R, which is explained in CodeBook.md. run_analysis.R contains all of the code necessary for merging and tidying the data set, and creating a tidy data file that with average mean and standard deviation info by subject and activity. 

Some packages (dplyr, data.table, and reshape2) must be installed by the user, but are loaded by the script.

The working directory must be set to the parent folder of the unzipped data set (the features and activity_labels files should be in the working directory, while the other six files should be in the child train and test directories). 

The result will be a comman-separated text file ("tidy_data.txt") in the same directory.

