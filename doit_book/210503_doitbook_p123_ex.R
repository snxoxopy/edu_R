rm(list=ls())
library(ggplot2)
#Q1. 
df_midwest <- as.data.frame(midwest)
str(df_midwest)

#Q2/
df_midwest <- rename(df_midwest, total=poptotal)
df_midwest <- rename(df_midwest, asian=popasian)
str(df_midwest)


#q3.
df_midwest$asianpt <- df_midwest$asian/df_midwest$total
hist(df_midwest$asianpt)

avg_asianpt <- mean(df_midwest$asianpt)
avg_asianpt
#q4.
df_midwest$larg_small <- ifelse(mean(df_midwest$asianpt)<df_midwest$asianpt,"large","small")

#q5.
table(df_midwest$larg_small)
qplot(df_midwest$larg_small)

?midwest
View(df_midwest)
