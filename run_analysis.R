setwd("C:/Users/E17035/Desktop/R/course-project")

## READ DATA

X_train <- read.table("X_train.txt")
X_labels <- read.table("Y_train.txt")
X_test <- read.table("X_test.txt")
Y_labels <- read.table("Y_test.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")


## APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES (STEP 4)

# Assign new column names to feature table and transform the column name column to character
colnames(features)[colnames(features)=="V1"] <- "i"
colnames(features)[colnames(features)=="V2"] <- "col_name"
features_c <- transform(features, col_name = as.character(col_name))

# Assign column names to a vector
col_header <- features_c$col_name

# Paste column names on top of test dataset and training dataset
colnames(X_train) <- paste(col_header)
colnames(X_test) <- paste(col_header)

# Assign new column name to subject files
colnames(subject_train)[colnames(subject_train)=="V1"] <- "subject"
colnames(subject_test)[colnames(subject_test)=="V1"] <- "subject"

# Assign new column name to activity files
colnames(X_labels)[colnames(X_labels)=="V1"] <- "activity"
colnames(Y_labels)[colnames(Y_labels)=="V1"] <- "activity"



## MERGE DATA (STEP 1)

# Merge all training data together
train_merge <- cbind(X_train, X_labels)
train_merge <- cbind(train_merge, subject_train)

# Merge all test data together
test_merge <- cbind(X_test, Y_labels)
test_merge <- cbind(test_merge, subject_test)

# Merge training data and test data together
merged_data <- rbind(train_merge, test_merge)



## ADD DESCRIPTIVE ACTIVITY NAMES (STEP 3)

merged_data$activity_desc <- "WALKING" 
merged_data$activity_desc[merged_data$activity == 2] <- "WALKING_UPSTAIRS" 
merged_data$activity_desc[merged_data$activity == 3] <- "WALKING_DOWNSTAIRS" 
merged_data$activity_desc[merged_data$activity == 4] <- "SITTING" 
merged_data$activity_desc[merged_data$activity == 5] <- "STANDING" 
merged_data$activity_desc[merged_data$activity == 6] <- "LAYING" 



## EXTRACT ONLY MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION (STEP 2)

library(dplyr)
library(data.table)
library(reshape2)

# Remove columns with duplicate column names
data <- merged_data[c(1:302,345:381,424:564)]

# Select only columns with either mean or std in the name, as well as the categorical data
mean_columns <- select(data, contains("mean", ignore.case = "FALSE"))
std_columns <- select(data, contains("std", ignore.case = "FALSE"))
activity_columns <- select (data, contains("activity_desc"))
subject_columns <- select (data, contains("subject"))

# Merge the mean columns, std columns, and categorical datasets together
data_set <- cbind(mean_columns, std_columns, subject_columns, activity_columns)
data_set <- transform(data_set, activity_desc = as.factor(activity_desc))




## CREATE AN INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH SUBJECT/ACTIVITY (STEP 5)

# Melt dataset by activity description and subject
data_table <- as.data.table(data_set)
data_melt <- melt(data_table, id=c("activity_desc","subject"), measure.vars=c(1:79))

# Calculate the mean for each variable by activity description and subject
tidy_data <- dcast(data_melt, subject + activity_desc  ~ variable, mean)

# Write table
write.table(tidy_data, "tidy_data.txt", row.name=FALSE, sep=",")
