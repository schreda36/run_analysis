---
title: "README.md"
author: "Dan Schreck"
date: "June 7, 2016"
output: html_document
---

### Introduction
These instructions are for the Coursera assignment: Getting and Cleaning Data Course Project. In this repo you should find a code book named CodeBook.md that describes the variables, the data, and transformations or work performed to clean up the data and an R script called run_analysis.R. run_analysis.R will combined data from separate files to form a tidy data set.

The data set was collected from the accelerometers from the Samsung Galaxy S smartphone. Refer to the following site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Use of this dataset in publications must be acknowledged by referencing the following publication [1]: 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The script run_analysis.R performs the following functions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
