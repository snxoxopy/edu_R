library(class)

setwd('C:\\r_suzin\\Data\\MLData')
wbcd<-read.csv("wisc_bc_data.csv",stringsAsFactors=F)
# 위스콘싞 대학의 연구자들이 기부핚 데이터
# 유방 암 조직 검사에 대핚 569개의 데이터와 32개의 속성
str(wbcd)
# M(Malignant) : 악성 / B(Benign) : 양성
# radius : 반지름 / texture : 텍스처 / perimeter : 둘레 / area : 면적 / 
# smmothness : 평홗도
# compactness : 다짐도 / concavity : 요면 / concave points : 요면점 / 
# symmetry : 대칭 / fractal dimension : 프렉탈 차원
wbcd<-wbcd[-1] # id 삭제
table(wbcd$diagnosis)
wbcd$diagnosis<-
  factor(wbcd$diagnosis,levels=c("B","M"),labels=c("Benign","Malignant"))
summary(wbcd) # 단위가 굉장히 다름 -> 정규화가 필요

#### 데이터 표준화 ####
# 최대최소 표준화 (0~1값으로 변홖)
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
wbcd_n<-as.data.frame(lapply(wbcd[2:31],normalize)) # 리스트를 데이터프레임형식으로
변홖
wbcd_n
#### 데이터 분핛 #####
# 이 데이터 경우 기록물은 임의의순서로 저장되어있기 때문에, 샘플링이 단순
wbcd_train<-wbcd_n[1:469,]
wbcd_test <-wbcd_n[470:569,]
wbcd_train_labels<-wbcd[1:469,1]
wbcd_test_labels<-wbcd[470:569,1]
prop.table(table(wbcd_train_labels))
prop.table(table(wbcd_test_labels)) # 데이터 분핛이 골고루 잘 되었는지 확인

# pdf p12

#### 모델 훈렦 (가중치X) ####
# install.packages("class")
library(class)
wbcd_test_pred<-knn(train=wbcd_train,
                    test=wbcd_test,
                    cl=wbcd_train_labels, 
                    # class : train 데이터의 각 행에 대핚 범주인 팩터 벡터
                    k=21)
table(wbcd_test_pred)
#### 모델 성능 평가 #####
# install.packages("gmodels")
library(gmodels)
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred,
           prop.chisq=FALSE,prop.c=FALSE)

# Cell Contents
# |-------------------------|
#   |                       N |
#   |           N / Row Total |
#   |         N / Table Total |
#   |-------------------------|
#   
#   
#   Total Observations in Table:  100 
# 
# 
# | wbcd_test_pred 
# wbcd_test_labels |    Benign | Malignant | Row Total | 
#   -----------------|-----------|-----------|-----------|
#   Benign |        77 |         0 |        77 | 
#   |     1.000 |     0.000 |     0.770 | 
#   |     0.770 |     0.000 |           | 
#   -----------------|-----------|-----------|-----------|
#   Malignant |         2 |        21 |        23 | 
#   |     0.087 |     0.913 |     0.230 | 
#   |     0.020 |     0.210 |           | 
#   -----------------|-----------|-----------|-----------|
#   Column Total |        79 |        21 |       100 | 
#   -----------------|-----------|-----------|-----------|


