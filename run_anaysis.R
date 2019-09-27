#first we open the zip file 
unzip("getdata_projectfiles_UCI HAR Dataset.zip")

#1.-Merge the training and the test sets to create one data set
#We set the current working directory to transform the txt files to data frames
setwd("~/CursoR/datasciencecoursera/curso3 Limpieza de datos/UCI HAR Dataset")
features<- read.table("features.txt")
activity_labels<- read.table("activity_labels.txt")
setwd("~/CursoR/datasciencecoursera/curso3 Limpieza de datos/UCI HAR Dataset/test")
X_test<- read.table("X_test.txt", col.names = features$V2)
y_test<- read.table("y_test.txt", col.names = "Activity")
#Now we set the working directory to transform the train txt files
setwd("~/CursoR/datasciencecoursera/curso3 Limpieza de datos/UCI HAR Dataset/train")
X_train<- read.table("X_train.txt", col.names = features$V2)
y_train<- read.table("y_train.txt", col.names = "Activity")
#Now we combine the data sets that we already create
X<- rbind(X_test, X_train)
Y<- rbind(y_test, y_train)
DS<- cbind(Y,X)
str(DS)
#We see that now the data frame is with 10299 observations (rows), and 562 variables
#2.-Extract only the measurements on the mean and standard deviation for each measurement
library(dplyr)
mean_sd_DS<- select(DS, contains("mean"), contains("std"))
str(mean_sd_DS)
#now we have a data frame with 102 observations and 86 variables
#3.-Use descriptive activity names to name the activities in the data set
Y$Activity<- activity_labels[Y$Activity, 2]
dataframe3<- cbind(Y, mean_sd_DS)
#We change the numbers from the Y data set to the names of the activities
#4.-Appropriately label the data set with descriptive variable names
#we aready did this when we read the txt files
colnames(dataframe3)
#5.-From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
tidydt<- dataframe3 %>% 
  group_by(Activity) %>% 
  summarise_all(mean)
#if we want to see the means for every subject separate for activity we can split the data frame for activity
a<- split(dataframe3, dataframe3$Activity)
#we know transform the final data set to txt file
write.table(tidydt, "tidydataset.txt", row.names = FALSE)
