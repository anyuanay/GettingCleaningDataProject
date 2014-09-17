##### Step 1: Merges the training and test sets to create one data set
############### Answer to Step 1 ###############
# Read in the training data set
traindata <- read.table("train/X_train.txt", header = FALSE)
# Read in the labels for the training  data
trainlabel <- read.table("train//y_train.txt", header = FALSE)
# Read in the subjects for the training data
trainsubj <- read.table("train/subject_train.txt", header = FALSE)
# Read in the test data set
testdata <- read.table("ttest/X_test.txt", header = FALSE)
# Read in the labels for the test  data
testlabel <- read.table("test//y_test.txt", header = FALSE)
# Read in the subjects for the test data
testsubj <- read.table("test/subject_test.txt", header = FALSE)
# Create trainning data with labels and subjects
trainset <- cbind(traindata, trainlabel, trainsubj)
# Create test data with labels and subjects
testset <- cbin(testdata, testlabel, testsubj)
# Merge training and test data into one data set
dataset <- rbind(trainset, testset)


##### Step 2: Extracts only the meaurements on the mean and standard deviation for each measurement
############### Answer to Step 2 ###############
# Read in the feature names
featurelist <- read.table("features.txt", stringsAsFactors = FALSE)[[2]]
# Extract all the feature names that contain "mean()" and "std()"
meanstdcols <- grep("*mean\\(\\)*|*std\\(\\)*", featurelist)
# Subset the data set on the columns for the means and standard deviations of the measurements
meanAndstd <- dataset[, meanstdcols]


##### Step 3: Uses descrptive activity names to name the activities in the data set
############### Answer to Step 3 ###############
# Set a map between the descriptive activity names and the numbers used for them
act_labs <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
map <- setNames(act_labs[[2]], act_labs[[1]])
# Get all the activities in the data set
acts <- dataset[ncol(dataset) - 1]
# Replace the activity indices with descriptive names
acts_des <- as.data.frame(map[unlist(acts)])
# Replace the activity column in the data set with the column of descriptive names
dataset <- cbind(dataset, acts_des)
dataset <- dataset[, -c(ncol(dataset) - 2)]



##### Step 4: Appropriately lables the data set with descriptive variable names
############## Answer to Step 4 ###############
# Add "subject" and "activity" to the featurelist
featurelist <- c(featurelist, c("subject", "activity"))
# Add descriptive variable names to the merged single data set
desc_names <- make.names(featurelist)
names(dataset) <- desc_names



##### Step 5: From the data set in step 4, creates a second, independently
##### tidy data set with the average of each variable for each activity and each subject
############### Answer to Step 5 ################
# Use the dplyr library
library(dplyr)
dataset_tbl <- tbl_df(dataset)
# Group the data by subjects and activities
by_subj_act <- group_by(dataset_tbl, activity, subject)
means_all_cols <- summarise_each(by_subj_act, funs(mean))
# Output the tidy data
write.table(means_all_cols, "tidy.txt", row.names = FALSE)
