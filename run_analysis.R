## run_analysis.R
## This code assumes that the Samsung data set is extraced in the working directory


library(reshape2)


## Test data is read from 3 different files and combined into a single data set

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_combined <- cbind(x_test, y_test, subject_test)


## Training data is read from 3 different files and combined into a single data set

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_combined <- cbind(x_train, y_train, subject_train)


## Both Test and Training data sets are combined into a larger data set

merged_data <- rbind(test_combined, train_combined)


## All feature names are read

all_features <- read.table("./UCI HAR Dataset/features.txt")


## The indices and names for the desired feature set are identified  

selected_feature_indices <- which(grepl("mean()|std()",all_features[,2]))
feature_names <- as.character(all_features[selected_feature_indices,2])
selected_feature_indices <- c(selected_feature_indices, ncol(x_test) + 1, ncol(x_test) + 2 )
feature_names <- c(feature_names, "activity_code","subject")


## A subset of the bigger data set is extracted based on the selected features  with original feature names 

extracted_data <- merged_data[,selected_feature_indices]
names(extracted_data) <- feature_names


## An additional column is added with descriptive activity names 

activity_info <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_info) <- c("activity_code","activity") 
extracted_data$activity <-  activity_info[match(extracted_data$activity_code, activity_info$activity_code), 'activity']

## A tidy data set is created with the average of each variable for each activity and each subject
molten <- melt(extracted_data, id = c("subject", "activity"), measure.vars=c(1:79))  
tidy_data <- dcast(molten, subject + activity ~ variable, mean )

## The names of the feature columns are simplified 
column_names <- names(tidy_data)
column_names <- gsub("-","",column_names)
column_names <- gsub("\\(\\)","",column_names)
names(tidy_data) <- column_names

## Finally, the tidy data set is written to the current working directory
write.table(tidy_data,file="./tidy_data_set.csv",append=F,sep=",",row.names=F)







