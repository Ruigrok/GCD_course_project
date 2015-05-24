# GCD_course_project
Coursera Getting and Cleaning Data Course Project

run_analysis.R is a script that reads data collected from the accelerometers from the Samsung Galaxy S smartphone.

The script:

Reads the data files and merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement.
"mean()" and "std()" were used as the parameters for selecting these variables.
 
Uses descriptive activity names to name the activities in the data set.
The activity labels are found in activity_labels.txt

Appropriately labels the data set with descriptive variable names. 
The variable names are ound in features.txt
 
From the created data frame, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Saves this data frame as GCDcourseproject.txt




