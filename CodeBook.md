## CodeBook

#Names of datasets and columns imported with read.table
* features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","measures"))

* activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

* subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

* x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$measures)

* y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

* x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$measures)

* y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Interim datasets used for calculations
* 'mergedData': Dataset in which the training and test datasets where combined. 

* 'meanstd': Dataset where only the variables where selcted, that had 'mean' or 'std' in the variable name. 

* 'tidydata': Dataset with the average of each variable for each activity and each subject.

#Final dataset, exported
* 'tidydata.txt': The new tidy dataset was exported. 

