Guide on how to use the run_analysis.r script created for the Course Project of Getting and Cleaning Data Course Module

Description of script

This script contains 5 functions.
The five functions are: read_data(), extract_columns(), use_descriptive_activity_name(), new_tidy_data(), write_file_new_tidy_data_n_check().
Each of the functions build on the previous function in the sequence listed.
e.g. new_tidy_data() calls use_descriptive_activity_name()

This script requires the working directory to be the same as the "UCI HAR Dataset" data folder.
e.g if the "UCI HAR Dataset" data folder is located at C:\Temp then the working directory should be C:\Temp.
The script itself is also recommended to be downloaded to the locat working directory.
i.e. if using the previous example, the script should also reside in C:\Temp.

Instruction to run the script

Step1: Set the R working directory to the directory where "UCI HAR Dataset" data folder resides.
Step2: Run the R command source("run_analysis.r") <- step assumes that the file resides in the working directory.
Step3: Run the R command to call the function write_file_new_tidy_data_n_check().
e.g. data <- write_file_new_tidy_data_n_check().
Note: Read the description of individual functions for understanbding of what each function does. 


Description of function read_data()

The function reads in data from the data files for test and train and join the data.
The function also assign the appropriate column names to the joined data (based on features.txt).
The function returns the resulting joined data.

Description of function extract_columns()

The function call the read_data() function to get the joined data.
The function then extract only the relevant columns.
i.e. measurements on the mean and standard deviation for each measurement.
The function then return this extracted data sub-set of 68 columns.

Description of function use_descriptive_activity_name()

The function call the extract_columns() function to get the extracted data sub-set.
The function then replaced the activity column with description of the activity instead of enum values.
i.e. replace enum with description according to definition in activity_labels.txt.
The function then replace this modified data.

Description of function new_tidy_data()

The function call the use_descriptive_activity_name() function to get the modified data.
The function then reshape the data using melt and dcast function of the reshape2 library.
The average of each variable for each activity and each subject is calculated using the dcast function.
The column names are also modified to correctly describe the data.
The function then return this new tidy data set of 180 rows and 68 columns.

Description of function write_file_new_tidy_data_n_check()

The function call the new_tidy_data() function to get the new tidy data.
The function write the new tidy data to a txt file at the working directory with filename = new_tidy_data.txt.
The function the use View function to visually display the data for comparison.
The data compared are the original data from new_tidy_data() function and the data read in from new_tidy_data.txt.
The function then return the data read in from new_tidy_data.txt.
