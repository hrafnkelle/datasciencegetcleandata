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

The data used is from the ["Human Activity Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The official citation for it is
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



* "subject"
  Number identifing the subject the observation came from. All observations with the same subject number come from the same subject 
* "activity" 
  Describes the activity of the subject was performing. Possible values are
  ** WALKING
  ** WALKING_UPSTAIRS
  ** WALKING_DOWNSTAIRS
  ** SITTING
  ** STANDING
  ** LAYING
* "tBodyAcc_mean_X"
   mean of the timeseries signal from the accelerometer due to body movement in the X direction 
* "tBodyAcc_mean_Y" 
   mean of the timeseries signal from the accelerometer due to body movement in the Y direction 
* "tBodyAcc_mean_Z" 
   mean of the timeseries signal from the accelerometer due to body movement in the Z direction 
* "tGravityAcc_mean_X" 
   mean of the timeseries signal from the accelerometer due to gravity in the X direction 
* "tGravityAcc_mean_Y" 
   mean of the timeseries signal from the accelerometer due to gravity in the Y direction 
* "tGravityAcc_mean_Z" 
   mean of the timeseries signal from the accelerometer due to gravity in the Z direction 
* "tBodyAccJerk_mean_X"
   mean of the timeseries signal from the accelerometer due to body jerk in the X direction  
* "tBodyAccJerk_mean_Y" 
   mean of the timeseries signal from the accelerometer due to body jerk in the Y direction  
* "tBodyAccJerk_mean_Z" 
   mean of the timeseries signal from the accelerometer due to body jerk in the Z direction  
* "tBodyGyro_mean_X"
   mean of the timeseries signal from the gyro due to body movement in the X direction 
* "tBodyGyro_mean_Y" 
   mean of the timeseries signal from the gyro due to body movement in the Y direction
* "tBodyGyro_mean_Z"
   mean of the timeseries signal from the gyro due to body movement in the Z direction 
* "tBodyGyroJerk_mean_X" 
   mean of the timeseries signal from the gyro due to body jerk in the X direction
* "tBodyGyroJerk_mean_Y" 
   mean of the timeseries signal from the gyro due to body jerk in the Y direction
* "tBodyGyroJerk_mean_Z" 	
   mean of the timeseries signal from the gyro due to body jerk in the Z direction
* "tBodyAccMag_mean" 
   mean of magnitude the timeseries signal from the accelerometer due to body movement
* "tGravityAccMag_mean" 
   mean of magnitude the timeseries signal from the accelerometer due to gravity
* "tBodyAccJerkMag_mean"
   mean of magnitude the timeseries signal from the accelerometer due to body jerk  
* "tBodyGyroMag_mean" 
   mean of magnitude the timeseries signal from the gyro due to body movement
* "tBodyGyroJerkMag_mean" 
   mean of magnitude the timeseries signal from the gyro due to body jerk  
* "fBodyAcc_mean_X"
   A fast fourier transform of the mean of the timeseries signal from the accelerometer due to body movement in the X direction
* "fBodyAcc_mean_Y" 
   A fast fourier transform of the mean of the timeseries signal from the accelerometer due to body movement in the Y direction
* "fBodyAcc_mean_Z" 
   A fast fourier transform of the mean of the timeseries signal from the accelerometer due to body movement in the Z direction
* "fBodyAcc_meanFreq_X" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the accelerometer due to body movement in the X direction
* "fBodyAcc_meanFreq_Y" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the accelerometer due to body movement in the Y direction
* "fBodyAcc_meanFreq_Z" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the accelerometer due to body movement in the Z direction
* "fBodyAccJerk_mean_X" 
   A fast fourier transform of the mean of the timeseries signal from the accelerometer due to body jerk in the X direction  
* "fBodyAccJerk_mean_Y" 
   A fast fourier transform of the mean of the timeseries signal from the accelerometer due to body jerk in the Y direction  
* "fBodyAccJerk_mean_Z" 
   A fast fourier transform of the mean of the timeseries signal from the accelerometer due to body jerk in the Z direction  
* "fBodyAccJerk_meanFreq_X" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the accelerometer due to body jerk in the X direction  
* "fBodyAccJerk_meanFreq_Y" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the accelerometer due to body jerk in the X direction  
* "fBodyAccJerk_meanFreq_Z" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the accelerometer due to body jerk in the X direction  
* "fBodyGyro_mean_X" 
   A fast fourier transform of the mean of the timeseries signal from the gyro due to body movement in the X direction 
* "fBodyGyro_mean_Y" 
   A fast fourier transform of the mean of the timeseries signal from the gyro due to body movement in the Y direction 
* "fBodyGyro_mean_Z" 
   A fast fourier transform of the mean of the timeseries signal from the gyro due to body movement in the Z direction 
* "fBodyGyro_meanFreq_X" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the gyro due to body movement in the X direction
* "fBodyGyro_meanFreq_Y" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the gyro due to body movement in the Y direction
* "fBodyGyro_meanFreq_Z" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the timeseries signal from the gyro due to body movement in the Z direction
* "fBodyAccMag_mean" 
   A fast fourier transform of the mean of magnitude the timeseries signal from the accelerometer due to body movement
* "fBodyAccMag_meanFreq" 
   Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of magnitude the timeseries signal from the accelerometer due to body movement
* "fBodyBodyAccJerkMag_mean" 
  A fast fourier transform of the mean of the magnitude of the timeseries signal from the accelerometer due to body jerk
* "fBodyBodyAccJerkMag_meanFreq" 
  Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the magnitude of the timeseries signal from the accelerometer due to body jerk
* "fBodyBodyGyroMag_mean" 
   A fast fourier transform of the mean of the magnitude of the timeseries signal from the gyro due to body movement
* "fBodyBodyGyroMag_meanFreq" 
  Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the magnitude of the timeseries signal from the gyro due to body movement
* "fBodyBodyGyroJerkMag_mean" 
   A fast fourier transform of the mean of the magnitude of the timeseries signal from the gyro due to body jerk
* "fBodyBodyGyroJerkMag_meanFreq" 
  Weighted average of the frequency components to obtain a mean frequency of a fast fourier transform of the mean of the magnitude of the timeseries signal from the gyro due to body jerk
* "tBodyAcc_std_X" 
   standard deviation of the timeseries signal from the accelerometer due to body movement in the X direction 
* "tBodyAcc_std_Y" 
   standard deviation of the timeseries signal from the accelerometer due to body movement in the Y direction 
* "tBodyAcc_std_Z" 
   standard deviation of the timeseries signal from the accelerometer due to body movement in the Z direction 
* "tGravityAcc_std_X" 
   standard deviation of the timeseries signal from the accelerometer due to gravity in the X direction 
* "tGravityAcc_std_Y" 
   standard deviation of the timeseries signal from the accelerometer due to gravity in the Y direction 
* "tGravityAcc_std_Z" 
   standard deviation of the timeseries signal from the accelerometer due to gravity in the Z direction 
* "tBodyAccJerk_std_X" 
   standard deviation of the timeseries signal from the accelerometer due to body jerk in the X direction
* "tBodyAccJerk_std_Y" 
   standard deviation of the timeseries signal from the accelerometer due to body jerk in the Y direction
* "tBodyAccJerk_std_Z" 
   standard deviation of the timeseries signal from the accelerometer due to body jerk in the Z direction
* "tBodyGyro_std_X" 
   standard deviation of the timeseries signal from the gyro due to body movement in the X direction 
* "tBodyGyro_std_Y" 
   standard deviation of the timeseries signal from the gyro due to body movement in the Y direction 
* "tBodyGyro_std_Z" 
   standard deviation of the timeseries signal from the gyro due to body movement in the Z direction 
* "tBodyGyroJerk_std_X" 
   standard deviation of the timeseries signal from the gyro due to body jerk in the X direction
* "tBodyGyroJerk_std_Y" 
   standard deviation of the timeseries signal from the gyro due to body jerk in the Y direction
* "tBodyGyroJerk_std_Z" 
   standard deviation of the timeseries signal from the gyro due to body jerk in the Z direction
* "tBodyAccMag_std" 
   standard deviation of magnitude the timeseries signal from the accelerometer due to body movement
* "tGravityAccMag_std" 
   standard deviation of magnitude the timeseries signal from the accelerometer due to gravity
* "tBodyAccJerkMag_std"
   standard deviation of magnitude the timeseries signal from the accelerometer due to body jerk  
* "tBodyGyroMag_std" 
   standard deviation of magnitude the timeseries signal from the gyro due to body movement
* "tBodyGyroJerkMag_std" 
   standard deviation of magnitude the timeseries signal from the gyro due to body jerk  
* "fBodyAcc_std_X"
   A fast fourier transform of the standard deviation of the timeseries signal from the accelerometer due to body movement in the X direction
* "fBodyAcc_std_Y" 
   A fast fourier transform of the standard deviation of the timeseries signal from the accelerometer due to body movement in the Y direction
* "fBodyAcc_std_Z" 
   A fast fourier transform of the standard deviation of the timeseries signal from the accelerometer due to body movement in the Z direction
* "fBodyAccJerk_std_X" 
   A fast fourier transform of the standard deviation of the timeseries signal from the accelerometer due to body jerk in the X direction  
* "fBodyAccJerk_std_Y" 
   A fast fourier transform of the standard deviation of the timeseries signal from the accelerometer due to body jerk in the Y direction  
* "fBodyAccJerk_std_Z" 
   A fast fourier transform of the standard deviation of the timeseries signal from the accelerometer due to body jerk in the Z direction  
* "fBodyGyro_std_X" 
   A fast fourier transform of the standard deviation of the timeseries signal from the gyro due to body movement in the X direction 
* "fBodyGyro_std_Y" 
   A fast fourier transform of the standard deviation of the timeseries signal from the gyro due to body movement in the Y direction 
* "fBodyGyro_std_Z" 
   A fast fourier transform of the standard deviation of the timeseries signal from the gyro due to body movement in the Z direction 
* "fBodyAccMag_std" 
   A fast fourier transform of the standard deviation of magnitude the timeseries signal from the accelerometer due to body movement
* "fBodyBodyAccJerkMag_std" 
  A fast fourier transform of the standard deviation of the magnitude of the timeseries signal from the accelerometer due to body jerk" 
* "fBodyBodyGyroMag_std" 
   A fast fourier transform of the standard deviation of magnitude the timeseries signal from the gyro due to body movement
* "fBodyBodyGyroJerkMag_std"
  A fast fourier transform of the standard deviation of the magnitude of the timeseries signal from the gyro due to body jerk" 
