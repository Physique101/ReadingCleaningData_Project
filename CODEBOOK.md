# CODE BOOK for the tidy dataset and the merged dataset created for Reading and Cleaning Data Project 
Script run_analysis outputs two datasets, merged_dataset.csv and tidy_dataset.csv (and tidy.dataset.txt). This code book is for both datasets.

##tidy_dataset.csv (tidy_dataset.txt) [180 values for 89 columns] - The values are the mean feature values for each of the 180 activitylabel/subject combinations

activitylabel - Values are labels for the six activities as listed below
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

subject - An index that ranges from 1-30 to label the subjects	

subjecttype - TRAIN or TEST to label the subject who either particpated to producing the training data or the test data.

86 features. These features are  the ones that represent either a mean or a standard deviation measurement
tBodyAcc-mean()-X	tBodyAcc-mean()-Y	tBodyAcc-mean()-Z	tBodyAcc-std()-X	tBodyAcc-std()-Y	tBodyAcc-std()-Z	tGravityAcc-mean()-X	tGravityAcc-mean()-Y	tGravityAcc-mean()-Z	tGravityAcc-std()-X	tGravityAcc-std()-Y	tGravityAcc-std()-Z	tBodyAccJerk-mean()-X	tBodyAccJerk-mean()-Y	tBodyAccJerk-mean()-Z	tBodyAccJerk-std()-X	tBodyAccJerk-std()-Y	tBodyAccJerk-std()-Z	tBodyGyro-mean()-X	tBodyGyro-mean()-Y	tBodyGyro-mean()-Z	tBodyGyro-std()-X	tBodyGyro-std()-Y	tBodyGyro-std()-Z	tBodyGyroJerk-mean()-X	tBodyGyroJerk-mean()-Y	tBodyGyroJerk-mean()-Z	tBodyGyroJerk-std()-X	tBodyGyroJerk-std()-Y	tBodyGyroJerk-std()-Z	tBodyAccMag-mean()	tBodyAccMag-std()	tGravityAccMag-mean()	tGravityAccMag-std()	tBodyAccJerkMag-mean()	tBodyAccJerkMag-std()	tBodyGyroMag-mean()	tBodyGyroMag-std()	tBodyGyroJerkMag-mean()	tBodyGyroJerkMag-std()	fBodyAcc-mean()-X	fBodyAcc-mean()-Y	fBodyAcc-mean()-Z	fBodyAcc-std()-X	fBodyAcc-std()-Y	fBodyAcc-std()-Z	fBodyAcc-meanFreq()-X	fBodyAcc-meanFreq()-Y	fBodyAcc-meanFreq()-Z	fBodyAccJerk-mean()-X	fBodyAccJerk-mean()-Y	fBodyAccJerk-mean()-Z	fBodyAccJerk-std()-X	fBodyAccJerk-std()-Y	fBodyAccJerk-std()-Z	fBodyAccJerk-meanFreq()-X	fBodyAccJerk-meanFreq()-Y	fBodyAccJerk-meanFreq()-Z	fBodyGyro-mean()-X	fBodyGyro-mean()-Y	fBodyGyro-mean()-Z	fBodyGyro-std()-X	fBodyGyro-std()-Y	fBodyGyro-std()-Z	fBodyGyro-meanFreq()-X	fBodyGyro-meanFreq()-Y	fBodyGyro-meanFreq()-Z	fBodyAccMag-mean()	fBodyAccMag-std()	fBodyAccMag-meanFreq()	fBodyBodyAccJerkMag-mean()	fBodyBodyAccJerkMag-std()	fBodyBodyAccJerkMag-meanFreq()	fBodyBodyGyroMag-mean()	fBodyBodyGyroMag-std()	fBodyBodyGyroMag-meanFreq()	fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMag-std()	fBodyBodyGyroJerkMag-meanFreq()	angle(tBodyAccMean,gravity)	angle(tBodyAccJerkMean),gravityMean)	angle(tBodyGyroMean,gravityMean)	angle(tBodyGyroJerkMean,gravityMean)	angle(X,gravityMean)	angle(Y,gravityMean)	angle(Z,gravityMean)

##merged_dataset.csv [10299 values for 89 columns] - Feature values for each of the 10299 measurements
Columns are same as in tidy_dataset.csv but with a slight reordering

