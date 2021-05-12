## F 분포 R_기반_통계학 p129
## 두 모집단의 분산 비율을 알고자 핛 때 사용
## 분산비율
## 통계학 p213
## 분산분석
## 1) 변량1개 일원분석 2) 이원분석

##p214과제

# 실습] 데이터 전처리 수행
#1. 데이터 전처리
setwd("C:\\r_suzin\\Data\\Part-III")
data <- read.csv("three_sample.csv", header = TRUE)
head(data)
# no method survey score
# 1  1      1      1   3.2
# 2  2      2      0    NA
# 3  3      3      1   4.7
# 4  4      1      0    NA
# 5  5      2      1   7.8
# 6  6      3      1   5.4

#2. 데이터 전처리
data <- subset(data, !is.na(score), c(method, score))
head(data)
# method score
# 1      1   3.2
# 3      3   4.7
# 5      2   7.8
# 6      3   5.4
# 8      2   8.4
# 9      3   4.4

#3. 차트이용 outlier 보기 (데이터분포 현황 분석)
plot(data$score)
barplot(data$score)
mean(data$score)
#[1] 14.44725

#4. 데이터 정제(outlier 제거)
length(data$score) # [1]91
data2 <- subset(data, score <= 14) # 14 이상 제거
length(data2$score) # [1] 88

#5. 정제된 데이터 확인
x <- data2$score
boxplot(x)

# 실습] 세 집단 subset 작성과 기술통계량 구하기
#1. 세 집단 subset 작성
data2$method2[data2$method==1] <- "방법1"
data2$method2[data2$method==2] <- "방법2"
data2$method2[data2$method==3] <- "방법3"

#2. 교육방법 별 빈도수
table(data2$method2)
# 방법1 방법2 방법3 
# 31    27    30 

#3. 교육방법을 x변수에 저장
x <- table(data2$method2)

#4. 교육방법에 따른 시험성적 평균구하기
y <- tapply(data2$score, data2$method2, mean)
y
# 방법1    방법2    방법3 
# 4.187097 6.800000 5.610000 


#5. 교육방법과 시험성적으로 데이터프레임 생성
df <- data.frame(교육방법 = x, 성적 = y)
df
# 교육방법.Var1 교육방법.Freq     성적
# 방법1         방법1            31 4.187097
# 방법2         방법2            27 6.800000
# 방법3         방법3            30 5.610000


# 해설] 교육방법에 따라서 세 집단으로 subset을 작성한 후 각 방법에 대한 빈도수를 구한다.

# 실습] 세 집단 간 동질성 검정
# 형식: bartlett.test(종속변수 ~ 독립변수, data=dataset())
bartlett.test(score~method, data=data2)
# Bartlett test of homogeneity of variances
# 
# data:  score by method
# Bartlett's K-squared = 3.3157, df = 2, p-value
# = 0.1905

# 해설) 검정 통계량 p-value값은 0.1905로 유의수준 0.05보다 크기 때문에 세 집단 간의 분포형태가 동질

# 분산분석(세 집단 간 평균 차이 검정)
# aov():세 집단 간 평균 차이 검정을 수행, 이유: 세집단간 분포형태가 동질하다고 분석
# kriskal.test(): 비모수 검정

result <- aov(score~method2, data=data2)
names(result)

# [1] "coefficients"  "residuals"     "effects"      
# [4] "rank"          "fitted.values" "assign"       
# [7] "qr"            "df.residual"   "contrasts"    
# [10] "xlevels"       "call"          "terms"        
# [13] "model"  

summary(result)
# Df Sum Sq Mean Sq F value   Pr(>F)    
# method2      2  99.37   49.68   43.58 9.39e-14 ***
#   Residuals   85  96.90    1.14                     
# ---
#   Signif. codes:  
#   0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1# 

# 해설] 
# p-value = 3.39e-14 < 유의 수준 0.05
# 세 집단간 평균에 차이가 있다.

# 실습] 사후검정
TukeyHSD(result) #분산의 분석 결과로 사후 검정
?TukeyHSD # Usage TukeyHSD(x, which, ordered = FALSE, conf.level = 0.95, ...)

# $method2
# diff        lwr        upr     p adj
# 방법2-방법1  2.612903  1.9424342  3.2833723 0.0000000
# 방법3-방법1  1.422903  0.7705979  2.0752085 0.0000040
# 방법3-방법2 -1.190000 -1.8656509 -0.5143491 0.0001911

# 사후검정 시각화
plot(TukeyHSD(result))

# 해설] 분산분석의 사후 검정은 어떤 집단간에 차이가 있는 지 보여준다.
# 위 예제는 방법2와 방법1의 집단 간 평균의 차가 가장 큼

#F-검정
# 집단 간 분산/ 집단내 분산
# 95%이내 포함된 경우 -> 귀무가설 채택
# 95% 벗어날 경우 -> 가뮈가설 기각, 대립가설 채택
# 대립 가설 채택 의미: 집단간 분산 큼, 집단내 분산 작음


