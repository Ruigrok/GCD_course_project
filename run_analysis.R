#Getting and Cleanin Data
#Course Project

#Download data from web

if (!file.exists("courseproject")) {
    dir.create("courseproject")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "courseproject/UCI HAR Dataset.zip", method = "curl")
unzip("courseproject/UCI HAR Dataset.zip")

#Load all data:

#Data from multiple readings of 561 variables for each subject in the training set:
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
#The subject IDs associated with each reading in X_train:
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#The activity labels associated with each reading in X_train:
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#Data from multiple readings of 561 variables for each subject in the test set:
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
#The subject IDs associated with each reading in X_test:
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#The activity labels associated with each reading in X_test:
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")


#Merge the subject ID's and the activity labels to the data on observations
#for both the training set and the test set

names(subject_train) <- "subjectid"
names(y_train) <- "activitynumber"
complete_train <- cbind(subject_train, y_train, X_train)

names(subject_test) <- "subjectid"
names(y_test) <- "activitynumber"
complete_test <- cbind(subject_test, y_test, X_test)


#Merge the training set with the test set
merged_DF <- rbind(complete_train, complete_test)
#Arranged the resulting data frame by Subject_ID
complete_data <- arrange(merged_DF, subjectid)


#Step 2
#Keep only the columns that are mean and std measurements
#use formatting tricks. Also able to use some sort of contains_? function?
#Load variable names from features.txt
features <- read.table("./UCI HAR Dataset/features.txt")
#Name the columns in features.txt
names(features) <- c("variablenumber", "variablename")
#Use grep() to identify the variable names containing "mean()" and "std()"
mean_and_std_variables <- grep("mean\\(\\)|std\\(\\)", features$variablename)
#Subset the features dataframe to show only the identified mean and std variables
features_for_mean_std <- features[mean_and_std_variables, ]
#Subset the complete_data data frame for variables containing mean and std values
#Identify the column numbers +2 because complete_data contains subjectid and activitylabel
mean_and_std_data <- complete_data[, c(1, 2, features_for_mean_std$variablenumber+2)]


#Step 3
#Use descriptive activity names to name the activities in the data set
#Load activity labels from activity_lables.txt
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
#Name the columns in activity_lables.txt
names(activity_labels) <- c("activitynumber", "activity")
#Add activitylabels to activitynumbers by merge mean_and_std_data to acitivty_labels data frame
#all.x ensures that every row in mean_std_data is preserved, and is matched with an activitylabel
merged_by_activity <- merge(mean_and_std_data, activity_labels, by = "activitynumber", all.x = TRUE)
#Arrange the dataframe by subjectid, move the subjectid column back to the first column,
#move the activity column to the second column, and remove the activitynumber variable
arrange_df <- arrange(merged_by_activity, subjectid)
mean_and_std_data <- select(arrange_df, subjectid, activity, V1:V543)


#Step 4
#Label the data set with descriptive variable names
#Load variable names from "features.txt"
variable_names <- read.table("./UCI HAR Dataset/features.txt")
#Isolate only the meand and std variables
get_variable_names <- variable_names[mean_and_std_variables, ]
#Remove the numbers from the variable names and make everything lowercase
tidy_variable_names <- tolower(gsub("[^[:alpha:]]", "", get_variable_names$V2))
#Make a vector with all the column names
all_column_names <- c("subjectid", "activity", tidy_variable_names)
#Assign variable names to the columns in the mean_and_std_data data frame
colnames(mean_and_std_data) <- all_column_names


#Step 5 
#From the data set in step 4, create a second, independent tidy data set with 
#the average of each variable for each subject id and activity
#Take teh mean of all variables of measurements, and aggregate them by subject id and activity
averages_activity_subject <- aggregate(mean_and_std_data[, 3:ncol(mean_and_std_data)],
                                       by = list(subjectid = mean_and_std_data$subjectid,
                                                 activity = mean_and_std_data$activity), mean)

#For submission
#Please upload your data set as a txt file created with write.table() 
#using row.name=FALSE 
write.table(averages_activity_subject, "GCDcourseproject.txt", row.names = FALSE)
