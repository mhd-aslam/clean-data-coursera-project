
# Load the dplyr package:
library(dplyr)

#***********************READ ALL THE NECESSARY FILES****************************#

# Read the features.txt which contain the list of all features:
features <- read.table("UCI HAR Dataset/features.txt")

# Read the activity_labels.txt which contain all the labels for each activity:
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Read the test variables:
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")

# Read the training variables:
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")

#********************MERGE AND NAME THE TRAIN AND TEST DATA*******************#

# Merge the train and test sets:
set <- rbind(train_set, test_set)

# Merge the train and test labels:
labels <- rbind(train_labels, test_labels)

# Merge the subjects from train and test data:
subject <- rbind(subject_train, subject_test)

# Rename the columns of the dataset with the respective feature name:
names(set) <- features[, 2]

# Name the label vector as "Activity":
names(labels) <- "Activity"

# Name the subject vector as "Subject":
names(subject) <- "Subject"


#*****MAKE A DATA WITH MEAN AND STANDARD DEVIATIONS OF THE FEATURES************#

# Find the columns mean and sd of different features:
features_mean_std <- grep("mean|std", features[, 2])

# Subset the merged set to a set with the means and sd of the features:
mean_std_set <- set[, features_mean_std] 

# Merge all the three set, labels, and mean_std_set into a single dataset:
complete_data <- cbind(subject, labels, mean_std_set)


#*******************USE DESCRIPTIVE NAMES FOR THE ACTIVITIES*******************#

# Replace the numbers with the descriptive activity labels:
complete_data[,2] <- activity_labels[complete_data[,2], 2] 


#******************************************************************************#

# Use the pipe operator from dplyr package to find the averages of each feature 
# variable for each Activity and Subject:


avg_data <- complete_data %>%
    # Grouped by Subject and Activity
    group_by(Subject,Activity) %>% 
    #Compute the mean for each feature variable
    summarise_all(funs(mean)) 


#**********************WRITE THE TIDY DATA TO A TXT FILE***********************#

write.table(avg_data, "avg_data.txt", row.name = FALSE)
