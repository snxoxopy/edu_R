# Logistic Regression p1
## 선형회귀에서 얻은 y = wx + b by 최소거리제곱
## logit 함수에 적용했을 때의 값과 일치하는 w, b를 구하는 것
## log(y) -> [0,1]
## classification으로 분류되는 이유

## randomforest와 차이는 w, b에 대한 선형 회귀 분석이 가능

data(iris)
?data

library(aod)
library(ggplot2)
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)




summary(mydata)
str(mydata)

# 'data.frame':	400 obs. of  4 variables:
#   $ admit: int  0 1 1 1 0 1 1 0 1 0 ...
# $ gre  : int  380 660 800 640 520 760 560 400 540 700 ...
# $ gpa  : num  3.61 3.67 4 3.19 2.93 3 2.98 3.08 3.39 3.92 ...
# $ rank : Factor w/ 4 levels "1","2","3","4": 3 3 1 4 4 2 1 2 3 2 ...

sapply(mydata,sd)
xtabs(~admit+rank, data=mydata)
mydata$rank <- factor(mydata$rank)
?glm

mylogit <-  glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
# glm은 범주형 종속변수를 다룬다. (자체적으로 범주형으로 간주)
# 독립변수는 연속형 or 범주형 -> 자동으로 바꾸지 못함
# 따라서, rank는 범주형으로 변환한다.



summary(mylogit)

# Call:
#   glm(formula = admit ~ gre + gpa + rank, family = "binomial", 
#       data = mydata)
# 
# Deviance Residuals: 
#   Min       1Q   Median       3Q      Max  
# -1.6268  -0.8662  -0.6388   1.1490   2.0790  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept) -3.989979   1.139951  -3.500 0.000465 ***
#   gre          0.002264   0.001094   2.070 0.038465 *  
#   gpa          0.804038   0.331819   2.423 0.015388 *  
#   rank2       -0.675443   0.316490  -2.134 0.032829 *  
#   rank3       -1.340204   0.345306  -3.881 0.000104 ***
#   rank4       -1.551464   0.417832  -3.713 0.000205 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 499.98  on 399  degrees of freedom
# Residual deviance: 458.52  on 394  degrees of freedom
# AIC: 470.52
# 
# Number of Fisher Scoring iterations: 4

## 
# weigtf는 ㅈㅇ규화 과정이 반영됨
# 기울기를 의미하는 w값은 deltay/delyax로 의해
# 정규화과정이 되었다는 의미는 deltax가 1 즉, delta y를 의미한다.


coef(mylogit)
# (Intercept)          gre          gpa        rank2 
# -3.989979073  0.002264426  0.804037549 -0.675442928 
# rank3        rank4 
# -1.340203916 -1.551463677 

exp(coef(mylogit))
# (Intercept)         gre         gpa       rank2 
# 0.0185001   1.0022670   2.2345448   0.5089310 
# rank3       rank4 
# 0.2617923   0.2119375 

# 범주형에 대한 계수 해석
# rank2 는 rank1에 비하여
# rank2는 rank1보다 실패할 확률이 높다.
# 

## iris data 해석

data(iris)
?iris
?glm
summary(iris$Species)
str(iris)

# 종속변수=label=(범주형)Species
# 독립변수 = -Species
# 'data.frame':	150 obs. of  5 variables:
#   $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
# $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
# $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
# $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
# $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

library(dplyr)
df_iris_subset <- iris %>% 
  filter(Species == "versicolor" | Species == "virginica")

# versicolor일 경우 1, virginica일 경우 0
df_iris_subset$Species <- ifelse(df_iris_subset$Species == "versicolor", 1, 0)
df_iris_subset$Species <- factor(df_iris_subset$Species)


str(df_iris_subset)
summary(df_iris_subset)

# 문제정의: versicolor와 virginica일 확률 비율을 구하여라
# 탐색: logit 함수 이용
mylogit_iris <- glm(Species ~., data = df_iris_subset, family = "binomial")
mylogit_iris
# Call:  glm(formula = Species ~ ., family = "binomial", data = df_iris_subset)
# 
# Coefficients:
#   (Intercept)  Sepal.Length   Sepal.Width  Petal.Length   Petal.Width  
# 42.638         2.465         6.681        -9.429       -18.286  
# 
# Degrees of Freedom: 99 Total (i.e. Null);  95 Residual
# Null Deviance:	    138.6 
# Residual Deviance: 11.9 	AIC: 21.9
# 
summary(mylogit_iris)

# Call:
#   glm(formula = Species ~ ., family = "binomial", data = df_iris_subset)
# 
# Deviance Residuals: 
#   Min        1Q    Median        3Q       Max  
# -1.78065  -0.00677   0.00001   0.00541   2.01105  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)  
# (Intercept)    42.638     25.707   1.659   0.0972 .
# Sepal.Length    2.465      2.394   1.030   0.3032  
# Sepal.Width     6.681      4.480   1.491   0.1359  
# Petal.Length   -9.429      4.737  -1.991   0.0465 *
#   Petal.Width   -18.286      9.743  -1.877   0.0605 .
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 138.629  on 99  degrees of freedom
# Residual deviance:  11.899  on 95  degrees of freedom
# AIC: 21.899
# 
# Number of Fisher Scoring iterations: 10# 

# 위 결과 Petal.Length가 Species를 구분하는 유의미한 독립변수이다.
# 이유: 귀무가설을 기각 (차이가 있음을 확인)

# 
# 독립변수 Sepal, Petal에 대해 각 계수를 구한 결과는 위와 같다.
# \hat(y) -> 종을 구분한 결과의 1로 분류할 확률/0으로 분류할 확률
# log(\hat(y)) = wx_i + b
# x_i: 독립변수의 벡터
# 이때, w는 선형회귀식의 기울기로 delta_y -> \hat{y}의 단위 변화량를 의미한다.

coef(mylogit_iris)

# (Intercept) Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 42.637804     2.465220     6.680887    -9.429385   -18.286137 
# log(P(\hat(y))/P(1-\hat(y))) = wx_i + b

exp(coef(mylogit_iris))
# (Intercept) Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
# 3.291265e+18 1.176607e+01 7.970258e+02 8.032857e-05 1.144015e-08 

# P(\hat(y))/P(1-\hat(y)) = exp(wx_i + b)
# 각 계수는 나머지 독립변수의 값이 고정된 상수 값(회귀식에 영향을 미치지 않음)으로 간주하여 얻은 계수이다.
# 독립변수 petal.Length는 1-P(\hat(y)) 가 높은 것으로 Species를 구분할 유의미한 독립변수이다.

# Petal.Length로 logistic regression 재수행
mylogit_iris <- glm(Species ~ Petal.Length, data = df_iris_subset, family = "binomial")
summary(mylogit_iris)
# 
# Call:
#   glm(formula = Species ~ Petal.Length, family = "binomial", data = df_iris_subset)
# 
# Deviance Residuals: 
#   Min        1Q    Median        3Q       Max  
# -2.57260  -0.05865   0.00009   0.12758   2.11738  
# 
# Coefficients:
#   Estimate Std. Error z value Pr(>|z|)    
# (Intercept)    43.781     11.110   3.941 8.12e-05 ***
#   Petal.Length   -9.002      2.283  -3.943 8.04e-05 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# (Dispersion parameter for binomial family taken to be 1)
# 
# Null deviance: 138.629  on 99  degrees of freedom
# Residual deviance:  33.432  on 98  degrees of freedom
# AIC: 37.432
# 
# Number of Fisher Scoring iterations: 8
coef(mylogit_iris)
exp(coef(mylogit_iris))
# (Intercept) Petal.Length 
# 1.032278e+19 1.231638e-04 

# 독립변수 petal.Length는 1보다 작은 값 -> 확률 1-P(\hat(y))가 높다.
# Species를 구분할 유의미한 독립변수이다.

summary(df_iris_subset$Species)
summary(df_iris_subset$Petal.Length)

est_py <- (1.231638e-04 * df_iris_subset$Petal.Length + 1.032278e+19)/(1 + (1.231638e-04 * df_iris_subset$Petal.Length + 1.032278e+19))
est_1_py <- 1 - est_py
est_1_py

est_py <- 1.231638e-04 * df_iris_subset$Petal.Length

plot(df_iris_subset$Petal.Length, est_py)

?plot

abline(coef(exp(coef(mylogit_iris))))
?abline
       