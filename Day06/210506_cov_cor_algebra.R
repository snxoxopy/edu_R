# R기반 통계학 p27
# 대수학: 복잡핚 일상의 사건들을 수학적 공식으로 단숚화해서 설명하고자 핚 수학분야
# 대수학 관점의 공분산과 상관계수
# y = wx + b, x:독립변수(설명변수), y:종속변수, b: 초기값
# 인과 관계 있음
# 다중선형대수식: 변량이 2개 이상

# R기반 통계학 p28
# 특성공학 ex) items을 descartes 공간좌표에 옮기는 방법

# 벡터의 내적
# cov(x,y); mean = 0 ~ |X||Y|cos(theta)
# |x|, |y|: 표준편차
# cov(x,y)
# -------- = cos(theta) = r (-1 <= r <= 1)
# |x||y|
# theta를 보고 데이터의 상관관계를 유추 할 수 있다.

# 질적 Data
library(MASS)
data(survey)
table(survey$Smoke)
# Heavy Never Occas Regul 
# 11   189    19    17 
smoke <- table(survey$Smoke)
barplot(smoke)
pie(smoke)
table(survey$Sex,survey$Smoke)

# 양적 Data
hist(mtcars$mpg)
stem(mtcars$hp)
# > stem(mtcars$hp)
# 
# The decimal point is 2 digit(s) to the right of the |
#   
#   0 | 5677799
# 1 | 0011111122
# 1 | 55888888
# 2 | 123
# 2 | 556
# 3 | 4

library(ggplot2)
ggplot(BOD, aes(x=BOD$Time, y=BOD$demand)) + geom_line()



