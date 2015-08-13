# Code Book

## Data
This assignment uses data collected from the accelerometers from the Samsung Galaxy S smartphone:

* <b>Dataset</b>: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* <b>Description</b>: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
* tAcc-XYZ: the accelerometer 3-axial raw signals
* tGyro-XYZ: the gyroscope 3-axial raw signals
* tBodyAcc-XYZ and tGravityAcc-XYZ: The acceleration signal was then separated into body and gravity acceleration signals
* tBodyAccJerk-XYZ: the body linear acceleration derived in time to obtain Jerk signals
* tBodyGyroJerk-XYZ: the angular velocity derived in time to obtain Jerk signals
* tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag: the magnitude of these three-dimensional signals calculated using the Euclidean norm

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.

* fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag: a Fast Fourier Transform (FFT) applied to some of signals

Note the 'f' to indicate frequency domain signals.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

## Transformations
The script for performing the following analysis:

1. Download a file from the web and load flat files
2. Merge the training and the test sets
3. Label the data set with descriptive variable names
4. Extract only the measurements on the mean and standard deviation for each measurement
5. Use descriptive activity names to name the activities in the data set
6. Create a second, independent tidy data set with the average of each variable for each activity and each subject
7. Create a txt file
