library(dplyr)

######################################################################## TRAINING DATA ###############################################################################

#Reading in Training Data
x_train= read.table("./UCI HAR Dataset/train/X_train.txt")
y_train= read.table("./UCI HAR Dataset/train/y_train.txt")
subj_train= read.table("./UCI HAR Dataset/train/subject_train.txt")

#Reading in Results data from accelometer (xyz), gyroscope(x,y,z) and total acceleration(x,y,z) 
body_acc_xtrain= read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_ytrain= read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_ztrain= read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_xtrain= read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_ytrain= read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_ztrain= read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_xtrain= read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_ytrain= read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_ztrain= read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

#reading in the variable names for x_train data: 
varNames_xtrain= read.table("./UCI HAR Dataset/var_names.txt")
#assigning variable names to x_train columns
colnames(x_train)<- varNames_xtrain$V2

#reading data for activity labels
activity_files= read.table("./UCI HAR Dataset/activity_labels.txt")

#length of y_train data file
len_y<- length(y_train$V1)

#creating a new vector for activity names

activity <- vector(mode="character", length = len_y)

#assigning activity names as per document activity_labels
for ( i in 1:len_y){
  if (y_train[i,]==1){activity[i]<- "walk"}
  else if (y_train[i,]==2){activity[i]<- "walk_up"}
  else if (y_train[i,]==3){activity[i]<- "walk_down"}
  else if (y_train[i,]==4){activity[i]<- "sit"}
  else if (y_train[i,]==5){activity[i]<- "stand"}
  else if (y_train[i,]==6){activity[i]<- "lay"}
  
}

#combining columns for training subjects, activity labels and y_train data(containing activity labels)
Train_data1<- cbind(subj_train,activity,y_train)
colnames(Train_data1)<- c("subject","activity","y")
body_info_length<- dim(body_acc_xtrain)

#creating empty vectors for column names of datasets(accelometer and gryroscope outputs)
col_names_bodyaccXtrain<- vector(mode="character", length = body_info_length[2])
col_names_bodyaccYtrain<- vector(mode="character", length = body_info_length[2])
col_names_bodyaccZtrain<- vector(mode="character", length = body_info_length[2])
col_names_bodygyroXtrain<- vector(mode="character", length = body_info_length[2])
col_names_bodygyroYtrain<- vector(mode="character", length = body_info_length[2])
col_names_bodygyroZtrain<- vector(mode="character", length = body_info_length[2])
col_names_totalaccXtrain<- vector(mode="character", length = body_info_length[2])
col_names_totalaccYtrain<- vector(mode="character", length = body_info_length[2])
col_names_totalaccZtrain<- vector(mode="character", length = body_info_length[2])

#assigning variable names for the all the columns in the datasets pertaining to accelorometer and gyroscope data outputs
for (i in 1:body_info_length[2]){
  col_names_bodyaccXtrain[i]<- paste("bax",i,sep = "")
  col_names_bodyaccYtrain[i]<- paste("bay",i,sep = "")
  col_names_bodyaccZtrain[i]<- paste("baz",i, sep = "")
  col_names_bodygyroXtrain[i]<- paste("bgx",i,sep = "")
  col_names_bodygyroYtrain[i]<- paste("bgy",i,sep = "")
  col_names_bodygyroZtrain[i]<- paste("bgz",i,sep = "")
  col_names_totalaccXtrain[i]<- paste("tax",i,sep = "")
  col_names_totalaccYtrain[i]<- paste("tay",i,sep = "")
  col_names_totalaccZtrain[i]<- paste("taz",i,sep = "")
}

colnames(body_acc_xtrain)<- col_names_bodyaccXtrain
colnames(body_acc_ytrain)<- col_names_bodyaccYtrain
colnames(body_acc_ztrain)<- col_names_bodyaccZtrain
colnames(body_gyro_xtrain)<- col_names_bodygyroXtrain
colnames(body_gyro_ytrain)<- col_names_bodygyroYtrain
colnames(body_gyro_ztrain)<- col_names_bodygyroZtrain
colnames(total_acc_xtrain)<- col_names_totalaccXtrain
colnames(total_acc_ytrain)<- col_names_totalaccYtrain
colnames(total_acc_ztrain)<- col_names_totalaccZtrain

#combining Train Data1 dataframe with the Accelometer, Gyroscope, total output datasets, X- training dataset to make 1 huge dataset for Training data
Train_data<- cbind(Train_data1, body_acc_xtrain,body_acc_ytrain,body_acc_ztrain,body_gyro_xtrain,body_gyro_ytrain,body_gyro_ztrain,total_acc_xtrain,total_acc_ytrain,total_acc_ztrain, x_train)

######################################################################## TEST DATA ######################################################################################
library(dplyr)

#Reading in testing Data
x_test= read.table("./UCI HAR Dataset/test/X_test.txt")
y_test= read.table("./UCI HAR Dataset/test/y_test.txt")
subj_test= read.table("./UCI HAR Dataset/test/subject_test.txt")

#Reading in Test Results data from accelometer (xyz), gyroscope(x,y,z) and total acceleration(x,y,z) 
body_acc_xtest= read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_ytest= read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_ztest= read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_xtest= read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_ytest= read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_ztest= read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_xtest= read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_ytest= read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_ztest= read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

#reading in the variable names for x_test data: 
varNames_xtest= read.table("./UCI HAR Dataset/var_names.txt")
#assigning variable names to x_test columns
colnames(x_test)<- varNames_xtest$V2

#reading data for activity labels
activity_files= read.table("./UCI HAR Dataset/activity_labels.txt")

#length of y_test data file
len_y<- length(y_test$V1)

#creating a new vector for activity names

activity <- vector(mode="character", length = len_y)

#assigning activity names as per document activity_labels
for ( i in 1:len_y){
  if (y_test[i,]==1){activity[i]<- "walk"}
  else if (y_test[i,]==2){activity[i]<- "walk_up"}
  else if (y_test[i,]==3){activity[i]<- "walk_down"}
  else if (y_test[i,]==4){activity[i]<- "sit"}
  else if (y_test[i,]==5){activity[i]<- "stand"}
  else if (y_test[i,]==6){activity[i]<- "lay"}
  
}

#combining columns for testing subjects, activity labels and y_test data(containing activity labels)
Test_data1<- cbind(subj_test, activity, y_test)
colnames(Test_data1)<- c("subject","activity","y")
body_info_length<- dim(body_acc_xtest)

#creating empty vectors for column names of datasets(accelometer and gryroscope outputs)
col_names_bodyaccXtest<- vector(mode="character", length = body_info_length[2])
col_names_bodyaccYtest<- vector(mode="character", length = body_info_length[2])
col_names_bodyaccZtest<- vector(mode="character", length = body_info_length[2])
col_names_bodygyroXtest<- vector(mode="character", length = body_info_length[2])
col_names_bodygyroYtest<- vector(mode="character", length = body_info_length[2])
col_names_bodygyroZtest<- vector(mode="character", length = body_info_length[2])
col_names_totalaccXtest<- vector(mode="character", length = body_info_length[2])
col_names_totalaccYtest<- vector(mode="character", length = body_info_length[2])
col_names_totalaccZtest<- vector(mode="character", length = body_info_length[2])

#assigning variable names for the all the columns in the datasets pertaining to accelorometer and gyroscope data outputs
for (i in 1:body_info_length[2]){
  col_names_bodyaccXtest[i]<- paste("bax",i,sep = "")
  col_names_bodyaccYtest[i]<- paste("bay",i,sep = "")
  col_names_bodyaccZtest[i]<- paste("baz",i, sep = "")
  col_names_bodygyroXtest[i]<- paste("bgx",i,sep = "")
  col_names_bodygyroYtest[i]<- paste("bgy",i,sep = "")
  col_names_bodygyroZtest[i]<- paste("bgz",i,sep = "")
  col_names_totalaccXtest[i]<- paste("tax",i,sep = "")
  col_names_totalaccYtest[i]<- paste("tay",i,sep = "")
  col_names_totalaccZtest[i]<- paste("taz",i,sep = "")
}

colnames(body_acc_xtest)<- col_names_bodyaccXtest
colnames(body_acc_ytest)<- col_names_bodyaccYtest
colnames(body_acc_ztest)<- col_names_bodyaccZtest
colnames(body_gyro_xtest)<- col_names_bodygyroXtest
colnames(body_gyro_ytest)<- col_names_bodygyroYtest
colnames(body_gyro_ztest)<- col_names_bodygyroZtest
colnames(total_acc_xtest)<- col_names_totalaccXtest
colnames(total_acc_ytest)<- col_names_totalaccYtest
colnames(total_acc_ztest)<- col_names_totalaccZtest

#combining Test Data dataframe with the Accelometer, Gyroscope, total output datasets, X- testing dataset to make 1 huge dataset for Test data
Test_data<- cbind(Test_data1, body_acc_xtest,body_acc_ytest,body_acc_ztest,body_gyro_xtest,body_gyro_ytest,body_gyro_ztest,total_acc_xtest,total_acc_ytest,total_acc_ztest, x_test)

##########################################################################################################################################################################

# Merging final dataset
final_dataset<- rbind(Train_data, Test_data)

#columns containing mean values of data
mean_columns<- grep("mean$",names(final_dataset))

#columns containing std deviation values of data
stdd_columns<- grep("std$",names(final_dataset))

#extracting only the mean and std deviation mesurements 
subj_activity<- data.frame(final_dataset$subject, final_dataset$activity)
colnames(subj_activity)<-c("subject", "activity")
extracted_data<- cbind(subj_activity, final_dataset[,mean_columns],final_dataset[,stdd_columns])

#grouping data by Subject and Activity 
grouped_data<- group_by(extracted_data, subject, activity)

#Summarizing Data by Subject and Activity group
summarized_data<- summarize_each(extracted_data, funs(mean))

write.table(summarized_data, file= "summarized_data", append = FALSE, sep = " ",row.names = FALSE ,col.names = TRUE)
