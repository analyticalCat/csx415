
#This file shall only be run after the loaddata.r because it assumes the dataframe mydata is loaded and clean with 9 columns

#split the data to training set and testing set (75/25)
library(caret)
# set.seed(123)
# indexes<-createDataPartition(mydata$y, p=.75, list=FALSE)
# or
indexes = sample(1:nrow(mydata), size=0.25*nrow(mydata))
test <- mydata[indexes,]
train <- mydata[-indexes,]

#######################################################################
#Run algorithms
#1. linear regression
mydata.glm<-glm(y~.,data=mydata, family=binomial)
summary(mydata.glm)

#typeof(train.model) == list
test_x<-test
test_x$y<-NULL
train.glm<-glm(y~.,data=train, family=binomial)
train.glm.predictions<-predict(train.glm, test_x, type="response")
train.glm.predictions.f<-as.factor(ifelse(train.glm.predictions>0.5, 'yes','no'))
train.glm.cfMatrix<-confusionMatrix(train.glm.predictions.f, test$y)

library('pROC')
#plot(roc(test$y, train.glm.predictions)) # saved to graphs directory as glm_ROC.
#####################################################################################3

#random forest

library("randomForest")
library("caret")
train.rf<-randomForest(y~., data=train, importance=TRUE)
train.rf.predictions<-predict(train.rf, test_x, type="prob")
train.rf.predictions.f<-predict(train.rf, test_x, type="response")
train.rf.cfMatrix<-confusionMatrix(train.rf.predictions.f, test$y)
plot(roc(test$y, train.rf.predictions[,2]))

#####################################################################################3

#use svm
library(e1071)

train.svm<- svm(y ~ . , train, probabilities=TRUE)
train.svm.predictions.f <- predict(train.svm, test_x)
train.svm.predictions<-attr(train.svm.predictions.f,"probabilities")
train.svm.cfMatrix<-confusionMatrix(train.svm.predictions.f, test$y)
print(nrow(test$y))
print(nrow(train.svm.predictions[,2]))
plot(roc(test$y, train.svm.predictions[,2]))

#####################################################################################3

#combine all three plots
plot(roc(test$y, tratrain.svm.predictions[,2]), col="red", main="ROC Comparison")
lines(roc(test$y, train.randomForest.predictions[,2]), col="blue")
lines(roc(test$y, train.svm.predictions[,2]), col="green")



