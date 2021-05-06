# R기반 통계학 p14
?cor

dm <- seq(1:5)
n_prd <- c(3,5,8,11,13)

cor(dm,n_prd)

# R기반 통계학 p25
# iris dataset
# 3가지 품종
data(iris)
head(iris)
str(iris)
class(iris)
#int: 정수형, num: 실수형

#mflow = c(2행,2열),mar(margine)
par(mflow=c(2,2), mar=c(1,1,1,1))
plot(iris[,-5]) #4개의 행 5번째는 species 정보

iris$Sepal.Length #key 값, column 단위
iris[,] # 행,열 index 접근
cor(iris[,-5])

#install.packages("corrplot")
library(corrplot)
data(iris)
iris_cor <- cor(iris[,-5])
corrplot(iris_cor, method = "circle")
corrplot(iris_cor, method = "ellipse")


