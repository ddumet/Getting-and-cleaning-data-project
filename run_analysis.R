## Load required lib
library(plyr)

## Just create a tmp dir on the current working dir
## To download and work on the project
dir.create("./tmpGetCleanDataProj")
setwd("./tmpGetCleanDataProj")

## Download and unzip file ##
zipfileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipfileURL, destfile="./UCIDataset.zip", method = "auto")
unzip("./UCIDataset.zip")


#################################
## STEP 1: Merging Train and Test
#################################
  
## Read Test data and create data.frame |subjectID|Activity|Features measurements|
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
Test <- cbind(subjectTest,yTest, xTest)
  
## Read Train data and create data.frame |subjectID|Activity|Features measurements|
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
Train <- cbind(subjectTrain,yTrain, xTrain)
  
## Read labels for all 561 featureS ##
featuresLabel <- read.table("./UCI HAR Dataset/features.txt")  
    
## Merge Test and Train, gives proper column names and sort by subjectid
result <- rbind(Test, Train)
colnames(result) <- c("subjectId","activity",as.character(featuresLabel[,2]))
result<-result[order(result$subjectId),]
  

###################################################
## STEP 2: Extract only mean and standard deviation
###################################################
  
## create a vector meanAndStd that holds the indices
## for mean and standard deviation measurements
## Grep on "-mean()" and "-std()" then sort the values
meanAndStdInd <- sort(c(grep(pattern="-mean()", featuresLabel$V2, fixed=TRUE), grep(pattern="-std()", featuresLabel$V2, fixed=TRUE)))
  
## Select all labels to drop and drop them from result
NonMeanAndStd <- as.character(featuresLabel[-meanAndStdInd,2])
result <- result[,!(names(result) %in% NonMeanAndStd)]
  

#########################################
## STEP 3: Use descriptive activity names
#########################################
  
activityLabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
result$activity = factor(result$activity, labels = c(as.character(activityLabel$V2)))


############################################
## STEP 4: Label data with description names
############################################

## Change -mean to Mean and -std to StdDev
## Remove "[" "(" ")" "-" and "]"
## Correct the (possibly) mistake "BodyBody" to Body

labels <- names(result)
labels <- gsub('-mean', 'Mean', labels)
labels <- gsub('-std', 'StdDev', labels)
labels <- gsub('[()-]', '', labels)
labels <- gsub('BodyBody', 'Body', labels)
names(result) <- labels


######################################################
## STEP 5: Tidy data average variable/activity/subject
######################################################

tidyData <- ddply(result, c("subjectId","activity"), numcolwise(mean))
write.table(tidyData, "./tidyData.txt", row.name=FALSE)
