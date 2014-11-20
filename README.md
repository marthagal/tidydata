tidydata
========

Getting and Cleaning Data Course Project

The only script for this project is run_analysis.R, which is explained in CodeBook.md. run_analysis.R contains all of the code necessary for merging and tidying the data set, and creating a tidy data file that with average mean and standard deviation info by subject and activity. 

Some packages (dplyr, data.table, and reshape2) must be installed by the user, but are loaded by the script.

The working directory must be set to the parent folder of the unzipped data set (the features and activity_labels files should be in the working directory, while the other six files should be in the child train and test directories). 

The result will be a comma-separated text file ("tidy_data.txt") in the same directory.

Background: Wearable computing is a growing area in data science, with many companies looking to improve their algorithm for tracking movements. Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.
