library(reshape2)

# Check for and create directory
if(!file.exists("./data")) {
    dir.create("./data")
}

# Download a file from the web
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCI HAR Dataset.zip")
dateDownloaded <- date()
unzip("./data/UCI HAR Dataset.zip", exdir = "./data")

# Load flat files
features <- read.table("./data/UCI HAR Dataset/features.txt", 
                       row.names = 1, stringsAsFactors = F)
activity_lavels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
                              row.names = 1, stringsAsFactors = F)
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Merge the training and the test sets
dataset <- rbind(X_train, X_test)
y <- c(y_train$V1, y_test$V1)
subject <- c(subject_train$V1, subject_test$V1)

# Label the data set with descriptive variable names
colnames(dataset) <- features$V2

# Extract only the measurements
# on the mean and standard deviation for each measurement
dataset <- dataset[, grep("mean\\(|std\\(", features$V2)]

# Use descriptive activity name
activity <- factor(activity_lavels$V2[y], levels = activity_lavels$V2)

# Create a independent tidy data set
dataset <- cbind(subject, activity, dataset)

# Create a second, independent tidy data set
# with the average of each variable for each activity and each subject
dataset_melt <- melt(dataset, id = c("subject", "activity"))
dataset_mean <- dcast(dataset_melt, subject + activity ~ variable, mean)

# Create a txt file
write.table(dataset_mean, "./dataset_mean.txt", row.names = F)