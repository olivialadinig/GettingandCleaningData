install.packages("tidyverse")
library(tidyverse)
library(dplyr)

#read in all the data sets and assign them to variables
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","measures"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$measures)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$measures)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#combine the rows and the columns into a large dataset
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
mergedData <- cbind(subject, y, x)

#only return the data that contains 'mean' or 'std'
meanstd<-mergedData %>%select(subject, code,contains("mean"), contains("std"))

#give the activities the appropriate names
meanstd$code <- activities[meanstd$code, 2]
names(meanstd)[names(meanstd) == "code"] <- "activity"


#create tidy dataset, with the average of each variable for each activity and each subject.
tidydata<-meanstd %>%group_by(subject, activity)%>%summarize_all(mean)

#export/save this dataset
write.table(tidydata, "tidydata.txt", row.names=FALSE)

