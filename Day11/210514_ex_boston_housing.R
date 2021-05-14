#변수선택 예제 with 회귀분석

# install.packages("mlbench")
library(mlbench)

data()
rm(list=ls())

data("BostonHousing") #Memory에 올리기 in 전역영역
str(BostonHousing)
View(BostonHousing)
summary(BostonHousing)
head(BostonHousing)
?BostonHousing

reg <- lm(BostonHousing$medv~BostonHousing$crim)
summary(reg)

m <- lm(medv~., data=BostonHousing)
summary(m)


# Call:
#   lm(formula = medv ~ ., data = BostonHousing)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -15.595  -2.730  -0.518   1.777  26.199                 중앙값이 0과 가깝다.
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.646e+01  5.103e+00   7.144 3.28e-12 ***
#   crim        -1.080e-01  3.286e-02  -3.287 0.001087 ** 
#   zn           4.642e-02  1.373e-02   3.382 0.000778 ***
#   indus        2.056e-02  6.150e-02   0.334 0.738288    귀무가설 채택, 해당 계수는 오차의 차이가 없다. 
# chas1        2.687e+00  8.616e-01   3.118 0.001925 ** 
#   nox         -1.777e+01  3.820e+00  -4.651 4.25e-06 ***
#   rm           3.810e+00  4.179e-01   9.116  < 2e-16 ***
#   age          6.922e-04  1.321e-02   0.052 0.958229    귀무가설 채택, 해당 계수는 오차의 차이가 없다.
# dis         -1.476e+00  1.995e-01  -7.398 6.01e-13 ***
#   rad          3.060e-01  6.635e-02   4.613 5.07e-06 ***
#   tax         -1.233e-02  3.760e-03  -3.280 0.001112 ** 
#   ptratio     -9.527e-01  1.308e-01  -7.283 1.31e-12 ***
#   b            9.312e-03  2.686e-03   3.467 0.000573 ***
#   lstat       -5.248e-01  5.072e-02 -10.347  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 4.745 on 492 degrees of freedom
# Multiple R-squared:  0.7406,	Adjusted R-squared:  0.7338 설명력= 0.7338
# F-statistic: 108.1 on 13 and 492 DF,  p-value: < 2.2e-16

# 의미 없는 변량은 제외하고 다시 회귀식을 찾아야함

m2 <- step(m, direction="both") #단계적 선택법법
# Start:  AIC=1589.64 -> 단계적 평가 지표, 값이 낮은 회귀식 권장
# medv ~ crim + zn + indus + chas + nox + rm + age + dis + rad + 
#   tax + ptratio + b + lstat
# 
# Df Sum of Sq   RSS    AIC
# - age      1      0.06 11079 1587.7
# - indus    1      2.52 11081 1587.8
# <none>                 11079 1589.6
# - chas     1    218.97 11298 1597.5
# - tax      1    242.26 11321 1598.6
# - crim     1    243.22 11322 1598.6
# - zn       1    257.49 11336 1599.3
# - b        1    270.63 11349 1599.8
# - rad      1    479.15 11558 1609.1
# - nox      1    487.16 11566 1609.4
# - ptratio  1   1194.23 12273 1639.4
# - dis      1   1232.41 12311 1641.0
# - rm       1   1871.32 12950 1666.6
# - lstat    1   2410.84 13490 1687.3
# 
# Step:  AIC=1587.65
# medv ~ crim + zn + indus + chas + nox + rm + dis + rad + tax + 
#   ptratio + b + lstat
# 
# Df Sum of Sq   RSS    AIC
# - indus    1      2.52 11081 1585.8
# <none>                 11079 1587.7
# + age      1      0.06 11079 1589.6
# - chas     1    219.91 11299 1595.6
# - tax      1    242.24 11321 1596.6
# - crim     1    243.20 11322 1596.6
# - zn       1    260.32 11339 1597.4
# - b        1    272.26 11351 1597.9
# - rad      1    481.09 11560 1607.2
# - nox      1    520.87 11600 1608.9
# - ptratio  1   1200.23 12279 1637.7
# - dis      1   1352.26 12431 1643.9
# - rm       1   1959.55 13038 1668.0
# - lstat    1   2718.88 13798 1696.7
# 
# Step:  AIC=1585.76
# medv ~ crim + zn + chas + nox + rm + dis + rad + tax + ptratio + 
#   b + lstat
# 
# Df Sum of Sq   RSS    AIC
# <none>                 11081 1585.8
# + indus    1      2.52 11079 1587.7
# + age      1      0.06 11081 1587.8
# - chas     1    227.21 11309 1594.0
# - crim     1    245.37 11327 1594.8
# - zn       1    257.82 11339 1595.4
# - b        1    270.82 11352 1596.0
# - tax      1    273.62 11355 1596.1
# - rad      1    500.92 11582 1606.1
# - nox      1    541.91 11623 1607.9
# - ptratio  1   1206.45 12288 1636.0
# - dis      1   1448.94 12530 1645.9
# - rm       1   1963.66 13045 1666.3
# - lstat    1   2723.48 13805 1695.0



# IAC = -2lnL + 2q q:독립변수 개수 -> 독립변수가 많을수록 오차 값이 커진다.


#ML에서 과적합을 줄이는데 필요한 과정