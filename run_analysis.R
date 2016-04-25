rm(list=ls())
library(plyr)
library(dplyr)

# This script assumes you have downloaded the data from
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# and unzipped it into a folder called "UCI HAR Dataset" in your current working directory.

# 1. Merge the training and the test sets for the feature data (x) to create one feature data set.
testx_raw <- read.csv("UCI HAR Dataset\\test\\x_test.txt", sep="", header = FALSE)
trainx_raw <- read.csv("UCI HAR Dataset\\train\\x_train.txt", sep="", header = FALSE)
testx <- tbl_df(testx_raw)
trainx <- tbl_df(trainx_raw)
data <- bind_rows(testx, trainx)

# Read in the feature names
features <- read.csv("UCI HAR Dataset\\features.txt", sep="", header = FALSE)
features$V2 <- as.character(features$V2)

# Remove special characters in the feature names:
features$V2 <- gsub( "[(), -]", "", features$V2)
features$V2

# Appropriately label the feature data set with descriptive feature names.
colnames(data) <- features$V2

# Extract only the columns which are mean and standard deviation for each measurement. 
# Get a list of indices which indicates which columns we want:
cols <- grep("mean|std", features$V2)
subset_data <- data[,cols]

# Now it's time to add the data labels (y):
# Read in the labels (y), combining test & train rows as before.
testy_raw <- read.csv("UCI HAR Dataset\\test\\y_test.txt", sep="", header = FALSE)
trainy_raw <- read.csv("UCI HAR Dataset\\train\\y_train.txt", sep="", header = FALSE)
testy <- tbl_df(testy_raw)
trainy <- tbl_df(trainy_raw)
datay <- bind_rows(testy, trainy)

# Use descriptive activity names to name the activities in the label data set:
activities <- read.csv("UCI HAR Dataset\\activity_labels.txt", sep="", header = FALSE)
activities$V2 <- gsub("_", "", activities$V2)
datay <- mutate(datay, Activity = activities$V2[datay$V1])

# Now read the subject (joining test & training data)
subjecttest_raw <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", sep="", header = FALSE)
subjecttrain_raw <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", sep="", header = FALSE)
subjecttest <- tbl_df(subjecttest_raw)
subjecttrain <- tbl_df(subjecttrain_raw)
subject <- bind_rows(subjecttest, subjecttrain)
colnames(subject) <- "Subject"

# Add the subject column onto the main dataset.
subset_data <- bind_cols(select(subject, Subject), subset_data)

# Add the Activity column from the label data (y) to the feature data set (x)
# Now subset_data contains the mean & std dev features, with the activities.
subset_data <- bind_cols(select(datay, Activity), subset_data)

#From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
groupColumns = c("Activity","Subject")
dataColumns <- grep("mean|std", colnames(subset_data), value = TRUE)
res = ddply(subset_data, groupColumns, function(x) colMeans(x[dataColumns]))

# Write the results to a file.
write.csv(res, file="Mean_By_Activity_and_Subject.csv")

# Write out the names of the columns:
c <- colnames(subset_data)
write.csv(c, "Mean_Features.csv", row.names=FALSE)