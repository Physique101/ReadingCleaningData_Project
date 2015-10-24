## run_analysis.R script for ReadingC and leaning Data Project - Coursera

# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
# You will be required to submit: 
#         1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
# 
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
#         
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Here are the data for the project: 
#         
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
# 
# 1.	Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive variable names. 
# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(tidyr)

## setwd("./GettingCleaningDataProject/UCI HAR Dataset/")

## High level data
activity_labels_file <- "activity_labels.txt"
features_file <- "features.txt"
features_info_file <- "features_info.txt"

## test data
subject_test_file <- "./test/subject_test.txt"
y_test_file <- "./test/y_test.txt"
x_test_file <- "./test/X_test.txt"

## train data
subject_train_file <- "./train/subject_train.txt"
y_train_file <- "./train/y_train.txt"
x_train_file <- "./train/X_train.txt"

## Load these files in tbl_df data frames; rename as appropriate
activity_labels <- tbl_df(data.frame(read.table(activity_labels_file, sep = " ")))
names(activity_labels) = c("labelID", "labelname")
feature <- tbl_df(data.frame((read.table(features_file, sep = " "))))
names(feature) = c("featureID", "featurename")
## feature_info <- tbl_df(data.frame(readLines(features_info_file)))

subject_test <- tbl_df(data.frame(read.table(subject_test_file)))
names(subject_test) = "subject"
y_test <- tbl_df(data.frame(read.table(y_test_file)))
names(y_test) = "activityID"
x_test <- tbl_df(data.frame(read.table(x_test_file, sep = "")))
names(x_test) = feature$featureID ##  or featurename

subject_train <- tbl_df(data.frame(read.table(subject_train_file)))
names(subject_train) = "subject"
y_train <- tbl_df(data.frame(read.table(y_train_file)))
names(y_train) = "activityID"
x_train <- tbl_df(data.frame(read.table(x_train_file, sep = "")))
names(x_train) = feature$featureID ##  or featurename

## To uniquely identify the test and train participants; may not be needed
unique_subject_test <- tbl_df(data.frame(unique(subject_test)))
unique_subject_train <- tbl_df(data.frame(unique(subject_train)))

## Add A column subjecttype to both subject_test and subject_train
test_data <- subject_test %>% mutate(subjecttype = "test") %>% 
                bind_cols(y_test) %>% bind_cols(x_test)
train_data <- subject_train %>% mutate(subjecttype = "train") %>% 
                bind_cols(y_train) %>% bind_cols(x_train)

## Merge test and train data and, optionally, clean up the feature names
test_train_data <- bind_rows(test_data, train_data)

featureid_name <- as.character(feature$featurename)

## The following cleans up the feature names and appends the feature ID to them. This step is nice only if the 
## exact feature name does not need to be preserved - DISABLED for now
# featureid_name <-gsub("\\(|\\)","", featureid_name) ## remove parenthesis
# featureid_name <-gsub(",|_","-", featureid_name) ## replace ',' and '_' with "-"
# featureid_name <-tolower(featureid_name) ## all small cap
# featureid_name <- paste(feature$featureID, featureid_name, sep = "_") ## prepend feature names with feature IDs

names(test_train_data) <- c("subject", "subjecttype", "activityID", featureid_name)

## add activitylabel and populate with names from activity_labels
test_train_data$activitylabel <- "undefined"
test_train_data$activitylabel[test_train_data$activityID == 1] <- "WALKING"
test_train_data$activitylabel[test_train_data$activityID == 2] <- "WALKING_UPSTAIRS"
test_train_data$activitylabel[test_train_data$activityID == 3] <- "WALKING_DOWNSTAIRS"
test_train_data$activitylabel[test_train_data$activityID == 4] <- "SITTING"
test_train_data$activitylabel[test_train_data$activityID == 5] <- "STANDING"
test_train_data$activitylabel[test_train_data$activityID == 6] <- "LAYING"

## select the mean and std features only and remove the redundant activityID
mergedDataset <- test_train_data[ grepl("subjecttype|subject|activitylabel|([mM]ean)|(std)", names(test_train_data) ) ]

## reorder to have all features at the end
mergedDataset <- mergedDataset %>% select(subjecttype, subject, activitylabel, everything())

## summarize by activity and subject with mean function
tidySummary <- group_by(mergedDataset, activitylabel, subject, subjecttype) %>% summarise_each(funs(mean))

write.csv(mergedDataset, "merged_dataset.csv")
write.csv(tidySummary, "tidy_dataset.csv")
