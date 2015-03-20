# Load the data
X_train <- read.table("../UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("../UCI HAR Dataset/train/y_train.txt", quote="\"")

X_test <- read.table("../UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("../UCI HAR Dataset/test/y_test.txt", quote="\"")

features <- read.table("../UCI HAR Dataset/features.txt", quote="\""
activity_labels <- read.table("../UCI HAR Dataset/activity_labels.txt", quote="\"")

# Rename the columns to show proper variable names
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2

# map the activities vectors test_y and train_y to string labels and add them to the sets as a column
activities_test <- factor(y_test$V1,levels = activity_labels$V1,labels = activity_labels$V2)
activities_train <- factor(y_train$V1,levels = activity_labels$V1,labels = activity_labels$V2)
X_test[["Activity"]] <- activities_test
X_train[["Activity"]] <- activities_train

# Merge the training and the test sets to create one data set.
merged_set <- rbind(X_train, X_test)

# Extract only the measurements on the mean and standard deviation for each measurement. Also keep the Activity description column
extracted_set <- merged_set[,grep("mean()|std()|Activity",names(merged_set))]

# create a second, independent tidy data set with the average of each variable (except Activity which is a factor) for each activity.
tidy_summarized_data <- aggregate(extracted_set[grep("Activity",names(extracted_set), invert = TRUE)], by=extracted_set["Activity"], FUN=mean)

write.table(tidy_summarized_data, file = "tidy.txt", row.name=FALSE)