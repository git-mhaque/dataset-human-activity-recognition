ReadMe
==========================

This repository provides a script to create a tidy data set from the Samsung Human Activity Recognition data set.
The original data set can be downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Following three files are privided in this repository: 
* README.md
* run_analysis.R
* CodeBook.md


README.md
----------------
Explains the contents of the repository 

run_analysis.R
-----------------
The R script to create the tidy data set which work as follows:

* This code assumes that the Samsung data set is extraced in the working directory
* Test data is read from 3 different files and combined into a single data set
* Training data is read from 3 different files and combined into a single data set
* Both Test and Training data sets are combined into a larger data set
* All feature names are read
* The indices and names for the desired feature set are identified 
* A subset of the bigger data set is extracted based on the selected features  with original feature names 
* An additional column is added with descriptive activity names 
* A tidy data set is created with the average of each variable for each activity and each subject
* The names of the feature columns are simplified 
* Finally, the tidy data set is written to the current working directory

CodeBook.md
-----------------
A code book file explaining the variables of the tidy data set created by run_analysis.R   
