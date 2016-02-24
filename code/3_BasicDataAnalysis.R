########################################
#Start of SECTION 3.2
########################################

#Set the working directory for the project

setwd("~/Documents/ML_with_R/MachineLearning_with_R/")

#Install readr package
install.packages("readr")

#Load the readr package
library(readr)

?read_csv

#Load train and test dataset
train <- read_csv("data/train.csv")
test <- read_csv("data/test.csv")

#Find the number of rows and columns train
nrow(train)
ncol(train)

#### Start of Exercise ####
#Exercise: Find number of rows and columns in test

#### End of Exercise ####

#Column type for train
lapply(train, class)


#### Start of Exercise ####
#Exercise: Find column type for test

#### End of Exercise ####

#Finding if the train dataset has null values or not

#Method 1
apply(is.na(train), 2, any)
#Method 2
colnames(train)[colSums(is.na(train))>0]

#Building method 2 bit-by-bit:
is.na(train)
is.na(train)>0
colSums(is.na(train))>0
colnames(train)[colSums(is.na(train))>0]


#### Start of Exercise ####
#Exercise: Find if test dataset has missing values

#### End of Exercise ####


#Summary statistics
summary(train)

#count frequencies for character columns
table(train$job)

#% frequencies for character columns
table(train$job)/nrow(train)*100

#### Start of Exercise ####
#Exercise: Find frequencies for job in test

#### End of Exercise ####

#### Start of Exercise ####
#Exercise: Find frequencies for marital status in train and test

#### End of Exercise ####

#Plotting numeric columns
plot(train$age)

#### Start of Exercise ####
#Exercise: Plot for another numeric column

#### End of Exercise ####

#Plot of age Vs balance
plot(train$age, train$balance)


#Do one-hot encoding on categorical variables

#Demonstrating oneHot Encoding

oneHotTest <- data.frame(cbind(1:4, c("A","B","B","C"), c("B","B","B","A")))

install.packages("caret")
library(caret)

ontHotEncodedTest <- predict(dummyVars(X1 ~., data=oneHotTest), oneHotTest)


#OneHot encoding of train and test dataset
oneHotEncodeModel <- dummyVars(deposit ~ . , data=train)
trainUpdated <- predict(oneHotEncodeModel, newdata=train)
testUpdated <- predict(oneHotEncodeModel, newdata=test)

########################################
#End of SECTION 3.2
########################################
