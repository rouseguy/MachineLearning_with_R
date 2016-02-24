#This code will create the train and test datasets 
#from the source UCI bank marketing dataset

library(dplyr)

#Read the input file
input <- read.csv("~/Documents/ML_with_R/data/bank_marketing.csv")
#Add an index - to uniquely identify each row
input$index <- c(1:nrow(input))


#Create train and test. Test will have 10,000 rows
test <- input %>% group_by(deposit) %>%
  sample_frac(0.22117)

train <- input[!(input$index %in% test$index), ]

#Remove the index
train <- train[, -18]
test <- test[, -18]


#Save the train and test dataset
write.csv(train, "~/Documents/ML_with_R/data/train.csv", row.names=F)
write.csv(test, "~/Documents/ML_with_R/data/test.csv", row.names=F)