# KNN p169

data(iris)
library(caret)
idx <- createDataPartition(iris$Species, p=0.7, list=F) #층화추출
iris_train <- iris[idx,] # 70%
iris_test <- iris[-idx,] # 30%
table(iris_train$Species) # 35
table(iris_test$Species)  # 15

# install.packages("class")
library(class)
?knn
# label을 제거해야함
# cl target 영역
m1 <- knn(train=iris_train[,-5], cl= iris_train[,5], test= iris_test[,-5], k=5)
m1
# [1] setosa     setosa     setosa     setosa     setosa     setosa     setosa     setosa    
# [9] setosa     setosa     setosa     setosa     setosa     setosa     setosa     versicolor
# [17] versicolor versicolor versicolor versicolor versicolor versicolor versicolor versicolor
# [25] versicolor versicolor versicolor versicolor versicolor versicolor virginica  virginica 
# [33] virginica  virginica  virginica  virginica  virginica  virginica  virginica  virginica 
# [41] virginica  virginica  virginica  virginica  virginica 
# Levels: setosa versicolor virginica

# 군집화_연관규칙_분해법_knn

# install.packages("ggvis")
library(ggvis)
library(caret) # Confusion Matrix
library(tidyverse)
library(dplyr)

library(kernlab) # Surport Vector Machine
library(nnet) # Logistic regression, Neural Network
library(rpart) # Decision Tree
library(randomForest) # Random Forest
library(dplyr) # Data Handling
library(caret) # Confusion Matrix
library(DT) # Data Visualize
library(class) # KNN
library(ggvis) # Data visualize

?ggvis
iris %>% ggvis(~Petal.Length, ~Petal.Width, fill=~factor(Species)) %>% layer_points()
iris %>% ggvis(~Petal.Length,~Petal.Width, fill=~factor(Species)) %>% layer_points()

iris %>% 
  ggvis(~Petal.Length, ~Petal.Width, fill = ~factor(Species)) %>%
  layer_points()


install.packages("kknn")
library(kknn)
par(mar=c(2,2,2,2))
plot(Sepal.Length~Sepal.Width, 
     data=iris_train, 
     col=c("purple","blue","green")[iris_train$Species],
     main="KNN(k=3)")

set.seed(1234) 
knn_1 <- knn(train = train_x, test = valid_x, cl = train_y, k = 1)
set.seed(1234)
idx<-sample(1:NROW(iris),0.7*NROW(iris))
iris.train=iris[idx,]
iris.test=iris[-idx,]
iris_model<-knn(train=iris.train[,-5],
                test=iris.test[,-5],
                cl=iris.train$Species, k=3
)
summary(iris_model)
table(iris_model,iris.test$Species)

##-train 산점도 그리기
par(mar=c(2,2,2,2))
plot(Sepal.Length~Sepal.Width, 
     data=iris.train, 
     col=c("purple","blue","green")[iris.train$Species],
     main="KNN(k=3)")
#knn 예측치 결과 표시하기
points(Sepal.Length~Sepal.Width, 
       data=iris.train,
       pch=17,
       cex=1.2,
       col=c("purple","blue","green")[iris_model])
