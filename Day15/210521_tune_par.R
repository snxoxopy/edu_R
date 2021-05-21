#install.packages("e1071")
#p209
library(e1071) #tune 함수 포함하는 lib.
result <- tune.svm(Species~., data=iris, gamma = 2^(-1:1), cost=2^(2:4))

# 여러번 반복

# Parameter tuning of ‘svm’:
#   
#   - sampling method: 10-fold cross validation 교차검증 -> dataset 중 9개 fold training, 1개 fold는 test/ 1개 fold를 training 9개 fold test
# 
# - best parameters:
#   gamma cost
#   0.5    4
# 
# - best performance: 0.05333333 

attributes(result)
result$best.parameters
# gamma cost
# 1   0.5    4
result$best.parameters["gamma"]
# gamma
# 1   0.5
result$best.parameters["cost"]
# cost
# 4

library(caret)
#층화 추출 7:3
idx <- createDataPartition(iris$Species, p=0.7, list=F)
iris_train <- iris[idx,]
iris_test <- iris[-idx,]

table(iris_train$Species) #각 35
table(iris_test$Species)  #각 15

#
library(kernlab)
svm.result <-  ksvm(Species~., iris_train, kernel="rbfdot")
svm.pred <- predict(svm.result, iris_test, type="response")
table(svm.pred, iris_test$Species)
confusionMatrix(svm.pred, iris_test$Species)

# Confusion Matrix and Statistics
# 
# Reference
# Prediction   setosa versicolor virginica
# setosa         15          0         0
# versicolor      0         14         1
# virginica       0          1        14
# 
# Overall Statistics
# 
# Accuracy : 0.9556          
# 95% CI : (0.8485, 0.9946)
# No Information Rate : 0.3333          
# P-Value [Acc > NIR] : < 2.2e-16       
# 
# Kappa : 0.9333          
# 
# Mcnemar's Test P-Value : NA              
# 
# Statistics by Class:
# 
#                      Class: setosa Class: versicolor Class: virginica
# Sensitivity                 1.0000            0.9333           0.9333 # 양성률
# Specificity                 1.0000            0.9667           0.9667 # 
# Pos Pred Value              1.0000            0.9333           0.9333 
# Neg Pred Value              1.0000            0.9667           0.9667
# Prevalence                  0.3333            0.3333           0.3333
# Detection Rate              0.3333            0.3111           0.3111
# Detection Prevalence        0.3333            0.3333           0.3333
# Balanced Accuracy           1.0000            0.9500           0.9500


# tune 함수에서 얻은 gamma, C로 모델을 생성
svm.result <-ksvm(Species~., iris_train, kernel="rbfdot", kpar=list(sigma=0.5), C=4, prob.model=TRUE)
# type = "response" -> 예측 범주, type = "probabilities" -> 예측 확률
svm.pred <- predict(svm.result, iris_test, type = "response")
table(svm.pred, iris_test$Species) # 분류결과도출
confusionMatrix(svm.pred, iris_test$Species) # 평가


