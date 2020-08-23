library(tidyr)
library(dplyr)

#AUTHOR: SUSANA CORONA


#1.	Merges the training and the test sets to create one data set.
#2.	Extracts only the measurements on the mean and standard deviation for each measurement.
#3.	Uses descriptive activity names to name the activities in the data set
#4.	Appropriately labels the data set with descriptive variable names.
#5.	From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

print("Getting data")

#You can download data sets from this website, or comment this lines if you already have it
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
unzip("getdata_projectfiles_UCI HAR Dataset.zip", exdir = "project_files")

# Content of the directory:
#- 'features.txt': List of all features.
#- 'activity_labels.txt': Links the class labels with their activity name.
#- 'train/X_train.txt': Training set.
#- 'train/y_train.txt': Training labels.
#- 'test/X_test.txt': Test set.
#- 'test/y_test.txt': Test labels.

print("Creates data frames. It can take several minutes.")

dat_train <- data.frame()
dat_test <- data.frame()

  dat_train_x <- read.fwf("project_files/UCI HAR Dataset/train/X_train.txt", header = FALSE,  widths = rep(16, each =561))
  dat_train_y <- read.csv("project_files/UCI HAR Dataset/train/y_train.txt", sep = " " , header = FALSE)
  dat_train_s <- read.csv("project_files/UCI HAR Dataset/train/subject_train.txt", sep = " " , header = FALSE)

  names(dat_train_s) <- c("subject")
  names(dat_train_y) <- c("activity")
  dat_train <- cbind(dat_train_s, dat_train_y,  dat_train_x)
  

  dat_test_x <- read.fwf("project_files/UCI HAR Dataset/test/X_test.txt", header = FALSE,  widths = rep(16, each =561))
  dat_test_y <- read.csv("project_files/UCI HAR Dataset/test/y_test.txt", sep = " " , header = FALSE)
  dat_test_s <- read.csv("project_files/UCI HAR Dataset/test/subject_test.txt", sep = " " , header = FALSE)

  names(dat_test_s) <- c("subject")
  names(dat_test_y) <- c("activity")
  dat_test <- cbind(dat_test_s, dat_test_y,  dat_test_x)
  
  dato_train_test = data.frame()
  
  print("Step 1. Merge")
  #1.	Merges the training and the test sets to create one data set.
  dato_train_test <- (merge(dat_train, dat_test, by = c("subject",  "activity"), all=TRUE))
  
  print("Step 2. Extracts")
#2.	Extracts only the measurements on the mean and standard deviation for each measurement.
dato_train_test_m <- select(dato_train_test, subject, activity,
                            V1.x, V2.x, V3.x, V4.x, V5.x, V6.x, V41.x, V42.x, V43.x, V44.x, V45.x, V46.x, V81.x, V82.x, V83.x, V84.x, V85.x, V86.x, V121.x, V122.x, V123.x, V124.x, V125.x, V126.x, V161.x, V162.x, V163.x, V164.x, V165.x, V166.x, V201.x, V202.x, V214.x, V215.x, V227.x, V228.x, V240.x, V241.x, V253.x, V254.x, V266.x, V267.x, V268.x, V269.x, V270.x, V271.x, V345.x, V346.x, V347.x, V348.x, V349.x, V350.x, V424.x, V425.x, V426.x, V427.x, V428.x, V429.x, V503.x, V504.x, V516.x, V517.x, V529.x, V530.x, V542.x, V543.x,
                            V1.y, V2.y, V3.y, V4.y, V5.y, V6.y, V41.y, V42.y, V43.y, V44.y, V45.y, V46.y, V81.y, V82.y, V83.y, V84.y, V85.y, V86.y, V121.y, V122.y, V123.y, V124.y, V125.y, V126.y, V161.y, V162.y, V163.y, V164.y, V165.y, V166.y, V201.y, V202.y, V214.y, V215.y, V227.y, V228.y, V240.y, V241.y, V253.y, V254.y, V266.y, V267.y, V268.y, V269.y, V270.y, V271.y, V345.y, V346.y, V347.y, V348.y, V349.y, V350.y, V424.y, V425.y, V426.y, V427.y, V428.y, V429.y, V503.y, V504.y, V516.y, V517.y, V529.y, V530.y, V542.y, V543.y
                            )

print("Step 3. Descriptive activity")
#3.	Uses descriptive activity names to name the activities in the data set
#1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING
dat_act <- dato_train_test_m %>%
  mutate(  activity = case_when (activity == 1 ~ "WALKING",
                                 activity == 2 ~ "WALKING_UPSTAIRS",
                                 activity == 3 ~ "WALKING_DOWNSTAIRS",
                                 activity == 4 ~ "SITTING",
                                 activity == 5 ~ "STANDING",
                                 activity == 6 ~ "LAYING"
                                 ))

print("Step 4. Label data")
#4.	Appropriately labels the data set with descriptive variable names.
dat_act_var <- rename(dat_act, 
                      V1tBodyAcc_mean_X.train = V1.x, 
                      V2tBodyAcc_mean_Y.train = V2.x, 
                      V3tBodyAcc_mean_Z.train = V3.x, 
                      V4tBodyAcc_std_X.train = V4.x, 
                      V5tBodyAcc_std_Y.train = V5.x, 
                      V6tBodyAcc_std_Z.train = V6.x, 
                      V41tGravityAcc_mean_X.train = V41.x, 
                      V42tGravityAcc_mean_Y.train = V42.x, 
                      V43tGravityAcc_mean_Z.train = V43.x, 
                      V44tGravityAcc_std_X.train = V44.x, 
                      V45tGravityAcc_std_Y.train = V45.x, 
                      V46tGravityAcc_std_Z.train = V46.x, 
                      V81tBodyAccJerk_mean_X.train = V81.x, 
                      V82tBodyAccJerk_mean_Y.train = V82.x, 
                      V83tBodyAccJerk_mean_Z.train = V83.x, 
                      V84tBodyAccJerk_std_X.train = V84.x, 
                      V85tBodyAccJerk_std_Y.train = V85.x, 
                      V86tBodyAccJerk_std_Z.train = V86.x, 
                      V121tBodyGyro_mean_X.train = V121.x, 
                      V122tBodyGyro_mean_Y.train = V122.x, 
                      V123tBodyGyro_mean_Z.train = V123.x, 
                      V124tBodyGyro_std_X.train = V124.x, 
                      V125tBodyGyro_std_Y.train = V125.x, 
                      V126tBodyGyro_std_Z.train = V126.x, 
                      V161tBodyGyroJerk_mean_X.train = V161.x, 
                      V162tBodyGyroJerk_mean_Y.train = V162.x, 
                      V163tBodyGyroJerk_mean_Z.train = V163.x, 
                      V164tBodyGyroJerk_std_X.train = V164.x, 
                      V165tBodyGyroJerk_std_Y.train = V165.x, 
                      V166tBodyGyroJerk_std_Z.train = V166.x, 
                      V201tBodyAccMag_mean.train = V201.x, 
                      V202tBodyAccMag_std.train = V202.x, 
                      V214tGravityAccMag_mean.train = V214.x, 
                      V215tGravityAccMag_std.train = V215.x, 
                      V227tBodyAccJerkMag_mean.train = V227.x, 
                      V228tBodyAccJerkMag_std.train = V228.x, 
                      V240tBodyGyroMag_mean.train = V240.x, 
                      V241tBodyGyroMag_std.train = V241.x, 
                      V253tBodyGyroJerkMag_mean.train = V253.x, 
                      V254tBodyGyroJerkMag_std.train = V254.x, 
                      V266fBodyAcc_mean_X.train = V266.x, 
                      V267fBodyAcc_mean_Y.train = V267.x, 
                      V268fBodyAcc_mean_Z.train = V268.x, 
                      V269fBodyAcc_std_X.train = V269.x, 
                      V270fBodyAcc_std_Y.train = V270.x, 
                      V271fBodyAcc_std_Z.train = V271.x, 
                      V345fBodyAccJerk_mean_X.train = V345.x, 
                      V346fBodyAccJerk_mean_Y.train = V346.x, 
                      V347fBodyAccJerk_mean_Z.train = V347.x, 
                      V348fBodyAccJerk_std_X.train = V348.x, 
                      V349fBodyAccJerk_std_Y.train = V349.x, 
                      V350fBodyAccJerk_std_Z.train = V350.x, 
                      V424fBodyGyro_mean_X.train = V424.x, 
                      V425fBodyGyro_mean_Y.train = V425.x, 
                      V426fBodyGyro_mean_Z.train = V426.x, 
                      V427fBodyGyro_std_X.train = V427.x, 
                      V428fBodyGyro_std_Y.train = V428.x, 
                      V429fBodyGyro_std_Z.train = V429.x, 
                      V503fBodyAccMag_mean.train = V503.x, 
                      V504fBodyAccMag_std.train = V504.x, 
                      V516fBodyBodyAccJerkMag_mean.train = V516.x, 
                      V517fBodyBodyAccJerkMag_std.train = V517.x, 
                      V529fBodyBodyGyroMag_mean.train = V529.x, 
                      V530fBodyBodyGyroMag_std.train = V530.x, 
                      V542fBodyBodyGyroJerkMag_mean.train = V542.x, 
                      V543fBodyBodyGyroJerkMag_std.train = V543.x,
                      V1tBodyAcc_mean_X.test = V1.y, 
                      V2tBodyAcc_mean_Y.test = V2.y, 
                      V3tBodyAcc_mean_Z.test = V3.y, 
                      V4tBodyAcc_std_X.test = V4.y, 
                      V5tBodyAcc_std_Y.test = V5.y, 
                      V6tBodyAcc_std_Z.test = V6.y, 
                      V41tGravityAcc_mean_X.test = V41.y, 
                      V42tGravityAcc_mean_Y.test = V42.y, 
                      V43tGravityAcc_mean_Z.test = V43.y, 
                      V44tGravityAcc_std_X.test = V44.y, 
                      V45tGravityAcc_std_Y.test = V45.y, 
                      V46tGravityAcc_std_Z.test = V46.y, 
                      V81tBodyAccJerk_mean_X.test = V81.y, 
                      V82tBodyAccJerk_mean_Y.test = V82.y, 
                      V83tBodyAccJerk_mean_Z.test = V83.y, 
                      V84tBodyAccJerk_std_X.test = V84.y, 
                      V85tBodyAccJerk_std_Y.test = V85.y, 
                      V86tBodyAccJerk_std_Z.test = V86.y, 
                      V121tBodyGyro_mean_X.test = V121.y, 
                      V122tBodyGyro_mean_Y.test = V122.y, 
                      V123tBodyGyro_mean_Z.test = V123.y, 
                      V124tBodyGyro_std_X.test = V124.y, 
                      V125tBodyGyro_std_Y.test = V125.y, 
                      V126tBodyGyro_std_Z.test = V126.y, 
                      V161tBodyGyroJerk_mean_X.test = V161.y, 
                      V162tBodyGyroJerk_mean_Y.test = V162.y, 
                      V163tBodyGyroJerk_mean_Z.test = V163.y, 
                      V164tBodyGyroJerk_std_X.test = V164.y, 
                      V165tBodyGyroJerk_std_Y.test = V165.y, 
                      V166tBodyGyroJerk_std_Z.test = V166.y, 
                      V201tBodyAccMag_mean.test = V201.y, 
                      V202tBodyAccMag_std.test = V202.y, 
                      V214tGravityAccMag_mean.test = V214.y, 
                      V215tGravityAccMag_std.test = V215.y, 
                      V227tBodyAccJerkMag_mean.test = V227.y, 
                      V228tBodyAccJerkMag_std.test = V228.y, 
                      V240tBodyGyroMag_mean.test = V240.y, 
                      V241tBodyGyroMag_std.test = V241.y, 
                      V253tBodyGyroJerkMag_mean.test = V253.y, 
                      V254tBodyGyroJerkMag_std.test = V254.y, 
                      V266fBodyAcc_mean_X.test = V266.y, 
                      V267fBodyAcc_mean_Y.test = V267.y, 
                      V268fBodyAcc_mean_Z.test = V268.y, 
                      V269fBodyAcc_std_X.test = V269.y, 
                      V270fBodyAcc_std_Y.test = V270.y, 
                      V271fBodyAcc_std_Z.test = V271.y, 
                      V345fBodyAccJerk_mean_X.test = V345.y, 
                      V346fBodyAccJerk_mean_Y.test = V346.y, 
                      V347fBodyAccJerk_mean_Z.test = V347.y, 
                      V348fBodyAccJerk_std_X.test = V348.y, 
                      V349fBodyAccJerk_std_Y.test = V349.y, 
                      V350fBodyAccJerk_std_Z.test = V350.y, 
                      V424fBodyGyro_mean_X.test = V424.y, 
                      V425fBodyGyro_mean_Y.test = V425.y, 
                      V426fBodyGyro_mean_Z.test = V426.y, 
                      V427fBodyGyro_std_X.test = V427.y, 
                      V428fBodyGyro_std_Y.test = V428.y, 
                      V429fBodyGyro_std_Z.test = V429.y, 
                      V503fBodyAccMag_mean.test = V503.y, 
                      V504fBodyAccMag_std.test = V504.y, 
                      V516fBodyBodyAccJerkMag_mean.test = V516.y, 
                      V517fBodyBodyAccJerkMag_std.test = V517.y, 
                      V529fBodyBodyGyroMag_mean.test = V529.y, 
                      V530fBodyBodyGyroMag_std.test = V530.y, 
                      V542fBodyBodyGyroJerkMag_mean.test = V542.y, 
                      V543fBodyBodyGyroJerkMag_std.test = V543.y
)

print("Step 5. Create tidy dataset")
#5.	From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

dat_act_var2 <- gather(dat_act_var, "variable_m", "valor", V1tBodyAcc_mean_X.train:V543fBodyBodyGyroJerkMag_std.test , -activity, -subject , na.rm = TRUE)
dat_act_var3 <- mutate(dat_act_var2, variable_m = sub(".test","",  variable_m ), variable_m = sub(".train","",  variable_m ) )

dato_train_test_average <- dat_act_var3 %>% 
                           group_by(subject, activity, variable_m) %>% 
                          summarize(average = mean(valor)) %>% 
                          arrange(activity, subject) %>%
                          spread(variable_m, average )
dat_tydi <- as_tibble(dato_train_test_average)
print(dat_tydi)
# write.csv(dat_tydi, file="tidy_dataset.csv", col.names = TRUE, row.names = FALSE)
 