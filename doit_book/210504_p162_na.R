#p162 결측치 확인하기

df <- data.frame(gender=c("M","F", NA, "M", "F"),
                 score = c(5,4,3,4,NA))
df

is.na(df)

df %>%  filter(is.na(score))

table(is.na(df$score))

df_nomiss <- na.omit(df)
df_nomiss

mean(df$score, na.rm=T)
sum(df$score,na.rm=T)

mean(df_exam$math, na.rm=T)

setwd('C:\\r_suzin\\doit_resources')
getwd()
df_exam <- read.csv("csv_exam.csv")
df_exam

df_exam$math <- ifelse(is.na(df_exam$math), 55, df_exam$math)

table(is.na(df_exam$math))

#이상치 제거하기 p174
boxplot(df_mpg$hwy)



