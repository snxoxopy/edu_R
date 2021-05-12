## review
## Z = (\bar(X) - mu)/sigma
## t = (\bar(X) - mu)/S*sqrt(n)

## Chi-Square 분포 p170
## chi^2_(n-1) = (n-1)s^2/sigma^2
## s^2: 표본분산, sigma^2: 모분산
## chi-square 자유도 영향 받음
## sigma^2 = (n-1)S^2/chi^2
## chi-square 분포를 따르고 표본의 분산이 주어질 때 모분산 추정 가능
## 연속형 chi-square

## 교차분석
## 범주형 교차분석
## 증명 https://lh3.googleusercontent.com/proxy/RC51-0tZ1RJ95Ja0fcKkKXgONiMAliXV5cf6AjZ2F4YuSrGLqp7WTabQa83Afx5WsFele6jKZRk4Wli5fmjinULsJByYygnMPqLbTSezHwmLlmbHSqy1Vd4WiFDQhmdTAZqLOEoXjL4xYLSzKOjeY4zvE3fqJdjsn16Z8mU9mH3dTQ
## chi^2 = \sum{(O-E)^2/E}
## O: 관측 빈도수, E: 기대 빈도수, 모평균(분자항)
## 전제조건: 데이터 관계가 독립
## 독립성 검사를 위해 사용함, chi-square 분포를 따르면 두 변수가 독립적이다.
## 관측치와 기대치가 차이가 별로 없다면 분포의 3.84

# 95 % 구간 최저 0 최고 3.84
# 가설: 관측치와 기대치 값이 차이가 없다.
# 결과: 3.84를 벗어나면 관측치와 기대치가 차이 있다.


setwd("C:\\r_suzin\\Data\\Part-III")
data <- read.csv('cleanDescriptive.csv', header = TRUE)
data

head(data)
str(data)
View(data)

# 'data.frame':	248 obs. of  14 variables:
#   $ resident : int  1 2 NA 4 5 3 2 NA 2 5 ...
# $ gender   : int  1 1 1 2 1 1 2 1 1 2 ...
# $ age      : int  50 54 62 50 51 55 56 49 49 49 ...
# $ level    : int  1 2 2 NA 1 2 1 1 2 NA ...
# $ cost     : num  5.1 4.2 4.7 3.5 5 5.4 4.1 4.4 4.9 2.3 ...
# $ type     : int  1 1 1 1 1 1 1 1 1 1 ...
# $ survey   : int  1 2 1 4 3 3 NA NA 1 2 ...
# $ pass     : int  2 2 1 1 1 NA 2 2 1 1 ...
# $ cost2    : int  2 2 2 NA 2 2 2 2 2 1 ...
# $ resident2: chr  "특별시" "광역시" NA "광역시" ...
# $ gender2  : chr  "남자" "남자" "남자" "여자" ...
# $ age2     : chr  "장년층" "장년층" "노년층" "장년층" ...
# $ level2   : chr  "고졸" "대졸" "대졸" NA ...
# $ pass2    : chr  "실패" "실패" "합격" "합격" ...
# 범주형 데이터 확인

# 변수 리코딩
x <- data$level2
y <- data$pass2

# 데이터프레임 생성 data.frame(열이름=명목척도변수, 열이름=명목척도변수)
result <- data.frame(Level=x, Pass=y)
dim(result)

# 교차분할표 작성
table(result) #도수분보표
# Pass
# Level      실패 합격
# 고졸       40   49
# 대졸       27   55
# 대학원졸   23   31

#install.packages("gmodels")
library(gmodels) #CrossTable 함수사용
library(ggplot2) #diamonds Dataset 확인

head(diamonds)

# # A tibble: 6 x 10
# carat cut       color clarity depth table price     x     y     z
# <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
#   1  0.23 Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
# 2  0.21 Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
# 3  0.23 Good      E     VS1      56.9    65   327  4.05  4.07  2.31
# 4  0.29 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
# 5  0.31 Good      J     SI2      63.3    58   335  4.34  4.35  2.75
# 6  0.24 Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48

CrossTable(x=diamonds$color, y=diamonds$cut, chisq=TRUE) #교차분석
# 일반적으로 범주형 데이터는 교차분석 후 상관계수를 확인한다.
# Cell Contents
# |-------------------------|
#   |                       N | 관측치
#   | Chi-square contribution | 카이제곱 적용
#   |           N / Row Total | 행비율
#   |           N / Col Total | 열비율
#   |         N / Table Total | 전체비율
#   |-------------------------|
# ...생략...
# Statistics for All Table Factors
# 
# 
# Pearson's Chi-squared test 
# ------------------------------------------------------------
# Chi^2 =  310.3179     d.f. =  24     p =  1.394512e-51 < 0.05 -> 귀무가설 기각, 대립가설 채택 -> 두 변수는 독립적이지 않다.



x <- data$level2
y <- data$pass2
CrossTable(x,y,chisq=TRUE)

## 카이제곱검정 유형
### 독립성 검정
### H0: 두사건은 관련이 없다.
### 동질성 검정
### Ho: 모든 표본들의 비율은 동일하다.
### 적합도 검정

### p182
### 동질성 검정 과정
### H0: 교육방법에 따라 만족도 차이가 없다.
### H1: 교육방법에 따라 만족도 차이가 있다.

# 파일 가져오기
data <- read.csv("homogenity.csv")
head(data)

# 서브셋 작성
?subset
data <- subset(data, !is.na(data), c(method, survey))
str(data)
# method survey
# 1           1      1
# 2           2      2
# 3           3      3
# 4           1      4
# 5           2      5
# ... 생략

# 코딩변경 변수추가
# method1: 방법1, 방법2, 방법3
# survey1: "매우만족" "만족" "보통" "불만족" "매우불만족"

# 필드추가
data$method2[data$method==1] <- "방법1"
data$method2[data$method==2] <- "방법2"
data$method2[data$method==3] <- "방법3"

data$survey2[data$survey==1] <- "매우만족"
data$survey2[data$survey==2] <- "만족"
data$survey2[data$survey==3] <- "보통"
data$survey2[data$survey==4] <- "불만족"
data$survey2[data$survey==5] <- "매우불만족"

str(data)
summary(data)

#교차분할 표 작성
table(data$method2, data$survey2)
# 만족 매우만족 매우불만족 보통 불만족
# 방법1    8        5          6   15     16
# 방법2   14        8          6   11     11
# 방법3    7        8          9   11     15

# 동질성 검정

chisq.test(data$method2, data$survey2)

# Pearson's Chi-squared test
# 
# data:  data$method2 and data$survey2
# X-squared = 6.5447, df = 8, p-value = 0.5865

# 해석
# p-value = 0.5865
# 유의수준 0.05에서 chi-square 값 = 6.5447, 유의확률 0.5865
# 6.5447 이상의 값이 얻어질 확률은 0.586
# 유의 수준 0.05 < 0.586
# 따라서, 귀무가설을 기각할 수 없다.
# 공부방법과 시험결과에 차이가 없다, 관련성이 없다.(두 변량은 독립이다.)


