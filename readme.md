# Readme

This is a project to get and clean a data set from the below dataset.

# The UCI HAR Dataset

The data is obtained from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years to recognize the human activity. Each person does different activities such as WALKING, LAYING, STANDING etc.

The data set is separated as train and test data in the UCI HAR Dataset.

Full description of the dataset is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# run_analysis.R

This is the script used to perform the merging and cleaning of the above data.

The script does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# CodeBook.md

The CodeBook.md file contains the details regarding the variables in the tidy data set.
