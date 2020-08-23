=================================================================================================
**Code book - Getting and Cleaning Data Course Project
**AUTHOR: SUSANA CORONA
**DATE: 23/08/2020 

the original datasets for this assignment were downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

**The script creates a tidy dataset with the following columns:
**Columns:
subject - Id of the subject. 
activity - Activity that was measured: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
** variables
Only the data with mean and standard desviation values were extracted from original data set.
The value of the next variables has the average value of each variable for each activity and each subject.
The name of this columns was form with the strings V + Number with the position in the original data set + Feature name.


- 1 V1tBodyAcc_mean_X
- 2 V2tBodyAcc_mean_Y
- 3 V3tBodyAcc_mean_Z
- 4 V4tBodyAcc_std_X
- 5 V5tBodyAcc_std_Y
- 6 V6tBodyAcc_std_Z
- 7 V41tGravityAcc_mean_X
- 8 V42tGravityAcc_mean_Y
- 9 V43tGravityAcc_mean_Z
- 10 V44tGravityAcc_std_X
- 11 V45tGravityAcc_std_Y
- 12 V46tGravityAcc_std_Z
- 13 V81tBodyAccJerk_mean_X
- 14 V82tBodyAccJerk_mean_Y
- 15 V83tBodyAccJerk_mean_Z
- 16 V84tBodyAccJerk_std_X
- 17 V85tBodyAccJerk_std_Y
- 18 V86tBodyAccJerk_std_Z
- 19 V121tBodyGyro_mean_X
- 20 V122tBodyGyro_mean_Y
- 21 V123tBodyGyro_mean_Z
- 22 V124tBodyGyro_std_X
- 23 V125tBodyGyro_std_Y
- 24 V126tBodyGyro_std_Z
- 25 V161tBodyGyroJerk_mean_X
- 26 V162tBodyGyroJerk_mean_Y
- 27 V163tBodyGyroJerk_mean_Z
- 28 V164tBodyGyroJerk_std_X
- 29 V165tBodyGyroJerk_std_Y
- 30 V166tBodyGyroJerk_std_Z
- 31 V201tBodyAccMag_mean
- 32 V202tBodyAccMag_std
- 33 V214tGravityAccMag_mean
- 34 V215tGravityAccMag_std
- 35 V227tBodyAccJerkMag_mean
- 36 V228tBodyAccJerkMag_std
- 37 V240tBodyGyroMag_mean
- 38 V241tBodyGyroMag_std
- 39 V253tBodyGyroJerkMag_mean
- 40 V254tBodyGyroJerkMag_std
- 41 V266fBodyAcc_mean_X
- 42 V267fBodyAcc_mean_Y
- 43 V268fBodyAcc_mean_Z
- 44 V269fBodyAcc_std_X
- 45 V270fBodyAcc_std_Y
- 46 V271fBodyAcc_std_Z
- 47 V345fBodyAccJerk_mean_X
- 48 V346fBodyAccJerk_mean_Y
- 49 V347fBodyAccJerk_mean_Z
- 50 V348fBodyAccJerk_std_X
- 51 V349fBodyAccJerk_std_Y
- 52 V350fBodyAccJerk_std_Z
- 53 V424fBodyGyro_mean_X
- 54 V425fBodyGyro_mean_Y
- 55 V426fBodyGyro_mean_Z
- 56 V427fBodyGyro_std_X
- 57 V428fBodyGyro_std_Y
- 58 V429fBodyGyro_std_Z
- 59 V503fBodyAccMag_mean
- 60 V504fBodyAccMag_std
- 61 V516fBodyBodyAccJerkMag_mean
- 62 V517fBodyBodyAccJerkMag_std
- 63 V529fBodyBodyGyroMag_mean
- 64 V530fBodyBodyGyroMag_std
- 65 V542fBodyBodyGyroJerkMag_mean
- 66 V543fBodyBodyGyroJerkMag_std



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

