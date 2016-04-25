# Summary of Data Modifications

Using the data available at _https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip_, 
this project creates an independent data set that contains the average of each mean and standard deviation variable for each activity and each subject.

The original data used variable names that had periods, commas, dashes and other delimiters in the variable names. These have been removed.
Compare the original features listed in features.txt with the feature names in this project (in file Mean_Features.csv)

This units for the data is the same as the original units.

The script "run_analysis.R" does the following:

* Merges original Test & Train data, taking only the features (columns) which have "mean" or "std" in the name.  (This is the subset of the features which are averages or standard deviations).
* Adds the Subject id (as the column named "Subject") to this dataset.
* Adds the Activity (as the column names "Activity") to this dataset.
* Performs a mean on each column, aggregated by Activity and Subject.
* Saves this table of means to a file named "Mean_By_Activity_and_Subject.csv"

The result is a table with the columns, Activity, Subject, and all the original features containing "mean" or "std". 
The full list of columns is written out to the file "Mean_Features.csv"


