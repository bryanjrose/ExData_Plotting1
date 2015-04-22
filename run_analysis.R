#########################################
# Getting and cleaning data course project
# bryanjrose 20-Apr-15
#########################################

# Load libraries if necessary
if(!require(dplyr)){install.packages("dplyr")}; library(dplyr)
if(!require(reshape2)){install.packages("reshape2")}; library(reshape2)


# Download and unzip the zip file
# Check for data file in working directory, download if not present
linkaddress <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tempzip <- "tempdata/HARdata.zip"

if (!file.exists("UCI HAR Dataset")) {
        if (!file.exists("tempdata")) {dir.create("tempdata")}
                download.file(linkaddress, destfile=tempzip)
                unzip(tempzip)
                unlink("tempdata", recursive=TRUE)
}

# Merge training and test data sets into one table

# test data:
subject_test <- read.table("UCI HAR Dataset//test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset//test/X_test.txt")
y_test <- read.table("UCI HAR Dataset//test/y_test.txt")
tbl_test <- cbind(subject_test, y_test, x_test)

# train data:
subject_train <- read.table("UCI HAR Dataset//train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset//train/X_train.txt")
y_train <- read.table("UCI HAR Dataset//train/y_train.txt")
tbl_train <- cbind(subject_train, y_train, x_train)

# combine into same table
tbl_combined <- rbind(tbl_train, tbl_test)

# read column names from features.txt and scrub them for readability
features <- read.table("UCI HAR Dataset//features.txt", col.names = c("Num", "FeatureName"))
headings <- c("TestSubject", "activity", as.vector(features$FeatureName)) 
validated_headings <- make.names(names=headings, unique=TRUE, allow_ = TRUE)
validated_headings <- gsub("BodyBody", "Body", validated_headings)
validated_headings <- gsub("bandsEnergy", "Energy", validated_headings)
validated_headings <- gsub("...", ".", validated_headings, fixed=TRUE)
validated_headings <- gsub("..", ".", validated_headings, fixed=TRUE)

#Assign the clean headings to the table columns
names(tbl_combined) <- validated_headings

# Assign activity descriptions by matching the number with the name (using inner_join)
activity_labels <- read.table("UCI HAR Dataset//activity_labels.txt", col.names = c("Num", "ActivityName"))
tbl_readable <- inner_join(tbl_combined, activity_labels, by=c("activity" = "Num"))

# Extract only the measurements that correspond to mean or standard deviation
tbl_selected <- select(tbl_readable, TestSubject, ActivityName, contains("mean"), contains("std"))

# Create the tidy dataset and save to working directory as .txt file
# Melting the dataset so we can run dcast and apply the mean fucntion across it
tbl_melt <- melt(tbl_selected, id=c("TestSubject", "ActivityName"))
tbl_tidy <- dcast(tbl_melt, TestSubject + ActivityName ~ variable, mean)

write.table(tbl_tidy, "tbl_tidy.txt", row.names = FALSE)
