# GCDCourseProject
Course Project files [Getting and Cleaning Data]
#Readme.md 
The following steps were following to obtain the Training Dataset named 'Train_data' 
1.  Reading in Training Data and storing the data into data frames
x_train : data frame for values from x-train.txt file 
y_train : data frame for values from x-train.txt file 
subj_train : data frame for values from subject_train.txt file 
2.  Reading in the data from the text files containing accelerometer and gyroscope output values:
body_acc_xtrain: data frame for x- axis values of body accelerometer output
body_acc_ytrain: data frame for y- axis values of body accelerometer output
body_acc_ztrain: data frame for z- axis values of body accelerometer output 
body_gyro_xtrain: data frame for x- axis values from body gyroscope output 
body_gyro_ytrain: data frame for y- axis values from body gyroscope output 
body_gyro_ztrain data frame for z- axis values from body gyroscope output  
total_acc_xtrain data frame for x- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ytrain data frame for y- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ztrain data frame for z- axis values from total accelerometer output (accelerometer + gravity) 
3. modified (shortened) descriptive Variable names for x_train data frame are listed in the var_names.txt file. 
4. Reading in the variable names for x_train data frame from var_names.txt
5. Assigning descriptive column names for x_train dataframe
6. reading in activity labels from activity_labels.txt
7. creating an empty vector named activity for activity names for each subject
8. Adding an character vector named activity with the activity label for each  row (as per y_train value (containg numbers representing each activity_label) )
9. combining Subject, Activity and y-train columns to form Train_data1
10.  Creating empty column name vectors for the variable names in the following datasets: 
body_acc_xtrain: data frame for x- axis values of body accelerometer output
body_acc_ytrain: data frame for y- axis values of body accelerometer output
body_acc_ztrain: data frame for z- axis values of body accelerometer output 
body_gyro_xtrain: data frame for x- axis values from body gyroscope output 
body_gyro_ytrain: data frame for y- axis values from body gyroscope output 
body_gyro_ztrain data frame for z- axis values from body gyroscope output  
total_acc_xtrain data frame for x- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ytrain data frame for y- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ztrain data frame for z- axis values from total accelerometer output (accelerometer + gravity) 
11. Assinging the column names for the columns in the following datasets
body_acc_xtrain: data frame for x- axis values of body accelerometer output
body_acc_ytrain: data frame for y- axis values of body accelerometer output
body_acc_ztrain: data frame for z- axis values of body accelerometer output 
body_gyro_xtrain: data frame for x- axis values from body gyroscope output 
body_gyro_ytrain: data frame for y- axis values from body gyroscope output 
body_gyro_ztrain data frame for z- axis values from body gyroscope output  
total_acc_xtrain data frame for x- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ytrain data frame for y- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ztrain data frame for z- axis values from total accelerometer output (accelerometer + gravity) 

12. Combinding the following datasets into 1 huge Training Dataset named 'Train_data'
Train_data1: containing Subject, Activity, y_train columns
body_acc_xtrain
body_acc_ytrain
body_acc_ztrain 
body_gyro_xtrain 
body_gyro_ytrain 
body_gyro_ztrain  
total_acc_xtrain 
total_acc_ytrain 
total_acc_ztrain 
x_train

The following steps were following to obtain the Training Dataset named 'Test_data' 
1.  Reading in testing Data and storing the data into data frames
x_test : data frame for values from x-test.txt file 
y_test : data frame for values from x-test.txt file 
subj_test : data frame for values from subject_test.txt file 
2. Reading in the data from the text files containing accelerometer and gyroscope output values:
body_acc_xtest: data frame for x- axis values of body accelerometer output
body_acc_ytest: data frame for y- axis values of body accelerometer output
body_acc_ztest: data frame for z- axis values of body accelerometer output 
body_gyro_xtest: data frame for x- axis values from body gyroscope output 
body_gyro_ytest: data frame for y- axis values from body gyroscope output 
body_gyro_ztest data frame for z- axis values from body gyroscope output  
total_acc_xtest data frame for x- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ytest data frame for y- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ztest data frame for z- axis values from total accelerometer output (accelerometer + gravity) 
3. modified (shortened) descriptive Variable names for x_test data frame are listed in the var_names.txt file. 
4. Reading in the variable names for x_test data frame from var_names.txt
5. Assigning descriptive column names for x_test dataframe
6. reading in activity labels from activity_labels.txt
7. creating an empty vector named activity for activity names for each subject
8. Adding an character vector named activity with the activity label for each  row (as per y_test value (containg numbers representing each activity_label) )
9. combining Subject, Activity and y-test columns to form Test_data1
10.  Creating empty column name vectors for the variable names in the following datasets: 
body_acc_xtest: data frame for x- axis values of body accelerometer output
body_acc_ytest: data frame for y- axis values of body accelerometer output
body_acc_ztest: data frame for z- axis values of body accelerometer output 
body_gyro_xtest: data frame for x- axis values from body gyroscope output 
body_gyro_ytest: data frame for y- axis values from body gyroscope output 
body_gyro_ztest data frame for z- axis values from body gyroscope output  
total_acc_xtest data frame for x- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ytest data frame for y- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ztest data frame for z- axis values from total accelerometer output (accelerometer + gravity) 
11. Assinging the column names for the columns in the following datasets
body_acc_xtest: data frame for x- axis values of body accelerometer output
body_acc_ytest: data frame for y- axis values of body accelerometer output
body_acc_ztest: data frame for z- axis values of body accelerometer output 
body_gyro_xtest: data frame for x- axis values from body gyroscope output 
body_gyro_ytest: data frame for y- axis values from body gyroscope output 
body_gyro_ztest data frame for z- axis values from body gyroscope output  
total_acc_xtest data frame for x- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ytest data frame for y- axis values from total accelerometer output (accelerometer + gravity) 
total_acc_ztest data frame for z- axis values from total accelerometer output (accelerometer + gravity) 

12. Combinding the following datasets into 1 huge testing Dataset named 'test_data'
Test_data1: containing Subject, Activity, y_test columns
body_acc_xtest
body_acc_ytest
body_acc_ztest 
body_gyro_xtest 
body_gyro_ytest 
body_gyro_ztest  
total_acc_xtest 
total_acc_ytest 
total_acc_ztest 
x_test

The final dataset named 'final_dataset' was then created: 
1. Datasets named 'Tran_data' and 'Test_data' are merged together

Using the final dataset, the following analysis activity was performed to create the final tidy dataset: 
1. Obtaining values of columns containing only the 'mean' values in a vector of indexes named 'mean_columns' 
2. Obtaining values of columns containing only the 'std' values in a vector of indexes named 'stdd_columns' 
3. extracting only the columns according to the two vectors (mean_columns, stdd_columns) to a dataset named 'extracted_data' 
4. Dataset 'extracted_data' was grouped by 'Subject' and 'Activity' to create a new dataset named 'grouped_data' 
5. All the rest of the columns were summarized by the mean values  per Subject and Activity variables
6. the final dataset is called 'summarized_data' 
