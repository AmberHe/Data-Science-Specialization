path <- "C:/Users/Administrator/Desktop/DS Specialization/3. Getting and Cleaning Data/Quizs and Projects/p_1"
setwd(path)

library(data.table)
File = "dataset.Rdata" # Existed .Rdata
##1.Merges the training and the test sets to create one data set.
# Load data using data.table package
if(!file.exists(File)){
    features <- fread("./UCI HAR Dataset/features.txt")
    
    train <- fread("./UCI HAR Dataset/train/X_train.txt")
    test <- fread("./UCI HAR Dataset/test/X_test.txt")
    
    label.train <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = "factor")
    label.test <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = "factor")
    
    subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "factor")
    subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "factor")
}
load(File)
label <- rbind(label.train, label.test)
subject <- rbind(subject.train, subject.test)
names(label) <- "label"
names(subject) <- "subject"

# Merge training and testing data
dat <- rbind(train, test)
dat <- data.frame(dat, subject, label)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
# Extract variables' names with mean() and std()
num.mean.std.meanFreq <- grep("mean|std", features$V2) #79
num.meanFreq <- grep("meanFreq",features$V2) #66
num.mean.std <- num.mean.std.meanFreq[which(match(num.mean.std.meanFreq, num.meanFreq, nomatch = 0) == 0)]
dat.mean.std <- dat[, c(num.mean.std, 562, 563)] #68

##3.Uses descriptive activity names to name the activities in the data set
levels(dat.mean.std$label) <- c("Walking", "WalkingUp", "WalkingDown", "Sitting", "Standing", "Laying")

##4.Appropriately labels the data set with descriptive variable names.
feature.new <- features$V2[num.mean.std]
feature.new <- gsub("[()]", "", feature.new)
feature.new <- make.names(feature.new)
colnames(dat.mean.std) <- c(feature.new, "subject", "label")

##5.From the data set in step 4, creates a second, independent tidy data set 
# With the average of each variable for each activity and each subject.
dat.mean.std.copy <- dat.mean.std
levels(dat.mean.std.copy$label) <- c(1,2,3,4,5,6)
dat.mean.std.copy$label <- as.numeric(dat.mean.std.copy$label)
dat.mean.std.copy$subject <- as.numeric(dat.mean.std.copy$subject)
dat.mean.std.g <- split(dat.mean.std.copy, c(label, subject))
# Calculate the average of each variable for each activity and each subject
myData <- as.data.frame(t(sapply(dat.mean.std.g, colMeans))) 
rownames(myData) <- 1:180
myData$label <- as.factor(myData$label)
levels(myData$label) <- c("Walking", "WalkingUp", "WalkingDown", "Sitting", "Standing", "Laying")
write.csv(myData, file = "tidyData.csv")