# GCD Repo 
Created on 10th December 2014 for Getting and Cleaning Data Assignement in Cousera Course
## The repo contains:
- this file wich explains the origin af the data, the treatment done in the script and the code book here after
- run_analysis.R the script applied to elaborate final data 
- the final tidy set GCD_tidy
 
The initial UCI HAR Dataset is only on local desktop and not followed by Git (useless)
It's a data set issue from :
 
 =================================================================
 
 Human Activity Recognition Using Smartphones Dataset Version 1.0
 Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
 Smartlab - Non Linear Complex Systems Laboratory
 DITEN - Università degli Studi di Genova.
 Via Opera Pia 11A, I-16145, Genoa, Italy.
 activityrecognition@smartlab.ws
 www.smartlab.ws
 ==================================================================

 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 Each person performed six activities (WALKING, WALKING-UPSTAIRS, WALKING-DOWNSTAIRS, SITTING, STANDING,
 LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
 Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular
 velocity at a constant rate of 50Hz.
 The experiments have been video-recorded to label the data manually.
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for
 generating the training data and 30% the test data. 
 The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in
 fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which
 has gravitational and body motion components, was separated using a Butterworth low-pass filter
 into body acceleration and gravity. The gravitational force is assumed to have only low frequency components,
 therefore a filter with 0.3 Hz cutoff frequency was used.
 
### Thanks to Smartlab's Team.
 ========================


## run_analysis.R 

This script does the following step:
- Step 1:
Merging of the two data set "training" and "test"
Naming the columns
Adding two columns "subject" and "activity"
- Step 2:
Extracting all the columns with mean or std and the first two columns "subject", "activity" 
- Step 3:
Replacing column activity values by descriptive label
- Step 4:
The original labels were kept
Only substition of "-" by "_"
- Step 5:
Ordering the data by subject, activity 
and apply mean() to obtain reduced data set with one observation by subjet and activity
-> only 180 = 30 subjects * 6 activities 

## Code Book
All variables are listed below. For each row, was extracted all the mean() and std() values.
The post treatment done elaborate the mean value of rows by subject and activities.
Some variables not explicitly detailled in the original set were kept (it's the for *BodyBody* variables for example).
_XYZ is relative to three values, one for each axis.
variable beginning with "t" is relative to time acquisition (raw data)
variable beginning with "f" is relative to frequence (result of treatement)

subject
activity
tBodyAcc_mean()_XYZ
tGravityAcc_mean()_XYZ
tBodyAccJerk_mean()_XYZ 
tBodyGyro_mean()_XYZ
tBodyGyroJerk_mean()_XYZ
tBodyAccMag_mean() 
tGravityAccMag_mean() 
tBodyAccJerkMag_mean() 
tBodyGyroMag_mean() 
tBodyGyroJerkMag_mean()
fBodyAcc_mean()_XYZ
fBodyAcc_meanFreq()_XYZ
fBodyAccJerk_mean()_XYZ
fBodyAccJerk_meanFreq()_XYZ
fBodyGyro_mean()_XYZ
fBodyGyro_meanFreq()_XYZ
fBodyAccMag_mean()
fBodyAccMag_meanFreq()
fBodyBodyAccJerk	_mean()
fBodyBodyAccJerk	_meanFreq()
fBodyBodyGyroMag_mean()
fBodyBodyGyroMag_meanFreq()
fBodyBodyGyroJerkMag_mean()
fBodyBodyGyroJerkMag_meanFreq()
tBodyAcc_std()_XYZ
tGravityAcc_std()_XYZ
tBodyAccJerk_std()_XYZ
tBodyGyro_std()_XYZ
tBodyGyroJerk_std()_XYZ
tBodyAccMag_std()
tGravityAccMag_std()
tBodyAccJerkMag_std()
tBodyGyroMag_std()
tBodyGyroJerkMag_std()
fBodyAcc_std()_XYZ
fBodyAccJerk_std()_XYZ
fBodyGyro_std()_XYZ
fBodyAccMag_std()
fBodyBodyAccJerkMag_std()
fBodyBodyGyroMag_std()
fBodyBodyGyroMag_std()
