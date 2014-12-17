## Created on 10th december 2014 for assignement
## file <- "UCI HAR Dataset/test/X_test.txt"
## cran <- tbl_df(file) don't work not a data frame
## cran <- read.csv(file)
## head(cran)
## only for test
## cran <- as.data.frame(scan(file,nmax=100))
## permet de ranger les datas en valeur limité aux 100 premières valeurs
## cran <- as.data.frame(scan(file,nmax=2000,nlines=3,what="list",fill=TRUE,multi.line=TRUE))
## ligne = 561 valeurs !!!
## cran3 <- read.table(file,header=FALSE) une table avec deux colonnes, N° 1 à 561, libellé.
## dim(cran3)
## [1] 561   2
## colnames(dataF) <- cran3[,2] insère les noms de colonnes
## dataF2 <- dataF[,grepl("mean",colnames(dataF))] col avec mean
## dataF3 <- dataF[,grepl("std",colnames(dataF))] col avec std
## dataF4 <- cbind(dataF2,dataF3) ensemble des deux accolés

## I have done the choice do to exactly what is described in project assignement.
## Can run faster if I subset before treatment the needed datas (extract only mean and std values)
## FIRST STEP :
## Creating a superfile with "test" and "train"

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
file <- "UCI HAR Dataset/ttrain/X_train.txt"
data_train <- read.table(file,header=FALSE)

## adding the column's names
colnames(data_train) <- colx[,2]

## accessing the data for subject
file <- "UCI HAR Dataset/train/subject_train.txt"
subject <- read.table(file,header=FALSE)
colnames(subject) <- "subject"

## accessing the daty for activity
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

## STEP 2 : extract mean values and std
## subset activity and subject, only the two first columns
data_S1 <- data_F[,1:2]
## subset "mean"
data_S2 <- data_F[,grepl("mean",colnames(dataF))] ##
## subset "mean"
data_S3 <- data_F[,grepl("std",colnames(dataF))] ##
## finally, merge the three files in one
data_total <- cbind(data_S1,data_S2,data_S3)
## clear work space in case of need
rm(data_F)

## STEP 3 : use descriptive activity names to name the activity in the data set
install.packages("dplyr")
library(dplyr)
## obtain the activity labels
file <- "UCI HAR Dataset/activity_label.txt"
act_lab <- read.table(file,header = FALSE)
colnames(activity) <- "act")
## replace column activity with descriptive activty label
data_total <- mutate(data_total, activity = act_lab[data_total$activity,2])

## STEP 4 : approprially labels the data
## Seems to be allready done in the precedent steps.
## Added names from features and labbeled new variables.

## STEP 5 : Create a second set with average values by subject and activity




