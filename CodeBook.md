=================================================================================================
**Code book - Getting and Cleaning Data Course Project
**AUTHOR: SUSANA CORONA
**DATE: 23/08/2020 
=================================================================================================
the original datasets for this assignment were downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
=================================================================================================
**The script creates a tidy dataset with the following columns:
**Columns:
subject - Id of the subject. 
activity - Activity that was measured: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
** variables
Only the data with mean and standard desviation values were extracted from original data set.
The value of the next variables has the average value of each variable for each activity and each subject.
The name of this columns was form with the strings V + Number with the position in the original data set + Feature name.


V1tBodyAcc_mean_X
V2tBodyAcc_mean_Y
V3tBodyAcc_mean_Z
V4tBodyAcc_std_X
V5tBodyAcc_std_Y
V6tBodyAcc_std_Z
V41tGravityAcc_mean_X
V42tGravityAcc_mean_Y
V43tGravityAcc_mean_Z
V44tGravityAcc_std_X
V45tGravityAcc_std_Y
V46tGravityAcc_std_Z
V81tBodyAccJerk_mean_X
V82tBodyAccJerk_mean_Y
V83tBodyAccJerk_mean_Z
V84tBodyAccJerk_std_X
V85tBodyAccJerk_std_Y
V86tBodyAccJerk_std_Z
V121tBodyGyro_mean_X
V122tBodyGyro_mean_Y
V123tBodyGyro_mean_Z
V124tBodyGyro_std_X
V125tBodyGyro_std_Y
V126tBodyGyro_std_Z
V161tBodyGyroJerk_mean_X
V162tBodyGyroJerk_mean_Y
V163tBodyGyroJerk_mean_Z
V164tBodyGyroJerk_std_X
V165tBodyGyroJerk_std_Y
V166tBodyGyroJerk_std_Z
V201tBodyAccMag_mean
V202tBodyAccMag_std
V214tGravityAccMag_mean
V215tGravityAccMag_std
V227tBodyAccJerkMag_mean
V228tBodyAccJerkMag_std
V240tBodyGyroMag_mean
V241tBodyGyroMag_std
V253tBodyGyroJerkMag_mean
V254tBodyGyroJerkMag_std
V266fBodyAcc_mean_X
V267fBodyAcc_mean_Y
V268fBodyAcc_mean_Z
V269fBodyAcc_std_X
V270fBodyAcc_std_Y
V271fBodyAcc_std_Z
V345fBodyAccJerk_mean_X
V346fBodyAccJerk_mean_Y
V347fBodyAccJerk_mean_Z
V348fBodyAccJerk_std_X
V349fBodyAccJerk_std_Y
V350fBodyAccJerk_std_Z
V424fBodyGyro_mean_X
V425fBodyGyro_mean_Y
V426fBodyGyro_mean_Z
V427fBodyGyro_std_X
V428fBodyGyro_std_Y
V429fBodyGyro_std_Z
V503fBodyAccMag_mean
V504fBodyAccMag_std
V516fBodyBodyAccJerkMag_mean
V517fBodyBodyAccJerkMag_std
V529fBodyBodyGyroMag_mean
V530fBodyBodyGyroMag_std
V542fBodyBodyGyroJerkMag_mean
V543fBodyBodyGyroJerkMag_std



The datasets were used to get one data set with the average of each variable for each activity and subject,
the data were labeled appropriately and descriptive names were assigned to the activity
For example:
   subject activity V121tBodyGyro_mean_X V122tBodyGyro_mean_Y V123tBodyGyro_mean_Z ...
     <int> <chr>               <dbl>            <dbl>            <dbl>            
        1 LAYING            -0.0166          -0.0645           0.149            
        1 SITTING           -0.0454          -0.0919           0.0629


The original set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

and were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Tidy data set:
The average of each variable for each activity and subject were estimated with the mean() function
groupping the data by activity and subject.

