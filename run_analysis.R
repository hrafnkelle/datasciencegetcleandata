download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip",destfile="UCIHARDataset.zip",mode="wb")
unzip("UCIHARDataset.zip")

library(dplyr)

# read data
train<-tbl_df(read.table('UCI HAR Dataset/train/X_train.txt'))
train_act<-tbl_df(read.table('UCI HAR Dataset/train/y_train.txt'))
train_subject<-tbl_df(read.table('UCI HAR Dataset/train/subject_train.txt'))
test<-tbl_df(read.table('UCI HAR Dataset/test/X_test.txt'))
test_act<-tbl_df(read.table('UCI HAR Dataset/test/y_test.txt'))
test_subject<-tbl_df(read.table('UCI HAR Dataset/test/subject_test.txt'))
features<-read.table('UCI HAR Dataset/features.txt')
activity<-read.table('UCI HAR Dataset/activity_labels.txt')

# Create factor vector (since the activty is a categorical variable) for the train/test set combined
full_act<-as.factor(c(train_act$V1, test_act$V1))
# Create factor vector (since the subject is a categorical variable) for the train/test set combined
full_subject<-as.factor(c(train_subject$V1, test_subject$V1))

# create a combined dataset from the train and test tables
full<-rbind_list(train,test)

# We assume the features wanted are those with a mean or std in their name in the features name vector.
# Now find (grep) the column indices for mean and std features using and extract (using select) a 
# table only with those features
meanIdx<-grep("mean",features[,2])
stdIdx<-grep("std",features[,2])

# fix the names of the mean/std features so they make good R names
meanFeatureNames<-gsub("-","_",gsub("()","",as.character(features[meanIdx,2]),fixed=TRUE))
stdFeatureNames<-gsub("-","_",gsub("()","",as.character(features[stdIdx,2]),fixed=TRUE))

# Set factor names to the activity factor
levels(full_act)<-activity$V2

# dplyr transformation of the extracted
output<-full %>% 
        select(c(meanIdx,stdIdx)) %>%                        # select only the mean/std columns
	      mutate(activity=full_act, subject=full_subject) %>%  # add the activty and subject columns
		    group_by(subject,activity) %>%                       # group the observations by subject and activty
		    summarise_each(funs(mean))                           # so we can summarize each feature by subject and activity

colnames(output)<-c("subject","activity",meanFeatureNames,stdFeatureNames)

# finally we write out the data in a tidy format
write.table(output, file="tidy.txt",row.name=FALSE)
