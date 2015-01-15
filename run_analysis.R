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
full<-rbind_list(train,test)
full_act<-as.factor(c(train_act$V1, test_act$V1))
full_subject<-as.factor(c(train_subject$V1, test_subject$V1))
features<-read.table('UCI HAR Dataset/features.txt')
activity<-read.table('UCI HAR Dataset/activity_labels.txt')


# find column indices for mean and std features and extract a table only with those features
meanIdx<-grep("mean",features[,2])
stdIdx<-grep("std",features[,2])
extract<-select(full, c(meanIdx,stdIdx))


# fix the names of the mean/std features so they make good R names
meanFeatureNames<-gsub("-","_",gsub("()","",as.character(features[meanIdx,2]),fixed=TRUE))
stdFeatureNames<-gsub("-","_",gsub("()","",as.character(features[stdIdx,2]),fixed=TRUE))
colnames(extract)<-c(meanFeatureNames,stdFeatureNames)

# add the activity and subject to each row of features
levels(full_act)<-activity$V2
extract1<-mutate(extract, activity=full_act, subject=full_subject)

output<-extract1 %>% group_by(subject,activity) %>% summarise_each(funs(mean))

write.table(output, file="tidy.txt",row.name=FALSE)
