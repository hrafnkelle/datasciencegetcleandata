# datasciencegetcleandata
Coursera Data Science Getting and Cleaning Data project 
=======================================================

This repository is my solution to the course project for the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) 
course in the [Data Science specialization on Coursera](https://www.coursera.org/specialization/jhudatascience/1?utm_medium=courseDescripTop).

Description of run_analysis.R
-----------------------------
The script starts of by downloading the data archive from the source and unzips it. This make sit possible for others to fully reporoduce the output

The script uses the dplyr R library to make manipulation of the data easier. This library is then loaded.

We then proceed to load in the data, both training and test sets. We also read in the feature names and activity names.
We change the activty to a factor with descriptive labels and make subject also a factor to reflect it is a categorical variable

We create a combined dataset called full by rbinding the train and test sets together.
We then proceed to find the wanted mean and standard deviation feature by "grepping" the strings "mean" and "std" from the feature names.
This gives the column indices of the features we want.

Since we will use the feature names from the features.txt file provided we have to clean up the name to make them usable in R. We remove () and change - to _.

Finally we produce the desired output by chaining dplyr commands:
```
output<-full                                                 # from the full dataset
		%>% select(c(meanIdx,stdIdx))                        # select only the mean/std columns
		%>% mutate(activity=full_act, subject=full_subject)  # add the activty and subject columns
		%>% group_by(subject,activity)                       # group the observations by subject and activty
		%>% summarise_each(funs(mean))                       # so we can summarize each feature by subject and activity 
```

The run_analysis.R script has descriptive comments as well.

Codebook
--------
"subject" 
"activity" 
"tBodyAcc_mean_X" 
"tBodyAcc_mean_Y" 
"tBodyAcc_mean_Z" 
"tGravityAcc_mean_X" 
"tGravityAcc_mean_Y" 
"tGravityAcc_mean_Z" 
"tBodyAccJerk_mean_X" 
"tBodyAccJerk_mean_Y" 
"tBodyAccJerk_mean_Z" 
"tBodyGyro_mean_X" 
"tBodyGyro_mean_Y" 
"tBodyGyro_mean_Z" 
"tBodyGyroJerk_mean_X" 
"tBodyGyroJerk_mean_Y" 
"tBodyGyroJerk_mean_Z" 
"tBodyAccMag_mean" 
"tGravityAccMag_mean" 
"tBodyAccJerkMag_mean" 
"tBodyGyroMag_mean" 
"tBodyGyroJerkMag_mean" 
"fBodyAcc_mean_X" 
"fBodyAcc_mean_Y" 
"fBodyAcc_mean_Z" 
"fBodyAcc_meanFreq_X" 
"fBodyAcc_meanFreq_Y" 
"fBodyAcc_meanFreq_Z" 
"fBodyAccJerk_mean_X" 
"fBodyAccJerk_mean_Y" 
"fBodyAccJerk_mean_Z" 
"fBodyAccJerk_meanFreq_X" 
"fBodyAccJerk_meanFreq_Y" 
"fBodyAccJerk_meanFreq_Z" 
"fBodyGyro_mean_X" 
"fBodyGyro_mean_Y" 
"fBodyGyro_mean_Z" 
"fBodyGyro_meanFreq_X" 
"fBodyGyro_meanFreq_Y" 
"fBodyGyro_meanFreq_Z" 
"fBodyAccMag_mean" 
"fBodyAccMag_meanFreq" 
"fBodyBodyAccJerkMag_mean" 
"fBodyBodyAccJerkMag_meanFreq" 
"fBodyBodyGyroMag_mean" 
"fBodyBodyGyroMag_meanFreq" 
"fBodyBodyGyroJerkMag_mean" 
"fBodyBodyGyroJerkMag_meanFreq" 
"tBodyAcc_std_X" 
"tBodyAcc_std_Y" 
"tBodyAcc_std_Z" 
"tGravityAcc_std_X" 
"tGravityAcc_std_Y" 
"tGravityAcc_std_Z" 
"tBodyAccJerk_std_X" 
"tBodyAccJerk_std_Y" 
"tBodyAccJerk_std_Z" 
"tBodyGyro_std_X" 
"tBodyGyro_std_Y" 
"tBodyGyro_std_Z" 
"tBodyGyroJerk_std_X" 
"tBodyGyroJerk_std_Y" 
"tBodyGyroJerk_std_Z" 
"tBodyAccMag_std" 
"tGravityAccMag_std" 
"tBodyAccJerkMag_std" 
"tBodyGyroMag_std" 
"tBodyGyroJerkMag_std" 
"fBodyAcc_std_X" 
"fBodyAcc_std_Y" 
"fBodyAcc_std_Z" 
"fBodyAccJerk_std_X" 
"fBodyAccJerk_std_Y" 
"fBodyAccJerk_std_Z" 
"fBodyGyro_std_X" 
"fBodyGyro_std_Y" 
"fBodyGyro_std_Z" 
"fBodyAccMag_std" 
"fBodyBodyAccJerkMag_std" 
"fBodyBodyGyroMag_std" 
"fBodyBodyGyroJerkMag_std"