# Preparation module, downloads, stores, unzips and checks the files in the local directory
# not necessary if files are stored and unziped locally
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,destfile="./datafiles/Dataset.zip")
  unzip(zipfile="./datafiles/Dataset.zip",exdir="./datafiles/")
  path_to_dir <- file.path("./datafiles" , "UCI HAR Dataset")
  files<-list.files(path_to_dir, recursive=TRUE)
  files
###############################################################################################
 
  
# START OF SECTION 1 ######################################
# This section merges the training and the test sets to create one data set.
# The following list explains data files to be merged. In both enviroments test and training
# the 3 elements that have to be combined in one data set are the variables Activity, 
# Features and Subject as described as following:
# - 'train/subject_train.txt': "Subject" who performed the activity.
# - 'train/X_train.txt': Training set = Training "Features"
# - 'train/y_train.txt': Training labels = Training "Activity"
# - 'test/X_test.txt': Test set = Test "Features"
# - 'test/y_test.txt': Test labels = Test "Activity"
# - 'test/subject_test.txt': "Subject" who performed the activity.

  # We read the Activity files
  
  ActivityTest  <- read.table(file.path(path_to_dir, "test" , "Y_test.txt" ), header = FALSE)
  ActivityTrain <- read.table(file.path(path_to_dir, "train", "Y_train.txt"), header = FALSE)
  
  # We read the Fearures files
  
  FeaturesTest  <- read.table(file.path(path_to_dir, "test" , "X_test.txt" ), header = FALSE)
  FeaturesTrain <- read.table(file.path(path_to_dir, "train", "X_train.txt"), header = FALSE)
  
  # We read the Subject files
  
  SubjectTrain <- read.table(file.path(path_to_dir, "train", "subject_train.txt"), header = FALSE)
  SubjectTest  <- read.table(file.path(path_to_dir, "test" , "subject_test.txt"), header = FALSE)
  
  # We merge the test and training data by rows into a new file for all 3 variables
  
  ActivityAll <- rbind(ActivityTest, ActivityTrain)
  FeaturesAll <- rbind(FeaturesTest, FeaturesTrain)
  SubjectAll  <- rbind(SubjectTest, SubjectTrain)
  
  # We give names to the variables "activity", "subject" and for Features we use the 2nd column
  # from the features.txt that contains all feature names.
  
  names(ActivityAll)<- c("activity")
  names(SubjectAll)<-c("subject")
  FeaturesNames <- read.table(file.path(path_to_dir, "features.txt"), head=FALSE)
  names(FeaturesAll) <- FeaturesNames$V2
  
  # Finally we merge all columns from the 3 files to one file (DataAll) with all data combined
  # as the section 1 askes for.
  
  DataAll <- cbind(cbind(ActivityAll, SubjectAll), FeaturesAll)
##################################### END OF SECTION 1 ###################################### 
  
  
# START OF SECTION 2 ######################################
# This section extracts only the measurements on the mean and standard deviation for each measurement.
# we take as a vector the feature names with mean() or std() context and then subset our combined data file.
  
  SubFeaturesNames <- FeaturesNames$V2[grep("(mean|std)\\(\\)", FeaturesNames$V2)]
  FilterForDataAll <- c("activity", "subject", as.character(SubFeaturesNames))
  DataAll <-subset(DataAll, select=FilterForDataAll)

##################################### END OF SECTION 2 ######################################
  
  
# START OF SECTION 3 ######################################
# This section uses descriptive activity names to name the activities in the data set.
# We make the activity a factor and name its levels according to the labels provided  
  
  ActivityLabels <- read.table(file.path(path_to_dir, "activity_labels.txt"),header = FALSE)
  DataAll$activity <- factor(DataAll$activity, labels = ActivityLabels[,2])
  
# Since we have no description about the subjects we can leave them as they are.

##################################### END OF SECTION 3 ######################################
  
  
# START OF SECTION 4 ######################################
# Appropriately labels the data set with descriptive variable names.
# We need to label the Features according to the description of each one:
  # t is replaced by time
  # Acc is replaced by Accelerometer
  # Gyro is replaced by Gyroscope
  # f is replaced by frequency
  # Mag is replaced by Magnitude
  # BodyBody is replaced by Body
  
  names(DataAll)<-gsub("^t", "time", names(DataAll))
  names(DataAll)<-gsub("^f", "frequency", names(DataAll))
  names(DataAll)<-gsub("Acc", "Accelerometer", names(DataAll))
  names(DataAll)<-gsub("Gyro", "Gyroscope", names(DataAll))
  names(DataAll)<-gsub("Mag", "Magnitude", names(DataAll))
  names(DataAll)<-gsub("BodyBody", "Body", names(DataAll))

##################################### END OF SECTION 4 ######################################
  
# START OF SECTION 5 ######################################
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
  
  library(plyr);
  TidyData<-aggregate(. ~subject + activity, DataAll, mean)
  TidyData<-TidyData[order(TidyData$subject,TidyData$activity),]
  write.table(TidyData, file = "averages_data.txt",row.name=FALSE)
  
##################################### END OF SECTION 5 ###################################### 
