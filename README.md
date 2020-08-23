# cleanData
Repository for  Getting and Cleaning Data Course Project
=================================================================================================
**AUTHOR: SUSANA CORONA
**DATE: 23/08/2020 
=================================================================================================
**The script run_analysis.R do the following steps:

1.	At the beginning the script get the data sets for this assignment 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
    And reads the data to create the dataframes. This operation can take several minutes.
    Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. According to features.txt and features_info.txt
3.	Uses descriptive activity names to name the activities in the data set according to activity_labels.txt using the mutate function
	- 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING
4.	Appropriately labels the data set with descriptive variable names, according to features.txt and 
    using the substring .train or .test to specified if the column come from train or test dataset. 
5.	From the data set in step 4, creates a second, independent tidy data set 
    with the average of each variable for each activity and each subject, following the next steps:
	
	a) Using the gather function into a column named variable_m that will have the name of the variables and 
	a column named valor that will have the value of the variable.
	Using the mutate function to rename the variable names without the train and test substring used before to name the columns.
	So we got a dataframe with the columns: 
	- subject
	- activity
	- variable_m
	- valor
	For example:
	    subject           activity        variable_m                valor
				1         LAYING         WALKING V1tBodyAcc_mean_X  0.28202157
				2         LAYING         WALKING V1tBodyAcc_mean_X  0.25584075
	
	b) Finally using the functions group by, summarize, arrange and spread to get tidy data 
	   with the average of each variable for each activity and subject and print the results. 
		For example:
		subject activity V121tBodyGyro_mean_X V122tBodyGyro_mean_Y V123tBodyGyro_mean_Z ...
		<int>   <chr>               <dbl>            <dbl>            <dbl>            
			1 LAYING            -0.0166          -0.0645           0.149            
			1 SITTING           -0.0454          -0.0919           0.0629

=================================================================================================
Note: The script run_analysis.R uses the libraries tidyr and dplyr, so they need to be installed previously.
=================================================================================================
