# Summary of Data Modifications

Using the data available at _https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip_, 
this project creates an independent data set that contains the average of each mean and standard deviation variable for each activity and each subject.

The original data used variable names that had periods, commas, dashes and other delimiters in the variable names. These have been removed.
Compare the original features listed in features.txt with the feature names in this project (in file Mean_Features.csv)

This units for the data is the same as the original units.

The script "run_analysis.R" does the following:

* Reads in the data files: 
**X_train.txt, Y_train.txt, X_test.txt, Y_test.txt
**X_test & X_train contain the features data 
**Y_test and Y_train contain the activity labels
**subject_train and subject_test.txt contain the ids for the subjects.
* Merges original Test & Train data, taking only the features (columns) which have "mean" or "std" in the name.  (This is the subset of the features which are averages or standard deviations).
* Adds the Subject id (as the column named "Subject") to this dataset.
* Adds the Activity (as the column names "Activity") to this dataset.
* Performs a mean on each column, aggregated by Activity and Subject.
* Saves this table of means to a file named "Mean_By_Activity_and_Subject.txt"

The resultant table has 180 observations of 81 variables

The result is a table with the columns, Activity, Subject, and all the original features containing "mean" or "std". 
The full list of columns is written out to the file "Mean_Features.csv"

Activity
Subject
tBodyAccmeanX
tBodyAccmeanY
tBodyAccmeanZ
tBodyAccstdX
tBodyAccstdY
tBodyAccstdZ
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyAccMagmean
tBodyAccMagstd
tGravityAccMagmean
tGravityAccMagstd
tBodyAccJerkMagmean
tBodyAccJerkMagstd
tBodyGyroMagmean
tBodyGyroMagstd
tBodyGyroJerkMagmean
tBodyGyroJerkMagstd
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccmeanFreqX
fBodyAccmeanFreqY
fBodyAccmeanFreqZ
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyAccJerkmeanFreqX
fBodyAccJerkmeanFreqY
fBodyAccJerkmeanFreqZ
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyGyromeanFreqX
fBodyGyromeanFreqY
fBodyGyromeanFreqZ
fBodyAccMagmean
fBodyAccMagstd
fBodyAccMagmeanFreq
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagstd
fBodyBodyAccJerkMagmeanFreq
fBodyBodyGyroMagmean
fBodyBodyGyroMagstd
fBodyBodyGyroMagmeanFreq
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagstd
fBodyBodyGyroJerkMagmeanFreq



