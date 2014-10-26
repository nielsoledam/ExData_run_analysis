#
# Assignment for Getting and Cleaning Data Course Project
# Written by Niels Ole Dam

# This script does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.

library(plyr)
library(dplyr)
library(tidyr)
library(reshape2)

# Specify the path to the data files
wd <- "/Users/nielsoledam/Desktop/Coursera/ExData_run_analysis"
dirPath <- paste0(wd, "/UCI HAR Dataset/")
testPath <- paste0(wd, "/UCI HAR Dataset/test/" )
trainPath <- paste0(wd, "/UCI HAR Dataset/train/" )

# Read the train subjects
subjects1 <- read.table(
    paste0(trainPath, "subject_train.txt"),
    header = FALSE,
    col.names = c("subject")
)

# Read the test subjects
subjects2 <- read.table(
    paste0(testPath, "subject_test.txt"),
    header = FALSE,
    col.names = c("subject")
)

# Join the two datasets
subjects <- rbind(subjects1, subjects2)

# Read the activity labels
activityLabels <- read.table(
    paste0(dirPath, "activity_labels.txt"),
    header = FALSE,
    col.names = c("id", "name")
)

# Read the train activities
activities1 <- read.table(
    paste0(trainPath, "y_train.txt"),
    header = FALSE,
    col.names = c("activity")
)

# Read the test activities
activities2 <- read.csv(
    paste0(testPath, "y_test.txt"),
    header = FALSE,
    col.names = c("activity")
)

# Join the two datasets
activities <- rbind(activities1, activities2)

# Change activities to factor and add meaningful labels
activities$activity <- factor(activities$activity)
levels(activities$activity) <- activityLabels$name[activityLabels$id]

# Read the feature labels
featureLabels <- read.table(
    paste0(dirPath, "features.txt"),
    header = FALSE,
    col.names = c("id", "name")
)
featureLabels$name <- as.character(featureLabels$name)

# Read the feature train values
featureValues1 <- read.table(
    paste0(trainPath, "X_train.txt"),
    header = FALSE,
    col.names = featureLabels$name
)

# Read the feature test values
featureValues2 <- read.table(
    paste0(testPath, "X_test.txt"),
    header = FALSE,
    col.names = featureLabels$name
)

# Join the two datasets
featureValues <- rbind(featureValues1, featureValues2)

# Merge the 3 variables: subjects, activities and featureValues
mydata <- as.data.frame(list(subjects, activities, featureValues))
rm(subjects, activities, featureValues, 
   subjects1, activities1, featureValues1,
   subjects2, activities2, featureValues2 )

# Tidy up variable names - i.e. lower case and remove special chars
varNames  <-  names(mydata[3:length(mydata)])
names(mydata) <- gsub("\\.", "", tolower(names(mydata)))
varNames <- (varNames[(grepl("mean\\.\\.",varNames) 
                       | grepl("std\\.\\.",varNames)
                       ) == TRUE])
varNames <- gsub("\\.", "", tolower(varNames))
                       
# Calculate the mean of the selected variables by subject and activity
mydataMelt <- melt(mydata, id=c("subject", "activity"), measure.vars=varNames)
avrData <- dcast(mydataMelt, subject+activity~variable, mean)

# Save the data to a txt file
write.table(avrData, "ExData_run_analysis/tidydata.txt", row.name=FALSE)