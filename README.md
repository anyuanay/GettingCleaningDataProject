
# README for the Course Project of Getting and Cleaning Data


#### Step 1: Merges the training and test sets to create one data set
############### <b>Answer to Step 1:</b> ###############
Read in the training data set
```r
traindata <- read.table("train/X_train.txt", header = FALSE)
```

Read in the labels for the training  data
```r
trainlabel <- read.table("train//y_train.txt", header = FALSE)
```

Read in the subjects for the training data
```r
trainsubj <- read.table("train/subject_train.txt", header = FALSE)
```

Read in the test data set
```r
testdata <- read.table("ttest/X_test.txt", header = FALSE)
```

Read in the labels for the test  data
```r
testlabel <- read.table("test//y_test.txt", header = FALSE)
```

Read in the subjects for the test data
```r
testsubj <- read.table("test/subject_test.txt", header = FALSE)
```

Create trainning data with labels and subjects
```r
trainset <- cbind(traindata, trainlabel, trainsubj)
```

Create test data with labels and subjects
```r
testset <- cbin(testdata, testlabel, testsubj)
```

<b>Finally, merge the training and test data into one data set. In this data set, the last two columns are the labels of activities and the subject identifiers. </b>
```r
dataset <- rbind(trainset, testset)
```

#### Step 2: Extracts only the meaurements on the mean and standard deviation for each measurement
############### <b>Answer to Step 2:</b> ###############
Read in the feature names
```r
featurelist <- read.table("features.txt", stringsAsFactors = FALSE)[[2]]
```

To answer this question, I consider those columns whose names contain the term "mean()" and "std()" as the expected results. Extract all the feature names that contain "mean()" and "std()"
```r
meanstdcols <- grep("*mean\\(\\)*|*std\\(\\)*", featurelist)
```

<b>Subset the data set on the columns for the means and standard deviations of the measurements</b>
```r
meanAndstd <- dataset[, meanstdcols]
```


#### Step 3: Uses descrptive activity names to name the activities in the data set
############### <b>Answer to Step 3:</b> ###############
Set a map between the descriptive activity names and the numbers used for their indices
```r
act_labs <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
map <- setNames(act_labs[[2]], act_labs[[1]])
```

Get all the activities in the data set
```r
acts <- dataset[ncol(dataset) - 1]
```

<Replace the activity indices with descriptive names. 
```r
acts_des <- as.data.frame(map[unlist(acts)])
```

<b>Replace the activity column in the data set with the column of descriptive names. After this step, the last column of the data set is the descriptive names of activities. The second last column is the subject identifiers. </b>
```r
dataset <- cbind(dataset, acts_des)
dataset <- dataset[, -c(ncol(dataset) - 2)]
```


#### Step 4: Appropriately lables the data set with descriptive variable names
############## <b>Answer to Step 4:</b> ###############
Add "subject" and "activity" to the featurelist
```r
featurelist <- c(featurelist, c("subject", "activity"))
```

<b>Add descriptive variable names to the merged single data set</b>
```r
desc_names <- make.names(featurelist)
names(dataset) <- desc_names
```


#### Step 5: From the data set in step 4, creates a second, independently tidy data set with the average of each variable for each activity and each subject
############### <b>Answer to Step 5:</b> ################
Use the dplyr library
```r
library(dplyr)
dataset_tbl <- tbl_df(dataset)
```

Group the data by subjects and activities
```r
by_subj_act <- group_by(dataset_tbl, activity, subject)
means_all_cols <- summarise_each(by_subj_act, funs(mean))
```

<b>Output the tidy data</b>
```r
write.table(means_all_cols, "tidy.txt", row.names = FALSE)
```
