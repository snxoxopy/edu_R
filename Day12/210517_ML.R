# 오전
# ML
## 지도학습
### 수치형(regression)
### 범주형(classification)
#### ex) 생존여부(종속)~성별+객실위치+선착장+나이(독립)
#### 비순환 자료형
#### 계층구조
## 비지도학습
### 행 사이의 유사성, 좌표
## 강화학습

# ML>Supervised Learning>Decision Tree>Classification
setwd("C:\\r_suzin\\PRJ\\ref\\titanic")
df_titanic <- read.csv('test.csv')
df_train <- read.csv('train.csv')
str(df_titanic)
#'data.frame':	418 obs. of  11 variables:


str(df_train)
# 'data.frame':	891 obs. of  12 variables:
# feature(독립)
# label(종속): survived
# 

# 종속변수
## 범주형
## ->결정나무; classification (수치형도 가능함 -> regression tree)
## ex) XGBOOST
## 연속형(수치형)
## -> 회귀

# 오후
# 2시간 과제풀이
# 2시간 조별 과제 체크
