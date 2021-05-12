#검정방법
##1. 양측검정 ("two.sided")
### 신뢰구간 벗어난 범위에 표본이 해당하는지 확인하는 것
### 가설: mu = A, sigma^2 = B
### 표본(S) n개 >=30
### 통계량 in 표본
### E(\bar(X)) = mu from 중심극한정리
### H0(귀무가설) E(\bar(X)) = mu
### H1(대립가설) E(\bar(X)) != mu, 표본이 신뢰구간을 벗어날 확률이 높다면 대립가설 채택, 귀무가설 기각각

##2. 단측검정 ("greater" or "less")
### H0(귀무가설) E(\bar(X)) = mu
### H1(대립가설) E(\bar(X)) < mu || E(\bar(X)) > mu



### 단일 집단 평균검정(단일표본 T검정)
### 단일집단, 연속형 데이터 분석 절차
### 모집단 1개, 가설 mu = A

### 0. 실습파일 가져오기 p194
### 모집단: 국내 생산 노트북 사용량, mu = 5.2h

setwd('C:\\r_suzin\\Data\\Part-III')
data <- read.csv('one_sample.csv', header = TRUE)
head(data)
str(data)


x <- data$time
head(x)
summary(x) 


### 1. 전처리
mean(x, na.rm=T) #5.556881
x1 <- na.omit(x) #5.556881


### 2. 기술통계량
summary(x) # Mean 5.557
mean(x1)

### 3. 정규분포
### 모집단이 정규성을 따르는지 관계 없이 충분한 N을 갖고있어야한다 -> 정규분포를 따라야한다는 의미
### shapio.test(): 정규성을 따르는지 확인 -> 귀무가설이 정규성을 따르는지 확인, N~(0,1)
### wilcox.test(): 정규성을 따르지 않을 때

shapiro.test(x1) #p-value >= 0.05(합산된 유의수준), 귀무가설을 따른다.

# Shapiro-Wilk normality test
# 
# data:  x1
# W = 0.99137, p-value = 0.7242

hist(x1)
qqnorm(x1) # 기울기가 45도에 가까운 기울기를 보일수록 정규성을 따름


### 4. 검정통계량 분석
### 양측검정
t.test(x1, mu=5.2, alter="two.sided", conf.level = 0.95)
# One Sample t-test
# 
# data:  x1
# t = 3.9461, df = 108, p-value = 0.0001417
# alternative hypothesis: true mean is not equal to 5.2
# 95 percent confidence interval:
#   5.377613 5.736148
# sample estimates:
#   mean of x 
# 5.556881 

# x1의 대립가설이 채택, 귀무가설 p-value < 0.05

#t.test(x1, mu=5.556881)

### 단측검정
t.test(x1, mu=5.2, alter="less", conf.level = 0.95)
t.test(x1, mu=5.2, alter="greater", conf.level = 0.95)

# One Sample t-test
# 
# data:  x1
# t = 3.9461, df = 108, p-value = 7.083e-05
# alternative hypothesis: true mean is greater than 5.2 -> 5.2보다 높다.
# 95 percent confidence interval:
#   5.406833      Inf
# sample estimates:
#   mean of x 
# 5.556881 

# 단일집단 검정 결과정리 및 기술 p199
# 가설설정
# 연구환경
# 유의수준
# 분석방법
# 검정통계량
# 유의확률
# 결과해석


