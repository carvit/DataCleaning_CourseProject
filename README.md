---
title: "README"
author: "Robert H."
date: "11/19/2016"
---

# Introduction

This is the *Getting and Cleaning Data* course project.

In the project directory you can find following files:

*  run_analysis.R - resulting script, which performs required functionality
*  CodeBook.md - the description of the getting and cleaning process
*  README.md - this README file

he main goal was to code the script which performs following tasks:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# The Process

## Reading the Data
* The script checks, if the target directory exists
* If the directory doesn't exist, it downloads the ZIP file from the corresponding URL and unzips it

## Reading the Codebook for Features and Activities
* There is the list of feature names and activity names in the experient
* The script reads each feature and activity into the data.frame
* In later processing, it will be used for assigning the descriptive names to the columns and to merging with the training and testing data.frame respectively

## Reading the Training and Testing Dataset
For each dataset, there are several files, that need to be read:

* subject IDs
* activity IDs
* measured data

In the *read.csv* command, you need to set the separator *sep* to *""*, which is interpreted as the whole whitespace as a single separator. If you don't do this, you end up with broken data.frame i.e there will be more than 561 columns.

In the next step, the column names will be substituted by descriptive variable names (point 4 of the assignemnt)

## Merging the Training and Testing Dataset

* the script binds the rows of the training and the testing dataset
* it adds new column which represents the activity ID of each observation (row)
* it adds another column of the subject ID of each observation
* then it merges this huge dataset with the codebook of the activities dataframe, so that the names of activities are added

## Extracting of mean and standard deviation variables
There are 561 measured variables for each observartion. We need to extract just few of them:

* in the first step the indexes of *ACTIVITY* and *SUBJECT_ID* column are found
* then the script uses the grep function to pick the indexes of each column with the std or mean in its name
* subsetting the dataset by the column indexes produces the required dataset

## Independant tidy data.set
Creating independant tidy data set is pretty straight forward thanks to dplyr package:

* take the data.set from the previous step
* group it by *ACTIVITY* and by *SUBJECT_ID*
* use *summarise_each* to count the average for each variable in the dataset
