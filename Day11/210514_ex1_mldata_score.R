setwd("C:\\r_suzin\\Data")

score <- readLines("score.txt")
score <- read.csv("score.csv")

str(score)
attach(score)


lm1 <- lm(성적~IQ)
lm1


# Call:
#   lm(formula = 성적 ~ IQ)
# 
# Coefficients:
#   (Intercept)           IQ  
# -5.2918       0.6714  

summary(lm1)

# Call:
#   lm(formula = 성적 ~ IQ)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -3.6598 -2.2384 -0.2674  1.6186  6.3544 잔차들의 중앙값이 0에 가까움. 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  -5.2918    13.5832  -0.390 0.707007     
# IQ            0.6714     0.1080   6.217 0.000255 *** 기울기에 해당하는 계수는 잔차 평균에 대해 유의미
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3.322 on 8 degrees of freedom
# Multiple R-squared:  0.8285,	Adjusted R-squared:  0.8071 
# F-statistic: 38.65 on 1 and 8 DF,  p-value: 0.0002547


#회귀식
x <- 125 #성적을 예측하고자 하는 IQ
y <- 0.6714*x -5.2918
y
# [1] 78.6332

coef(lm1)

# (Intercept)          IQ 
# -5.2918428   0.6713863 

?predict
predict(lm1, newdata=data.frame(c(125,125,125,125,125,125,125,125,125,125)))
# AtoZ 이름에 해당하는 IQ를 125라고 가정했을 때의 성적 예측측
# 1        2        3        4        5        6        7        8        9       10 
# 88.70224 78.63145 75.27451 85.34531 65.20372 77.28867 83.33115 71.91758 80.64560 82.65976 
# 


lm2 <- lm(성적~다니는학원수)
lm2

# Call:
#   lm(formula = 성적 ~ 다니는학원수)
# 
# Coefficients:
#   (Intercept)  다니는학원수  
# 69.488         4.953  

lm3 <- lm(성적~IQ+다니는학원수+게임하는시간+TV시청시간) #선형회귀분석
lm3

# Call:
#   lm(formula = 성적 ~ IQ + 다니는학원수 + 게임하는시간 + TV시청시간)
# 
# Coefficients:
#   (Intercept)            IQ  다니는학원수  게임하는시간    TV시청시간  
# 23.2992        0.4684        0.7179       -0.8390       -1.3854  # 

summary(lm3)
# Call:
#   lm(formula = 성적 ~ IQ + 다니는학원수 + 게임하는시간 + TV시청시간)
# 
# Residuals:
#   1       2       3       4       5       6       7       8       9      10 
# 0.5248 -0.8968  2.3139  0.3157  1.4139 -0.8445  0.4566 -2.8905  0.8711 -1.2642 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)   
# (Intercept)  23.29923   12.33405   1.889  0.11751   
# IQ            0.46842    0.08953   5.232  0.00338 ** 종속변수 성적에 대하여 IQ 해당하는 계수 유의미
#   다니는학원수  0.71790    1.07656   0.667  0.53440   
# 게임하는시간 -0.83895    0.46493  -1.804  0.13100   
# TV시청시간   -1.38541    0.89982  -1.540  0.18427   
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.008 on 5 degrees of freedom
# Multiple R-squared:  0.9608,	Adjusted R-squared:  0.9295 
# F-statistic: 30.67 on 4 and 5 DF,  p-value: 0.001033
# 

plot(IQ, 성적, pch=20, col="red")
abline(lm1,col="blue")