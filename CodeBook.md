Background: One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, 
Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the 
course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

Raw Data: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each 
person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the 
data manually.

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency 
domain. 

Processed Data: Features were assigned as column names to the training and test data sets (X_train and X_test). Column names were also assigned to the subject and activity files for both the training and test data sets (subject_train, subject_test, X_labels, Y_labels). The training data sets were merged together using cbind (X_train, X_labels, subject_train); same for the test data set (X_test, Y_labels, subject_test). The training and test data sets were then merged together using rbind. Descriptive activity labels were assigned by created a new variable name (activity_desc), assigning the value using subsetting, and transforming it to a factor variable with six levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The dataset contained many duplicate column names that were not necessary for the analysis (i.e., columns that were not means or standard deviations); these were removed. Columns that contained the word "mean" and "std", along with the activity_desc and subject columns, were selected using the dplyr package. The data was then melted using the reshape2 package with activity_desc and subject as the id variables and the remaining 79 variables (mean and std variables) as the measure variables. Dcast was then used to calculate the mean by subject and activity_desc. 
