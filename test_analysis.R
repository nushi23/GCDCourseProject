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
colnames(Test_data1)<- c("subj_test","activity","y_test")
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

