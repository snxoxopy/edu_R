library(nnet)

iris_train_scale<-as.data.frame(sapply(iris_train[,-5], scale)) #데이터

# 정규화: scale, Z분포 평균0, 표준편차1, 사분위수, 대칭구조 -> 지역해, 전역해 문제해결을 위함
# 표준화와 다름

# 다중회귀, regression 문제일 경우 SVM 인공신경망으로 모형 생성해보기
# size 3개정도

iris_test_scale <- as.data.frame(sapply(iris_test[,-5],scale))
iris_train_scale$Species <- iris_train$Species
iris_test_sacle$Species <- iris_test$Species

nnet.pred <- predict(nnet.result, iris_test_scale, tpye="class")

table(nnet.pred, iris_test$Species)  
