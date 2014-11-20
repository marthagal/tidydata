Background: Wearable computing is a growing area in data science, with many companies looking to improve their algorithm for 
tracking movements. Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

Raw Data: Each record in the data set contains triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, triaxial angular velocity from the gyroscope, a 561-feature vector with time and frequency domain variables, an activity label, and an identifier of the subject who carried out the experiment.

Processed Data: Features were assigned as column names to the training and test data sets (X_train and X_test). Column names were also assigned to the subject and activity files for both the training and test data sets (subject_train, subject_test, y_train, y_test). The training data sets were merged together using cbind (X_train, y_train, subject_train); same for the test data set (X_test, y_test, subject_test). The training and test data sets were then merged together using rbind. Descriptive activity labels were assigned by created a new variable name (activity_desc), assigning the value using subsetting, and transforming it to a factor variable with six levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The dataset contained many duplicate column names that were not necessary for the analysis (i.e., columns that were not means or standard deviations); these were removed. Columns that contained the word "mean" and "std", along with the activity_desc and subject columns, were selected using the dplyr package. The data was then melted using the reshape2 package with activity_desc and subject as the id variables and the remaining 79 variables (mean and std variables) as the measure variables. Dcast was then used to calculate the mean by subject and activity_desc. 

The resulting tidy_data.txt includes 180 rows and 81 columns. Each entry indicates the average of each variable for each subject and each activity.

* 'subject': An identifier of the subject who carried out the experiment, range is 1-30.
* 'activity': Identify the activities performed by each person: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Other variables are numeric variables:

* prefix 't' and 'f' refer to time domain signals and frequency domain signals, respectively;
* 'acc' and 'gyro' refer to accelerometer and gyroscope, respectively;
* '.x', '.y', and '.z' refer to 3-axial signals respectively;
* '.mean', '.std', and '.meanfreq' refer to mean value, standard deviation, and mean frequency, respectively.

The list of the numeric variables include the following. All units are the same as the original units from the raw data.

* 'tbodyacc.mean.x'
* 'tbodyacc.mean.y'
* 'tbodyacc.mean.z'
* 'tbodyacc.std.x'
* 'tbodyacc.std.y'
* 'tbodyacc.std.z'
* 'tgravityacc.mean.x'
* 'tgravityacc.mean.y'
* 'tgravityacc.mean.z'
* 'tgravityacc.std.x'
* 'tgravityacc.std.y'
* 'tgravityacc.std.z'
* 'tbodyaccjerk.mean.X'
* 'tbodyaccjerk.mean,y'
* 'tbodyaccjerk.mean,z'
* 'tbodyaccjerk.std.x'
'tbodyaccjerk.std.y'
'tbodyaccjerk.std.z'
'tbodygyro.mean.x'
'tbodygyro.mean.y'
'tbodygyro.mean.z'
'tbodygyro.std.x'
'tbodygyro.std.y'
'tbodygyro.std.z'
'tbodygyrojerk.mean.x'
'tbodygyrojerk.mean.y'
'tbodygyrojerk.mean.z'
'tbodygyrojerk.std.x'

'tbodygyrojerk.std.y'

'tbodygyrojerk.std.z'

'tbodyaccmag.mean'

'tbodyaccmag.std'

'tgravityaccmag.mean'

'tgravityaccmag.std'

'tbodyaccjerkmag.mean'

'tbodyaccjerkmag.std'

'tbodygyromag.mean'

'tbodygyromag.std'

'tbodygyrojerkmag.mean'

'tbodygyrojerkmag.std'

'fbodyacc.mean.x'

'fbodyacc.mean.y'

'fbodyacc.mean.z'

'fbodyacc.std.x'

'fbodyacc.std.y'

'fbodyacc.std.z'

'fbodyacc.meanfreq.x'

'fbodyacc.meanfreq.y'

'fbodyacc.meanfreq.z'

'fbodyaccjerk.mean.x'

'fbodyaccjerk.mean.y'

'fbodyaccjerk.mean.z'

'fbodyaccjerk.std.x'

'fbodyaccjerk.std.y'

'fbodyaccjerk.std.z'

'fbodyaccjerk.meanfreq.x'

'fbodyaccjerk.meanfreq.y'

'fbodyaccjerk.meanfreq.z'

'fbodygyro.mean.x'

'fbodygyro.mean.y'

'fbodygyro.mean.z'

'fbodygyro.std.x'

'fbodygyro.std.y'

'fbodygyro.std.z'

'fbodygyro.meanfreq.x'

'fbodygyro.meanfreq.y'

'fbodygyro.meanfreq.z'

'fbodyaccmag.mean'

'fbodyaccmag.std'

'fbodyaccmag.meanfreq'

'fbodybodyaccjerkmag.mean'

'fbodybodyaccjerkmag.std'

'fbodybodyaccjerkmag.meanfreq'

'fbodybodygyromag.mean'

'fbodybodygyromag.std'

'fbodybodygyromag.meanfreq'

'fbodybodygyrojerkmag.mean'

'fbodybodygyrojerkmag.std'

'fbodybodygyrojerkmag.meanfreq'
