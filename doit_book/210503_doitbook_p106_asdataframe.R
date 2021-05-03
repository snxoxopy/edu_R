#install.packages("ggplot2")

library(ggplot2)

# data 파악하기
str(ggplot2::mpg)
df_mpg <- as.data.frame(ggplot2::mpg)
str(df_mpg)
head(mpg)
tail(mpg)
View(mpg)
?ggplot2::mpg
summary(df_mpg)

dim(mpg)
str(mpg) #데이터 구조(스키마) 확인


# data 수정하기 > 변수명 바꾸기p110

#install.packages("dplyr")
library(dplyr)


df_raw <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
str(df_raw)
df_raw

df_raw2 <- data.frame(va11 <- c(1,2,1), var2 <- c(2,3,2))
str(df_raw2)
df_raw2

df_new <- df_raw
#rename(새로운 변수명, 기존 변수명)
df_new <- rename(df_new, v2 = var2)
df_new


#p112
#Q1.
df_mpg <- as.data.frame(ggplot2::mpg)
#Q2.
df_mpg <- rename(df_mpg, city = cty)
#Q3.
head(df_mpg)

df <- data.frame(var1 = c(4,3,8), var2 = c(2,6,1))
df

#파생변수 만들기
df$var_sum <- df$var1 + df$var2
df
df$var_mean <- (df$var1 + df$var2)/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

df_mpg$total <- mpg$total
head(df_mpg)

summary(df_mpg$total)

#현재 창의 window 크기가 작을경우 오류가 발생하여 disp 안할 수 있음
hist(df_mpg$total)

#조건문을 이용해 연속형 data를 이산형,범주형 data로 바꿈
df_mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
#factor형으로 자동 전환하여 계산
table(df_mpg$test)

#기본적으로 R에서는 이산형
#문자열은 자동으로 이산형
#factor 형태로 지정해주는 것이 좋음
df_mpg$test <- as.factor(df_mpg$test)
str(df_mpg)

#p120
qplot(df_mpg$test)
mpg$grade <- ifelse(df_mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C"))
qplot(mpg$grade)
head(mpg, 20)

