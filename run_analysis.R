#author: "Dan Schreck"
#date: "June 7, 2016"
#Coursera assignment: Getting and Cleaning Data Course Project
#view ReadMe.md and CodeBook.md for more information

#This script performs the following functions:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#1. Merges the training and the test sets to create one data set.
setwd("/Users/schre/DataScience/wd/run_analysis/UCIHARDataset")
testdata <- read.table("test/X_test.txt")
testlabels <- read.table("test/y_test.txt", col.names="label")
testsubjects <- read.table("test/subject_test.txt", col.names="subject")
testset <- cbind(trainsubjects, trainlabels, traindata) #combine all test data cols

traindata <- read.table("train/X_train.txt")
trainlabels <- read.table("train/y_train.txt", col.names="label") 
trainsubjects <- read.table("train/subject_train.txt", col.names="subject")
trainset <- cbind(testsubjects, testlabels, testdata) #combine all train data cols

data <- rbind(testset, trainset) #combine test and training

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt", nrows = 561,stringsAsFactors=FALSE)
features.mean.std.index <- features[grep("mean\\(\\)|std\\(\\)",features$V2),] #extracts "mean()" and "std()" features
data2 <- (data[,c(1,2,features.mean.std.index$V1+2)]) #grab 1st two cols + cols with mean() and std() features

#3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt", col.names=c("index","activity"))
data2$label <- tolower(activities[,2][match(data2$label, activities[,1])])

#test data at this point head(data2[,1:7],10)

#4. Appropriately labels the data set with descriptive variable names.
colnames(data2) <- c("subject","activity",tolower(gsub("[^[:alpha:]]", "", features.mean.std.index$V2)))

#5. From the data set in step 4, create a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
tidy.data <- aggregate(data2[,3:ncol(tidy.data)],list(subject=data2$subject,activity=data2$activity),mean)

# save the data for upload to GitHub
write.table(format(tidy.data, scientific=T), "tidy.run_anlysis.data.txt", row.names=F, col.names=F, quote=2)