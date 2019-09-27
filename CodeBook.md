The bog data set that was made contains the data from 6 txt files. We have data separated from 6 diferent activities 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
And there are 561 variables, and they are about 17 signals and the set of variables of the estimates from this signals
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

We then start the proceses of merging to create this big data set with 10299 observations and 562 variables
1.- We we open the zip file 
2.- Merge the training and the test sets to create one data set by transforming the txt files to data frames. For this we set te working directory 
to were the txt file that we want to transform is.
In this same process we appropriately label the data set with descriptive variable names
3.- Then we merge the data frames with the rbind() and cbind() functions
4.-We extract only the measurements on the mean and standard deviation for each measurement using dplyr package and we have a data frame with 102 observations and 86 variables
5.- After that, we use descriptive activity names to name the activities in the data set. So we change the numbers from the Y data frame to the activity labels from the data set activity_labels
and we then add this new version of Y with the data frame created before with de meand and standard deviations
6.- Finally, we create an independent tidy data set with the average of each variable for each activity and each subject. when in one side there are the means of each variable for each activity
and on the other side we can get the means for each variable for every subject. 


