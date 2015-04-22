#Getting and Cleaning Data Course Assignment
##Code book - bryanjrose 4/22/15

The output of run_analysis.R is a table of 180 observations in 88 variables.
Observations are a summarized average of the mean and standard deviations for each respective variable.

#####Grouped variables:
- "TestSubject" =	 Individual Test subjects who perfomed the activities (numbered 1-30)
- "ActivityName" =  Nature of activity ocurring during measurment (Laying, sitting, standing, walking, walking upstairs, walking downstairs)

#####Individual variable naming conventions:
- t = time domain measurement
- f = frequency domain measurement
- Body = body motion component 
- Gravity = gravitational motion component 
- angle = angular velocity
- Acc = measurement of accelerometer output
- Gyro = measurement of gyroscope output
- Jerk = jerk measurement (first derivative of acceleration)
- X, Y, Z = respective direction component of measurement
- Mag = magnitude of all direction components combined
- mean = mean
- std = standard deviation

######example:
- "fBodyAccJerk.mean.Y"
= The average of the Y body component motion jerk measured with the accelerometer in the frequency domain (Hz).

#####**Full variable list:**
``` "tBodyAcc.mean.X"
"tBodyAcc.mean.Y"
"tBodyAcc.mean.Z"
"tGravityAcc.mean.X"
"tGravityAcc.mean.Y"
"tGravityAcc.mean.Z"
"tBodyAccJerk.mean.X"
"tBodyAccJerk.mean.Y"
"tBodyAccJerk.mean.Z"
"tBodyGyro.mean.X"
"tBodyGyro.mean.Y"
"tBodyGyro.mean.Z"
"tBodyGyroJerk.mean.X"
"tBodyGyroJerk.mean.Y"
"tBodyGyroJerk.mean.Z"
"tBodyAccMag.mean."
"tGravityAccMag.mean."
"tBodyAccJerkMag.mean."
"tBodyGyroMag.mean."
"tBodyGyroJerkMag.mean."
"fBodyAcc.mean.X"
"fBodyAcc.mean.Y"
"fBodyAcc.mean.Z"
"fBodyAcc.meanFreq.X"
"fBodyAcc.meanFreq.Y"
"fBodyAcc.meanFreq.Z"
"fBodyAccJerk.mean.X"
"fBodyAccJerk.mean.Y"
"fBodyAccJerk.mean.Z"
"fBodyAccJerk.meanFreq.X"
"fBodyAccJerk.meanFreq.Y"
"fBodyAccJerk.meanFreq.Z"
"fBodyGyro.mean.X"
"fBodyGyro.mean.Y"
"fBodyGyro.mean.Z"
"fBodyGyro.meanFreq.X"
"fBodyGyro.meanFreq.Y"
"fBodyGyro.meanFreq.Z"
"fBodyAccMag.mean."
"fBodyAccMag.meanFreq."
"fBodyAccJerkMag.mean."
"fBodyAccJerkMag.meanFreq."
"fBodyGyroMag.mean."
"fBodyGyroMag.meanFreq."
"fBodyGyroJerkMag.mean."
"fBodyGyroJerkMag.meanFreq."
"angle.tBodyAccMean.gravity."
"angle.tBodyAccJerkMean.gravityMean."
"angle.tBodyGyroMean.gravityMean."
"angle.tBodyGyroJerkMean.gravityMean."
"angle.X.gravityMean."
"angle.Y.gravityMean."
"angle.Z.gravityMean."
"tBodyAcc.std.X"
"tBodyAcc.std.Y"
"tBodyAcc.std.Z"
"tGravityAcc.std.X"
"tGravityAcc.std.Y"
"tGravityAcc.std.Z"
"tBodyAccJerk.std.X"
"tBodyAccJerk.std.Y"
"tBodyAccJerk.std.Z"
"tBodyGyro.std.X"
"tBodyGyro.std.Y"
"tBodyGyro.std.Z"
"tBodyGyroJerk.std.X"
"tBodyGyroJerk.std.Y"
"tBodyGyroJerk.std.Z"
"tBodyAccMag.std."
"tGravityAccMag.std."
"tBodyAccJerkMag.std."
"tBodyGyroMag.std."
"tBodyGyroJerkMag.std."
"fBodyAcc.std.X"
"fBodyAcc.std.Y"
"fBodyAcc.std.Z"
"fBodyAccJerk.std.X"
"fBodyAccJerk.std.Y"
"fBodyAccJerk.std.Z"
"fBodyGyro.std.X"
"fBodyGyro.std.Y"
"fBodyGyro.std.Z"
"fBodyAccMag.std."
"fBodyAccJerkMag.std."
"fBodyGyroMag.std."
"fBodyGyroJerkMag.std."
