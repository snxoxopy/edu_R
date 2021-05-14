# 종속: disg, 독립: speed
# 종속: 수치형 - 연속형(필수) 양적데이터

m <- lm(dist~speed, data=cars)

coef(m)
# (Intercept)       speed 
# -17.579095    3.932409

fitted(m)[1:4]
# 1         2         3         4 
# -1.849460 -1.849460  9.947766  9.947766 

residuals(m)[1:4]
# 1         2         3         4 
# 3.849460 11.849460 -5.947766 12.052234 

summary(m)

# Call:
#   lm(formula = dist ~ speed, data = cars)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max     중앙값이 0 근사 값이 나오는 것을 권장, 0과 멀어질 수록 정규성을 안따를 가능이 높다.
# -29.069  -9.525  -2.272   9.215  43.201 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -17.5791     6.7584  -2.601   0.0123 *  오차 평균에 다한 t검정, p-value가 유의수준 0.05보다 작기때문에 해당 계수는 유의미하다.
#   speed         3.9324     0.4155   9.464 1.49e-12 *** 
#   ---
#   Signif. codes:  
#   0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 15.38 on 48 degrees of freedom
# Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
# 분산에 대한 비율검정: F-검정, 3개이상 집단일 경우 평균검정도 가능
# 집단내, 집단간의 분산으로 집단간 평균을 알 수 있음
# F검정 신뢰구간 95% 이내 존재하면 평균차이가 없고 집단간 차이가 없다.
# 95%를 벗어나면 집단간 평균 차이가 존재하다는 것을 의미
# F검정은 집단의 평균오차차이를 알아보기위해
# 설명력(설명계수): 결정계수 R^2
# Multiple R-squared: 결정계수
# Adjusted R-squared: 기존 공식에 대한 문제, 변수가 많아질 경우 문제 발생
# 변량이 1개일 경우는 Multiple
# 변량이 다수일 경우는 Adjusted



predict(m, newdata = data.frame(speed=4), interval = "confidence")
# fit       lwr      upr
# 1 -1.84946 -12.32954 8.630624


summary(m)

# Call:
#   lm(formula = dist ~ speed, data = cars)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -29.069  -9.525  -2.272   9.215  43.201 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -17.5791     6.7584  -2.601   0.0123 *  
#   speed         3.9324     0.4155   9.464 1.49e-12 ***
#   ---
#   Signif. codes:  
#   0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 15.38 on 48 degrees of freedom
# Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12


#집단A
full <- lm(dist~speed, data=cars)

#집단B
reduced <- lm(dist~1, data=cars)

anova(reduced, full)
# Analysis of Variance Table
# 
# Model 1: dist ~ 1
# Model 2: dist ~ speed
# Res.Df   RSS Df Sum of Sq      F   Pr(>F)    
# 1     49 32539                                 
# 2     48 11354  1     21186 89.567 1.49e-12 ***
#   ---
#   Signif. codes:  
#   0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1



par(mfrow=c(2,2), mar=c(3,3,3,3))
plot(m)

?par(mfrow=c(1,1))
plot(cars$speed, cars$dist)
abline(coef(m))
