############################################ Description of script ######################################################
## This script contains 5 functions.
## The five functions are: 
## read_data()
## extract_columns() 
## use_descriptive_activity_name()
## new_tidy_data()
## write_file_new_tidy_data_n_check()
## each of the functions build on the previous function in the sequence listed
## e.g. new_tidy_data() calls use_descriptive_activity_name()
##
## This script requires the working directory to be the same as the "UCI HAR Dataset" data folder.
## e.g if the "UCI HAR Dataset" data folder is located at C:\Temp then the working directory should be C:\Temp
## The script itself is also recommended to be downloaded to the locat working directory
## i.e. if using the previous example, the script should also reside in C:\Temp
##
## Instruction to run the script
## Step1: Set the R working directory to the directory where "UCI HAR Dataset" data folder resides
## Step2: Run the R command source("run_analysis.r") <- step assumes that the file resides in the working directory
## Step3: Run the R command to call the function write_file_new_tidy_data_n_check()
## e.g. data <- write_file_new_tidy_data_n_check()
## Note: Read the description of individual functions for understanbding of what each function does 
##
##
## Description of function read_data()
## The function reads in data from the data files for test and train and join the data
## The function also assign the appropriate column names to the joined data (based on features.txt)
## The function returns the resulting joined data
##
## Description of function extract_columns()
## The function call the read_data() function to get the joined data
## The function then extract only the relevant columns
## i.e. measurements on the mean and standard deviation for each measurement
## The function then return this extracted data sub-set of 68 columns
##
## Description of function use_descriptive_activity_name()
## The function call the extract_columns() function to get the extracted data sub-set
## The function then replaced the activity column with description of the activity instead of enum values
## i.e. replace enum with description according to definition in activity_labels.txt
## The function then replace this modified data
##
## Description of function new_tidy_data()
## The function call the use_descriptive_activity_name() function to get the modified data
## The function then reshape the data using melt and dcast function of the reshape2 library
## The average of each variable for each activity and each subject is calculated using the dcast function
## The column names are also modified to correctly describe the data
## The function then return this new tidy data set of 180 rows and 68 columns
##
## Description of function write_file_new_tidy_data_n_check()
## The function call the new_tidy_data() function to get the new tidy data 
## The function write the new tidy data to a txt file at the working directory with filename = new_tidy_data.txt
## The function the use View function to visually display the data for comparison
## The data compared are the original data from new_tidy_data() function and the data read in from new_tidy_data.txt 
## The function then return the data read in from new_tidy_data.txt
##
#########################################################################################################################

read_data <- function()
{
#####Start of Section 1 that read in the data from relevant files

##read in the data from relevant files for test
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

##read in the data from relevant files for train
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#####End Section 1


#####Start of Section 2 to combine data read in from files into combined data for test and train respectively

##Combine data read in from files into combined data for test
combine_test <- cbind(subject_test,activity_test, data_test)

##Combine data read in from files into combined data for train
combine_train <- cbind(subject_train,activity_train, data_train)

#####End Section 2



#####Start of Section 3 to combine data for test and train into single dataset

full_data <- rbind(combine_test,combine_train)

#####End Section 3


#####Start of Section 4 that gives names the respective columns 

##read the column names of 561 columns in data (i.e. x_test.txt and x_train.txt files)
features <- read.table("./UCI HAR Dataset/features.txt", colClasses= "character")
col_names <- NULL
for(n in 1:nrow(features))
{
	col_names <- append(col_names,features[n,2])
}

##add the column names for the appended columns (i.e. add the column names for subject and activity columns)
col_names <- c("subject","activity",col_names)

##assign the column names to full_data
names(full_data) <- col_names

#####End Section 4

#####Return full_data as result
full_data 
}

extract_columns <- function()
{
##get data using the read_data function above
full_data <- read_data()

##filter out the required data (mean and standard deviation)
filter <- c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)

##extract the columns from the full data using the filter
usedata <- full_data[filter]
}

use_descriptive_activity_name <- function()
{
##get filtered data from the extract_columns function above
data<- extract_columns()

##get the activity names from activity_labels.txt
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses= "character")

##assign descriptive activity names to data using a for loop
for (n in 1:nrow(data))
{
	data[n,2] <- activity_label[as.numeric(data[n,2]),2]
}

##return data
data
}

new_tidy_data <- function()
{
##get data to reshape from use_descriptive_activity_name function above
data <- use_descriptive_activity_name()

##get column names of the data
col_names <- names(data)

##load the library required to reshape the data
library(reshape2)

##melt the data where the id columns are the first two columns (i.e. subject & activity)
dataMelt <- melt(data, id = col_names[1:2], measure.vars=col_names[3:68]) 

##obtain the average of each variable (in the original dataset before reshape) for each activity and each subject
data_avg_step5 <- dcast(dataMelt, subject + activity ~ variable,mean) 

##rename column names such that it reflect that each values reflected is the average of the variables
new_var_name <- c(
"Avg_TimeDomainBodyAcceleraion_Xaxis_Mean",
"Avg_TimeDomainBodyAcceleraion_Yaxis_Mean",
"Avg_TimeDomainBodyAcceleraion_Zaxis_Mean",
"Avg_TimeDomainBodyAcceleraion_Xaxis_StandardDeviation",
"Avg_TimeDomainBodyAcceleraion_Yaxis_StandardDeviation",
"Avg_TimeDomainBodyAcceleraion_Zaxis_StandardDeviation",
"Avg_TimeDomainGravityAcceleraion_Xaxis_Mean",
"Avg_TimeDomainGravityAcceleraion_Yaxis_Mean",
"Avg_TimeDomainGravityAcceleraion_Zaxis_Mean",
"Avg_TimeDomainGravityAcceleraion_Xaxis_StandardDeviation",
"Avg_TimeDomainGravityAcceleraion_Yaxis_StandardDeviation",
"Avg_TimeDomainGravityAcceleraion_Zaxis_StandardDeviation",
"Avg_TimeDomainBodyAcceleraionJerk_Xaxis_Mean",
"Avg_TimeDomainBodyAcceleraionJerk_Yaxis_Mean",
"Avg_TimeDomainBodyAcceleraionJerk_Zaxis_Mean",
"Avg_TimeDomainBodyAcceleraionJerk_Xaxis_StandardDeviation",
"Avg_TimeDomainBodyAcceleraionJerk_Yaxis_StandardDeviation",
"Avg_TimeDomainBodyAcceleraionJerk_Zaxis_StandardDeviation",
"Avg_TimeDomainBodyGyro_Xaxis_Mean",
"Avg_TimeDomainBodyGyro_Yaxis_Mean",
"Avg_TimeDomainBodyGyro_Zaxis_Mean",
"Avg_TimeDomainBodyGyro_Xaxis_StandardDeviation",
"Avg_TimeDomainBodyGyro_Yaxis_StandardDeviation",
"Avg_TimeDomainBodyGyro_Zaxis_StandardDeviation",
"Avg_TimeDomainBodyGyroJerk_Xaxis_Mean",
"Avg_TimeDomainBodyGyroJerk_Yaxis_Mean",
"Avg_TimeDomainBodyGyroJerk_Zaxis_Mean",
"Avg_TimeDomainBodyGyroJerk_Xaxis_StandardDeviation",
"Avg_TimeDomainBodyGyroJerk_Yaxis_StandardDeviation",
"Avg_TimeDomainBodyGyroJerk_Zaxis_StandardDeviation",
"Avg_TimeDomainBodyAcceleraionMagnitude_Mean",
"Avg_TimeDomainBodyAcceleraionMagnitude_StandardDeviation",
"Avg_TimeDomainGravityAcceleraionMagnitude_Mean",
"Avg_TimeDomainGravityAcceleraionMagnitude_StandardDeviation",
"Avg_TimeDomainBodyAcceleraionJerkMagnitude_Mean",
"Avg_TimeDomainBodyAcceleraionJerkMagnitude_StandardDeviation",
"Avg_TimeDomainBodyGyroMagnitude_Mean",
"Avg_TimeDomainBodyGyroMagnitude_StandardDeviation",
"Avg_TimeDomainBodyGyroJerkMagnitude_Mean",
"Avg_TimeDomainBodyGyroJerkMagnitude_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraion_Xaxis_Mean",
"Avg_FrequencyDomainBodyAcceleraion_Yaxis_Mean",
"Avg_FrequencyDomainBodyAcceleraion_Zaxis_Mean",
"Avg_FrequencyDomainBodyAcceleraion_Xaxis_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraion_Yaxis_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraion_Zaxis_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraionJerk_Xaxis_Mean",
"Avg_FrequencyDomainBodyAcceleraionJerk_Yaxis_Mean",
"Avg_FrequencyDomainBodyAcceleraionJerk_Zaxis_Mean",
"Avg_FrequencyDomainBodyAcceleraionJerk_Xaxis_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraionJerk_Yaxis_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraionJerk_Zaxis_StandardDeviation",
"Avg_FrequencyDomainBodyGyro_Xaxis_Mean",
"Avg_FrequencyDomainBodyGyro_Yaxis_Mean",
"Avg_FrequencyDomainBodyGyro_Zaxis_Mean",
"Avg_FrequencyDomainBodyGyro_Xaxis_StandardDeviation",
"Avg_FrequencyDomainBodyGyro_Yaxis_StandardDeviation",
"Avg_FrequencyDomainBodyGyro_Zaxis_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraionMagnitude_Mean",
"Avg_FrequencyDomainBodyAcceleraionMagnitude_StandardDeviation",
"Avg_FrequencyDomainBodyAcceleraionJerkMagnitude_Mean",
"Avg_FrequencyDomainBodyAcceleraionJerkMagnitude_StandardDeviation",
"Avg_FrequencyDomainBodyGyroMagnitude_Mean",
"Avg_FrequencyDomainBodyGyroMagnitude_StandardDeviation",
"Avg_FrequencyDomainBodyGyroJerkMagnitude_Mean",
"Avg_FrequencyDomainBodyGyroJerkMagnitude_StandardDeviation"
)
col_names <- c(col_names[1:2], new_var_name)
names(data_avg_step5) <- col_names

##return new tide data
data_avg_step5
}

write_file_new_tidy_data_n_check <- function()
{
##get the reshaped new tidy data from new_tidy_data function above
new_tidy_data <- new_tidy_data()

##write the new tidy data result to file new_tide_data.txt at working directory
write.table(new_tidy_data, file = "new_tidy_data.txt", row.name = FALSE)

##read in the written file data for visual comparison against the original new tidy data result
new_tidy_data_file_readin <- read.table("new_tidy_data.txt", header = TRUE, colClasses= "character") 

##View both data sets as a visual table format
View(new_tidy_data)
View(new_tidy_data_file_readin)

##return the file read-in version of new tidy data
new_tidy_data_file_readin
}
