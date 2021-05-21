#p207

install.packages("kernlab")
library(kernlab)
m = ksvm(Species~., data=iris)#가우시앆 커널을 기본으로 사용한다.
m

# 가우시안분포의 특징
# 평균에 가장 많은 샘플을 분포하게 한다.
# 가우시안 커널 모형에 사상 시 , 통계적으로 빈도수가 높은 것이 평균이 되어
# 차원 변환 정보를 통계학적으로 유지하면서 고차원으로 사상시킬 수 있다.

# Support Vector Machine object of class "ksvm" 
# 
# SV type: C-svc  (classification) 
# parameter : cost C = 1 -> 얼마나 많은 데이터 샘플이 다른 클래스에 놓이는 것을 허용하는지를 결정
# c가 낮은경우 일반적은 평면 찾음 -> 이상치 포함 확률 높음
# c가 높은경우 샘플이 다른 클래스에 놓을 확률을 낮춘다. -> 이상치 존재 가능성이 낮음
# 
# Gaussian Radial Basis kernel function. 
# Hyperparameter : sigma =  0.657895717382481 -> 초평면 사상 후 표준편차
# 
# Number of Support Vectors : 59 # 초평면 사상후 획득한 #vectors 
# 
# Objective Function Value : -4.1337 -4.5024 -20.7951 
# Training error : 0.026667 


head(predict(m, newdata=iris))
# [1] setosa setosa setosa setosa setosa setosa
# Levels: setosa versicolor virginica

# 특별한 변환 없이 내적 계산
ksvm(Species~., data=iris, kernel = "vanilladot")
# Setting default kernel parameters  
# Support Vector Machine object of class "ksvm" 
# 
# SV type: C-svc  (classification) 
# parameter : cost C = 1 
# 
# Linear (vanilla) kernel function. 
# 
# Number of Support Vectors : 29 
# 
# Objective Function Value : -0.9818 -0.322 -17.0644 
# Training error : 0.033333

# polydot = 다항커널, degree = 3 3차원
m = ksvm(Species~., data = iris, kernel="polydot", kpar=list(degree=3))


