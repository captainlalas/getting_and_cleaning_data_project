library(dplyr)
#The files used in this script were downloaded and uncompressed manually
# 1. Merge the training and test datasets

# Let's start by reading files X, y and subject 
#for training and testing accordingly
X_train <- read.table("./UCI-HAR-Dataset/train/X_train.txt")
y_train <- read.table("./UCI-HAR-Dataset/train/y_train.txt")
subject_train <- read.table("./UCI-HAR-Dataset/train/subject_train.txt")

X_test <- read.table("./UCI-HAR-Dataset/test/X_test.txt")
y_test <- read.table("./UCI-HAR-Dataset/test/y_test.txt")
subject_test <- read.table("./UCI-HAR-Dataset/test/subject_test.txt")

# Now we can read the feature vector and activity labels
features <- read.table("./UCI-HAR-Dataset/features.txt")
act_labels <- read.table("./UCI-HAR-Dataset/activity_labels.txt")

#Assigning variables names
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(act_labels) <- c("activityID", "activityType")

#Merging all datasets into one