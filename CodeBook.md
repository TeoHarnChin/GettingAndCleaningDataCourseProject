## Data Summary

### The dataset described in this document is the summary of data extracted from the Samsung data contained with “UCI HAR Dataset” folder contained within “getdata_projectfiles_UCI HAR Dataset.zip” file. This document should be used as a supplment to the documents describing the original data (e.g. “features_info.txt” and “README.txt”).

### This dataset is derived by performing a number of steps on the original data to analyze the data. Description of the original data can be found within the file “features_info.txt” within the “UCI HAR Dataset” folder.

### The first step is to join the data for train set and test set. A combined data for the respective group/set (i.e. test and train) is first obtained by combining the measurement data (e.g. X_test.txt) with the subject (e.g. subject_test.txt) and activity (e.g. activity_train.txt) data for the respective group. The two sets of combined data are then combined into a single set of data.

### The second step is to subset the combined data such that only rows corresponding to the mean and standard deviation measurements of each of the features in original data is selected. The enumerated values representing various activity is also replaced with description names for the respective activities according to the information in “activity_labels.txt” (within “UCI HAR Dataset” folder).

### With reference to “features_info.txt”, the features contained within the original measurement data (e.g. X_test.txt) are as follows:
### * tBodyAcc-XYZ
### * tGravityAcc-XYZ
### * tBodyAccJerk-XYZ
### * tBodyGyro-XYZ
### * tBodyGyroJerk-XYZ
### * tBodyAccMag
### * tGravityAccMag
### * tBodyAccJerkMag
### * tBodyGyroMag
### * tBodyGyroJerkMag
### * fBodyAcc-XYZ
### * fBodyAccJerk-XYZ
### * fBodyGyro-XYZ
### * fBodyAccMag
### * fBodyAccJerkMag
### * fBodyGyroMag
### * fBodyGyroJerkMag

### For features where the label (above) contains “-XYZ”, there are three pairs of means and standard deviation variable pair – one pair for each axis of X, Y and Z. For the rest of the features, each feature has a pair of mean and standard deviation variable pair. 

### The data resulting from step2 has 68 columns and 10299 rows. The first two columns are subject and activity respectively and the rest of the 66 columns correspond to the mean and standard variable pairs from the respective features. The first column within the 66 columns correspond to mean of tBodyAcc in the X axis i.e. labeled as tBodyAcc-mean()-X. The subsequent columns that follows are  labeled as tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, tBodyAcc-std()-Y and tBodyAcc-std()-Z. The trend is repeated for feature “tGravityAcc-XYZ” and the rest of the features according to their listed sequence. 

### The third step is to summarize the data that resulted from step2 into a new independent data set. The data is summarized to represent the average of each variable for each variable for each activity and each subject. The new data set has 68 columns and 180 rows.

### The labels for the data columns of the new data set are as follows:
### * subject
### * activity
### * Avg_TimeDomainBodyAcceleraion_Xaxis_Mean
### * Avg_TimeDomainBodyAcceleraion_Yaxis_Mean
### * Avg_TimeDomainBodyAcceleraion_Zaxis_Mean
### * Avg_TimeDomainBodyAcceleraion_Xaxis_StandardDeviation
### * Avg_TimeDomainBodyAcceleraion_Yaxis_StandardDeviation
### * Avg_TimeDomainBodyAcceleraion_Zaxis_StandardDeviation
### * Avg_TimeDomainGravityAcceleraion_Xaxis_Mean
### * Avg_TimeDomainGravityAcceleraion_Yaxis_Mean
### * Avg_TimeDomainGravityAcceleraion_Zaxis_Mean
### * Avg_TimeDomainGravityAcceleraion_Xaxis_StandardDeviation
### * Avg_TimeDomainGravityAcceleraion_Yaxis_StandardDeviation
### * Avg_TimeDomainGravityAcceleraion_Zaxis_StandardDeviation
### * Avg_TimeDomainBodyAcceleraionJerk_Xaxis_Mean
### * Avg_TimeDomainBodyAcceleraionJerk_Yaxis_Mean
### * Avg_TimeDomainBodyAcceleraionJerk_Zaxis_Mean
### * Avg_TimeDomainBodyAcceleraionJerk_Xaxis_StandardDeviation
### * Avg_TimeDomainBodyAcceleraionJerk_Yaxis_StandardDeviation
### * Avg_TimeDomainBodyAcceleraionJerk_Zaxis_StandardDeviation
### * Avg_TimeDomainBodyGyro_Xaxis_Mean
### * Avg_TimeDomainBodyGyro_Yaxis_Mean
### * Avg_TimeDomainBodyGyro_Zaxis_Mean
### * Avg_TimeDomainBodyGyro_Xaxis_StandardDeviation
### * Avg_TimeDomainBodyGyro_Yaxis_StandardDeviation
### * Avg_TimeDomainBodyGyro_Zaxis_StandardDeviation
### * Avg_TimeDomainBodyGyroJerk_Xaxis_Mean
### * Avg_TimeDomainBodyGyroJerk_Yaxis_Mean
### * Avg_TimeDomainBodyGyroJerk_Zaxis_Mean
### * Avg_TimeDomainBodyGyroJerk_Xaxis_StandardDeviation
### * Avg_TimeDomainBodyGyroJerk_Yaxis_StandardDeviation
### * Avg_TimeDomainBodyGyroJerk_Zaxis_StandardDeviation
### * Avg_TimeDomainBodyAcceleraionMagnitude_Mean
### * Avg_TimeDomainBodyAcceleraionMagnitude_StandardDeviation
### * Avg_TimeDomainGravityAcceleraionMagnitude_Mean
### * Avg_TimeDomainGravityAcceleraionMagnitude_StandardDeviation
### * Avg_TimeDomainBodyAcceleraionJerkMagnitude_Mean
### * Avg_TimeDomainBodyAcceleraionJerkMagnitude_StandardDeviation
### * Avg_TimeDomainBodyGyroMagnitude_Mean
### * Avg_TimeDomainBodyGyroMagnitude_StandardDeviation
### * Avg_TimeDomainBodyGyroJerkMagnitude_Mean
### * Avg_TimeDomainBodyGyroJerkMagnitude_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraion_Xaxis_Mean
### * Avg_FrequencyDomainBodyAcceleraion_Yaxis_Mean
### * Avg_FrequencyDomainBodyAcceleraion_Zaxis_Mean
### * Avg_FrequencyDomainBodyAcceleraion_Xaxis_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraion_Yaxis_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraion_Zaxis_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraionJerk_Xaxis_Mean
### * Avg_FrequencyDomainBodyAcceleraionJerk_Yaxis_Mean
### * Avg_FrequencyDomainBodyAcceleraionJerk_Zaxis_Mean
### * Avg_FrequencyDomainBodyAcceleraionJerk_Xaxis_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraionJerk_Yaxis_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraionJerk_Zaxis_StandardDeviation
### * Avg_FrequencyDomainBodyGyro_Xaxis_Mean
### * Avg_FrequencyDomainBodyGyro_Yaxis_Mean
### * Avg_FrequencyDomainBodyGyro_Zaxis_Mean
### * Avg_FrequencyDomainBodyGyro_Xaxis_StandardDeviation
### * Avg_FrequencyDomainBodyGyro_Yaxis_StandardDeviation
### * Avg_FrequencyDomainBodyGyro_Zaxis_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraionMagnitude_Mean
### * Avg_FrequencyDomainBodyAcceleraionMagnitude_StandardDeviation
### * Avg_FrequencyDomainBodyAcceleraionJerkMagnitude_Mean
### * Avg_FrequencyDomainBodyAcceleraionJerkMagnitude_StandardDeviation
### * Avg_FrequencyDomainBodyGyroMagnitude_Mean
### * Avg_FrequencyDomainBodyGyroMagnitude_StandardDeviation
### * Avg_FrequencyDomainBodyGyroJerkMagnitude_Mean
### * Avg_FrequencyDomainBodyGyroJerkMagnitude_StandardDeviation 

### Other than the first two columns (i.e. subject and activity) each of the columns of the new data set represents the data which is the average of the readings corresponding to the respective variables represented within the data set from step2 for each combination of subject and activity.

### Detailed description regarding the units for the respective variable can be found within “README.txt” in “UCI HAR Dataset” folder. 

### An extraction of information from “README.txt” with regards to units is as follows:
#### The dataset includes the following files:
#### =========================================
####
#### - 'README.txt'
####
#### - 'features_info.txt': Shows information about the variables used on the feature vector.
####
#### - 'features.txt': List of all features.
####
#### - 'activity_labels.txt': Links the class labels with their activity name.
####
#### - 'train/X_train.txt': Training set.
####
#### - 'train/y_train.txt': Training labels.
####
#### - 'test/X_test.txt': Test set.
####
#### - 'test/y_test.txt': Test labels.
####
#### The following files are available for the train and test data. Their descriptions are equivalent. 
####
#### - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
####
#### - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
####
#### - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
####
#### - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
