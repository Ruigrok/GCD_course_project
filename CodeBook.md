---
#Data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


#Transformations
From the original data files, the test and train set were combined. Only measurements of mean and std
were used. Description for the activity and of the variable names were added. The mean for each activity
and for each subjectid were calculated for the final data table. The result was a data table with 180
observations of 68 variables.

#Variables

subjectid
    ID of the subject

activity
    Activity of the subject during the measurement
       "WALKING"
       
       "WALKING_UPSTAIRS"
       
       "WALKING_DOWNSTAIRS"
       
       "SITTING"
       
       "STANDING"
       
       "LAYING"

tbodyaccmeanxtbodyaccmeany

tbodyaccmeanz

tbodyaccstdx

tbodyaccstdy

tbodyaccstdz

tgravityaccmeanx

tgravityaccmeany

tgravityaccmeanztgravityaccstdx

tgravityaccstdy

tgravityaccstdz

tbodyaccjerkmeanx

tbodyaccjerkmeany

tbodyaccjerkmeanz

tbodyaccjerkstdx

tbodyaccjerkstdy

tbodyaccjerkstdz

tbodygyromeanx

tbodygyromeany

tbodygyromeanz

tbodygyrostdx

tbodygyrostdy

tbodygyrostdz

tbodygyrojerkmeanx

tbodygyrojerkmeany

tbodygyrojerkmeanz

tbodygyrojerkstdx

tbodygyrojerkstdy

tbodygyrojerkstdz

tbodyaccmagmean

tbodyaccmagstd

tgravityaccmagmean

tgravityaccmagstd

tbodyaccjerkmagmean

tbodyaccjerkmagstd

tbodygyromagmean

tbodygyromagstd

tbodygyrojerkmagmean

tbodygyrojerkmagstd

fbodyaccmeanx

fbodyaccmeany

fbodyaccmeanz

fbodyaccstdx

fbodyaccstdy

fbodyaccstdz

fbodyaccjerkmeanx

fbodyaccjerkmeany


fbodyaccjerkmeanz

fbodyaccjerkstdx

fbodyaccjerkstdy

fbodyaccjerkstdz

fbodygyromeanx

fbodygyromeany

fbodygyromeanz

fbodygyrostdx

fbodygyrostdy

fbodygyrostdz

fbodyaccmagmean

fbodyaccmagstd

fbodybodyaccjerkmagmean

fbodybodyaccjerkmagstd

fbodybodygyromagmean

fbodybodygyromagstd

fbodybodygyrojerkmagmean
fbodybodygyrojerkmagstd



