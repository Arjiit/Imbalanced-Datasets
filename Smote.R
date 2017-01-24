library(caret)
library(pROC)
library(DMwR)
library(caTools)
set.seed(1234)
data<-read.csv("../input/creditcard.csv")
data$Class<-factor(ifelse(data$Class==0,"0","1"))

splitIndex <- createDataPartition(data$Class, p = .70,
                                  list = FALSE,
                                  times = 1)
trainSplit <- data[ splitIndex,]
table(trainSplit$Class)
testSplit <- data[-splitIndex,]
table(testSplit$Class)


ctrl <- trainControl(method = "cv", number = 10)

trainSplit <- SMOTE(Class ~ ., trainSplit, perc.over = 200, perc.under=100)
table(trainSplit$Class)

trainSplit$Class<- as.numeric(trainSplit$Class)
tbmodel <- train(Class ~ ., data = trainSplit, method = "treebag",
                 trControl = ctrl)
                 
trainSplit$Class<-as.factor(trainSplit$Class)

predictors <- names(trainSplit)[names(trainSplit) != 'Class']
pred <- predict(tbmodel$finalModel, testSplit[,predictors])

auc <- roc(testSplit$Class, pred)
print(auc)

plot(auc, ylim=c(0,1), print.thres=TRUE, main=paste('AUC:',round(auc$auc[[1]],2)))
abline(h=1,col='blue',lwd=2)
abline(h=0,col='red',lwd=2)
