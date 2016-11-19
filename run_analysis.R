library(plyr)
library(dplyr)

# download and extract dataset
if(!file.exists("UCI HAR Dataset")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","human_activity.zip")
  unzip("human_activity.zip")
}


#######################################################################
# read common definitions
# read features list
features <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, sep = "")
names(features) <- c("FEATURE_ID","FEATURE")
# read activity labels
# Checkpoint 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
names(activity_labels) <- c("ACTIVITY_ID","ACTIVITY")

#######################################################################
# read train set
#######################################################################
train_subjects <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
names(train_subjects) <- c("SUBJECT_ID")

train_x <- read.csv("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
# Checkpoint 4. Appropriately labels the data set with descriptive variable names.
names(train_x) <- features$FEATURE
train_y <- read.csv("UCI HAR Dataset/train/Y_train.txt", header = FALSE, sep = "")
names(train_y) <- c("ACTIVITY_ID")

#######################################################################
# read test set
test_subjects <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
names(test_subjects) <- c("SUBJECT_ID")

# separator must be set to "" i.e. whitespace between values
test_x <- read.csv("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
# Checkpoint 4. Appropriately labels the data set with descriptive variable names.
names(test_x) <- features$FEATURE
test_y <- read.csv("UCI HAR Dataset/test/Y_test.txt", header = FALSE, sep = "")
names(test_y) <- c("ACTIVITY_ID")

#######################################################################
# Checkpoint 1. Merges the training and the test sets to create one data set.

whole <- rbind(train_x,test_x)
whole$ACTIVITY_ID <- rbind(train_y,test_y)$ACTIVITY_ID
whole$SUBJECT_ID <- rbind(train_subjects, test_subjects)$SUBJECT_ID
whole <- merge(activity_labels,whole,by.x = "ACTIVITY_ID",by.y = "ACTIVITY_ID")

###########
# Checkpoint 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colnames <- names(whole)
# which_columns <- which(colnames == "ACTIVITY_ID")
which_columns <- which(colnames == "ACTIVITY")
which_columns <- append(which_columns, which(colnames == "SUBJECT_ID"))
which_columns <- append(which_columns, grep("[Mm]ean",colnames))
which_columns <- append(which_columns, grep("[Ss]td",colnames))
tidy <- whole[,which_columns]

#######################################################################
# Checkpoint 5.
summarized_tidy <- tidy %>% group_by(ACTIVITY, SUBJECT_ID) %>% summarise_each(funs(mean))


#######################################################################
# writing the resulting dataset to output file
write.table(summarized_tidy, file = "out.txt",  row.names = FALSE)




