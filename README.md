# Getting-and-Cleaning-Data-Course-Project

## Problem Statement

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Solution 

1. Reads all labels
2. extracts only the mean and standard deviation column for the labels
3. reads all the training data
4. reads all the test data
5. apply labels to the training and test data
6. filter only the mean and standard deviation data using the columns extracted in step 2
7. combine all the training and test data into one dataset
8. Convert the activities to factor from string values
9. compute the mean of the complete dataset by subject and activity
10. write the clean data set into a file
