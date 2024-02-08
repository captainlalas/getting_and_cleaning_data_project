library(dplyr)
#The files used in this script were downloaded and uncompressed manually
# 1. Merge the training and test datasets

# Let's start by reading files X, y and subject 
#for training and testing accordingly
X_train <- read.table("./UCI-HAR-Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI-HAR-Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI-HAR-Dataset/train/subject_train.txt", header = FALSE)

X_test <- read.table("./UCI-HAR-Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI-HAR-Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./UCI-HAR-Dataset/test/subject_test.txt", header = FALSE)

# Now we can read the feature vector and activity labels
features <- read.table("./UCI-HAR-Dataset/features.txt", header = FALSE)
act_labels <- read.table("./UCI-HAR-Dataset/activity_labels.txt", header = FALSE)

#Assigning variables names
colnames(X_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(X_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(act_labels) <- c("activityId", "activityType")

#4. Merging/labeling all datasets into one
alltrain <- cbind(y_train,subject_train,  X_train)
alltest <- cbind(y_test, subject_test, X_test)
finalset <- rbind(alltrain, alltest)


# 2. Extracting only the measurements on the mean and standard deviation for each measurement
col_names <- colnames(finalset)
mean_and_sd <- (grepl("activityId", col_names) | grepl("subjectId", col_names) | grepl("mean..", col_names) | grepl("std..", col_names))

setforMeanandSd <- finalset[, mean_and_sd == TRUE]


# 3. Use descriptive activity names
setWithActivityNames <- merge(setforMeanandSd, act_labels, by = "activityId", all.x = TRUE)


# 5. Creating a new tidy data set with the avg of each variable for each activity and subject
tidydataset <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
tidydataset <- tidydataset[order(tidydataset$subjectId, tidydataset$activityId), ]

#Writing and saving the new tidy data into a text file
write.table(tidydataset, "tidydataset.txt", row.names = FALSE)