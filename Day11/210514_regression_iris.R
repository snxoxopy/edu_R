head(iris)

#종속변수: Length, 연속형
m2 <-lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width,
       data=iris)
summary(m2)
# Call:
#   lm(formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, 
#      data = iris)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.82816 -0.21989  0.01875  0.19709  0.84570 중앙값이 0 근사 값이 나오는 것을 권장, 0과 멀어질 수록 정규성을 안따를 가능이 높다.
# 
# Coefficients: 오차 평균에 다한 t검정, p-value가 유의수준 0.05보다 작기때문에 해당 계수는 유의미하다.
#   Estimate Std. Error t value Pr(>|t|)    귀무가설: 추정 회귀식은
# (Intercept)   1.85600    0.25078   7.401 9.85e-12 ***  해당 계수는 유의미하다. 
#   Sepal.Width   0.65084    0.06665   9.765  < 2e-16 *** 해당 계수는 유의미하다.
#   Petal.Length  0.70913    0.05672  12.502  < 2e-16 *** 해당 계수는 유의미하다.
#   Petal.Width  -0.55648    0.12755  -4.363 2.41e-05 *** 해당 계수는 유의미하다.
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.3145 on 146 degrees of freedom
# Multiple R-squared:  0.8586,	Adjusted R-squared:  0.8557 #Adjusted 다중 변량시 확인인
# F-statistic: 295.5 on 3 and 146 DF,  p-value: < 2.2e-16

# 중앙값이 0에 가깝고, 결정계수가 1에 가까울수록 설명력이 좋다. 예측률 50% 넘기 힘듦
# 위 데이터는 학습용용

coef(m2)

# (Intercept)  Sepal.Width Petal.Length  Petal.Width 
# 1.8559975    0.6508372    0.7091320   -0.5564827 

# y = 0.6508372*Sepal.Width + 0.7091320 * Petal.Length -0.5564827*etal.Width 



m3 <- lm(Sepal.Length ~ ., data=iris)

summary(m3)

# Call:
#   lm(formula = Sepal.Length ~ ., data = iris)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.79424 -0.21874  0.00899  0.20255  0.73103 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)        2.17127    0.27979   7.760 1.43e-12 ***
#   Sepal.Width        0.49589    0.08607   5.761 4.87e-08 ***
#   Petal.Length       0.82924    0.06853  12.101  < 2e-16 ***
#   Petal.Width       -0.31516    0.15120  -2.084  0.03889 *  
#   Speciesversicolor -0.72356    0.24017  -3.013  0.00306 ** 
#   Speciesvirginica  -1.02350    0.33373  -3.067  0.00258 ** 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.3068 on 144 degrees of freedom
# Multiple R-squared:  0.8673,	Adjusted R-squared:  0.8627 
# F-statistic: 188.3 on 5 and 144 DF,  p-value: < 2.2e-16


# 범주형이 나오면 벡터화하여 범주마다 따로 계수를 구해야함
# 회귀 사용하는이유: 변수선택

# 