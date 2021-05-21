## Randomforest p159

# install.packages("randomForest")
library(randomForest)
rf <- randomForest(Species ~ ., data=iris, importance=TRUE)
rf

?randomForest

# Call:
#   randomForest(formula = Species ~ ., data = iris, importance = TRUE) 
# Type of random forest: classification
# Number of trees: 500                    #tree의 개수
# No. of variables tried at each split: 2 
# 
# OOB estimate of  error rate: 4.67% # OOB의 Data를 Ensemble 모형 적합 결과의 오류율을 의미 -> 이 오류율을  학습정도 지표로 활용.
# Confusion matrix:
# 실측행(y, Species) - 예측열(\hat{y}, Species) 결과를 confusion matrix로 나타냄
#   setosa versicolor virginica class.error
# setosa         50          0         0        0.00
# versicolor      0         47         3        0.06
# virginica       0          4        46        0.08
# 

importance(rf)

# 여러개의 Decision Tree에서 사용된 불순도를 가장 낮게하여 정보이득을 높게하는 변수를 측정
# 변수의 중요도와 관련된 결과는 평균으로 나타낸다.

# setosa versicolor virginica MeanDecreaseAccuracy MeanDecreaseGini
# Sepal.Length  7.412646  7.3698334  8.722985            11.668731        10.472446
# Sepal.Width   5.259402 -0.1184083  5.843972             5.297075         2.608566
# Petal.Length 22.252424 32.2135855 27.631101            33.354237        43.227521
# Petal.Width  22.215438 31.4103427 28.810271            32.097834        42.885948

# MeanDecreaseAccuracy(좌) MeanDecreaseGini(우)
varImpPlot(rf, main="varimpPlot of iris")

# MeanDecreaseAccuracy: ConfusionMarix결과의 Accuracy를 개선하는데 기여하는 변수의 중요도를 나타낸다.
## Petal.Length > Petal.Width > Sepal.Length > Sepal.Width

# MeanDecreaseGini: 변수의 중요도를 나타냄 값이 클 수록 중요도가 높다. 
#@ Petal.Length > Petal.Width > Sepal.Length > Sepal.Width

# ConfusionMatrix의 결과를 토대도 분석한 것이 맞는지 재 확인 필요


# 파라미터 튜닝
# 나무 개수
# mtry: 자식 노드로 나누는 기준을 정할 때 고렿ㄹ 변수의 개수
# 자세한 것은 python에서 다룸
grid <- expand.grid(ntree=c(10,100,200), mtry=c(3,4))


# library(caret)
# confusionMatrix(rpart.pred, iris_test$Species)

## randomforest 변수파악후 회귀분석
## 

# ftting rate
# \hat{Try} - Try
# 학습한 모형에 다시 Tr data를 넣어 확인하는 작업
# Accuracy tunning시 fitting rate도 확인해가며 조정