library("dplyr")

#read all labels
labels.activities <- read.table("activity_labels.txt")
labels.features <- read.table("features.txt")

#extract only mean and std col
features_of_interest <- grep("mean|std", labels.features$V2)

#read all training data
train.features <- read.table("train/X_train.txt")
train.activities <- read.table("train/y_train.txt")
train.subjects <- read.table("train/subject_train.txt")

#read all test data
test.activities <- read.table("test/y_test.txt")
test.features <- read.table("test/X_test.txt")
test.subjects <- read.table("test/subject_test.txt")

#apply labels to columns
names(train.features) <- labels.features$V2
names(test.features) <- labels.features$V2
names(test.subjects) <- c("subject")
names(train.subjects) <- c("subject")
names(train.activities) <- c("activities")
names(test.activities) <- c("activities")

#filter only mean and std col
train.features <- train.features[features_of_interest]
test.features <- test.features[features_of_interest]

#combine the dataset
train.all <- bind_cols(train.subjects, train.activities, train.features)
test.all <- bind_cols(test.subjects, test.activities, test.features)
train.all <- mutate(train.all, datasettype="train")
test.all <- mutate(test.all, datasettype="test")
all.data <- bind_rows(train.all, test.all)

#apply factor to activities
all.data$activities<- factor(all.data$activities, levels=labels.activities$V1, labels=labels.activities$V2)

#result data
result<-aggregate(all.data[,3:81], by=list(subject=all.data$subject, activity=all.data$activities), FUN=mean)

write.table(result, file="mean_dataset.txt", row.names = FALSE)

