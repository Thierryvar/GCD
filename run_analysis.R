## Created on 10th december 2014 for assignement

## I have done the choice do to exactly what is described in project assignement.
## Can run faster if I subset before treatment the needed datas (extract only mean and std values)
## FIRST STEP :
## Creating a superfile with "test" and "train"

## if not loaded, needs to be done
## install.packages("dplyr")
library(dplyr)
## install.packages("stringr")
library(stringr)

## TEST DATA
##  accessing the data locally
file <- "UCI HAR Dataset/test/X_test.txt"
data_test <- read.table(file,header=FALSE)

## adding the column's names
file <- "UCI HAR Dataset/features.txt"
colx <- read.table(file,header=FALSE)

colnames(data_test) <- colx[,2]

## accessing the datas for subject
file <- "UCI HAR Dataset/test/subject_test.txt"
subject <- read.table(file,header=FALSE)
colnames(subject) <- "subject"

## accessing the datas for activity
file <- "UCI HAR Dataset/test/y_test.txt"
activity <- read.table(file,header=FALSE)
colnames(activity) <- "activity"

## Creating a new set with subject and activity
data_test <- cbind(subject, activity , data_test) 

## data_test is OK, need to do same treatment for data_train

## DATA TRAIN
##  accessing the data locally
file <- "UCI HAR Dataset/train/X_train.txt"
data_train <- read.table(file,header=FALSE)

## adding the column's names
colnames(data_train) <- colx[,2]

## accessing the data for subject
file <- "UCI HAR Dataset/train/subject_train.txt"
subject <- read.table(file,header=FALSE)
colnames(subject) <- "subject"

## accessing the data for activity
file <- "UCI HAR Dataset/train/y_train.txt"
activity <- read.table(file,header=FALSE)
colnames(activity) <- "activity"

## Creating a new set with subject and activity
data_train <- cbind(subject, activity , data_train)

## finally, merge the two sets of datas
data_F <- rbind(data_test,data_train)
## clear work space in case of need
rm(data_test)
rm(data_train)
print("STEP1 ended")

## STEP 2 : extract mean values and std
## subset activity and subject, only the two first columns
data_S1 <- data_F[,1:2]
## subset "mean"
data_S2 <- data_F[,grepl("mean()",colnames(data_F))] ##
## subset "mean"
data_S3 <- data_F[,grepl("std()",colnames(data_F))] ##
## finally, merge the three files in one
data_total <- cbind(data_S1,data_S2,data_S3)
## clear work space in case of need
rm(data_F)
print("STEP2 ended")

## STEP 3 : use descriptive activity names to name the activity in the data set
## obtain the activity labels
file <- "UCI HAR Dataset/activity_labels.txt"
act_lab <- read.table(file,header = FALSE)
## colnames(activity) <- "act"
## replace column activity with descriptive activty label
data_total <- mutate(data_total, activity = act_lab[data_total$activity,2])
print("STEP3 ended")

## STEP 4 : approprially labels the data
## Seems to be allready done in the precedent steps.
## Added names from features and labbeled new variables.
## reshapping names for lisibility remplace "-" with "_"
colT <-as.data.frame(colnames(data_total))
colT1 <- as.data.frame(str_replace_all(colT[,1],"-","_"))
colnames(data_total) <- colT1[,1]
print("STEP4 ended")

## STEP 5 : Create a second set with average values by subject and activity
## ordering the data before treatment
new_d <- arrange(data_total,subject,activity)

new_tidy <- summarise_each(group_by(new_d,subject,activity),funs(mean))

write.table(new_tidy,"GCD_tidy",row.name = FALSE )

print("STEP5 ended")
## Final result 180 observations of 81 variables
