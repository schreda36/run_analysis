---
title: "CodeBook.md"
author: "Dan Schreck"
date: "June 7, 2016"
output: html_document
---

Codebook for wearable computing dataset
==================================

## Variables
For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables. (see features.txt)
- Its activity label. (see activity_labels.txt)
- An identifier of the subject who carried out the experiment. 


## Data
The data analyzed by run_analysis.R was are obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Use of this dataset in publications must be acknowledged by referencing the following publication [1]: 

      [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Further information about this data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.



## Transformation
The following transformation steps were followed:

1. Only the mean and standard deviation measurements, those with "mean()" and "std()" in the name, were extracted by use of a regex.

2. The activity descriptions from activity_labels.txt replaced the integers 1-6 obtained from y_train.txt and x_train.txt

3. The column names for each measurement was modified to comply with Tidy Data principles. For example:

      "tBodyAcc-mean()-X" was modified to "tbodyaccmeanx" 
      "tBodyAcc-mean()-Y" was modified to "tbodyaccmeany"
      "tBodyAcc-std()-X" was modified to "tbodyaccstdx", 
      etc., etc.

4. Finally, the mean of each variable by activity and subject was created and written to an output data file, tidy.run_anlysis.data.txt, is written locally in the last step of run_analysis.R. All the values are means, aggregated over 30 subjects and 6 activities, resulting in a 180 rows by 68 columns file.
