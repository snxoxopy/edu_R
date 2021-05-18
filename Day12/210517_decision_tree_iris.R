install.packages("rpart")
#party::ctre -> 노드에 적용되는 조건식이 실제로 의미가 있는지 적용되기때문에 신뢰도는 좋음 다만, 별도의 가지치기 필요없음 변량 31개 까지 지원

install.packages("C50")
library("C50")

#rparty 패키지 사용 실습1(분류모형)

#install.packages("caret", dependencies = TRUE, repos-'http://cran.rstudio.com/')
install.packages("caret", dependencies = TRUE)
library(caret)

# 분류형 데이터일 경우 학습 시 층화추출 (균등한 학습)
#caret lib를 이용해 위를 설정
idx <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)
?createDataPartition
iris_train <-  iris[idx,]
iris_test <-  iris[-idx,]
table(iris_train$Species)
# setosa versicolor  virginica 
# 35         35         35 
table(iris_test$Species)
# setosa versicolor  virginica 
# 15         15         15 

library(rpart)
rpart.result <- rpart(Species~., iris_train)

rpart.result
# n= 105 
# 
# node), split, n, loss, yval, (yprob); split= 조건, n= 총개수, loss=y가아닌거, 
# * denotes terminal node
# 
# 1) root 105 70 setosa (0.33333333 0.33333333 0.33333333)  # 35개가 setosa
#   2) Petal.Length< 2.45 35  0 setosa (1.00000000 0.00000000 0.00000000) * # 작은품종
#   3) Petal.Length>=2.45 70 35 versicolor (0.00000000 0.50000000 0.50000000)  #하위노드드
#     6) Petal.Width< 1.65 35  1 versicolor (0.00000000 0.97142857 0.02857143) *
#     7) Petal.Width>=1.65 35  1 virginica (0.00000000 0.02857143 0.97142857) * 
# 105개 중 2개가 학습 안됨?

plot(iris_train, iris_train$Species)
plot(rpart.result,margin=0.2)

#install.packages("rattle")
#install.packages("rpart.plot")
library(rattle)
library(rpart.plot)
library(RColorBrewer)

rpart.plot(rpart.result)

text(rpart.result,cex=0.8)

rpart.pred <- predict(rpart.result, iris_test, type="class")
#table(얘측치, 실측치)
table(rpart.pred, iris_test$Species)
              #실측치
# rpart.pred   setosa versicolor virginica
# 예측치
# setosa         15          0         0
# versicolor      0         14         3
# virginica       0          1        12

# fitting_rate
# 
# accuary
## 평가방법
## Test Data -> features -> 일반화 모형 -> 


#install.packages("e1071")
#library(e1071)
library(caret)
confusionMatrix(rpart.pred, iris_test$Species)
?confusionMatrix

# Confusion Matrix and Statistics
# 
# Reference
# Prediction   setosa versicolor virginica
# setosa         15          0         0
# versicolor      0         14         3
# virginica       0          1        12
# 
# Overall Statistics
# 
# Accuracy : 0.9111          
# 95% CI : (0.7878, 0.9752)
# No Information Rate : 0.3333          
# P-Value [Acc > NIR] : 8.467e-16       
# 
# Kappa : 0.8667          
# 
# Mcnemar's Test P-Value : NA              

# Statistics by Class:


# Class: setosa Class: versicolor Class: virginica
# Sensitivity                 1.0000            0.9333           0.8000
# Specificity                 1.0000            0.9000           0.9667
# Pos Pred Value              1.0000            0.8235           0.9231
# Neg Pred Value              1.0000            0.9643           0.9062
# Prevalence                  0.3333            0.3333           0.3333
# Detection Rate              0.3333            0.3111           0.2667
# Detection Prevalence        0.3333            0.3778           0.2889
# Balanced Accuracy           1.0000            0.9167           0.8833# 



