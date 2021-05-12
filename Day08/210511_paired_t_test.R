## 두 집단의 평균검정(독립표본 T검정)
## Paired t-test
setwd('C:\\r_suzin\\Data\\Part-III')
data <- read.csv('two_sample.csv')
str(data)

x <- data$method
y <- data$survey


# > t.test(x,y)
# 
# Welch Two Sample t-test
# 
# data:  x and y
# t = 18.689, df = 562.59, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   0.6115164 0.7551503
# sample estimates:
#   mean of x mean of y 
# 1.5000000 0.8166667 

var.test(x,y,paired=TRUE)
t.test(x,y,paired=TRUE)





t.test(x,y,alter="greater")
t.test(x,y,alter="less")


#평균과 분산을 고려한 집단 비교, 분산이 유사하면 평균의 의미가 있음

##데이터 전처리

##두 집단 subset작성

##기술통계량(평균)
