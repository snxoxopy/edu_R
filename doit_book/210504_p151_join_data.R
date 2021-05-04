#p151 6-7 데이터 합치기
test1 <- data.frame(id=c(1:5), midterm=c(60,80,70,90,85))
test1
test2 <- data.frame(id=c(1:5), final=c(70,83,65,95,80))
test2
test3 <- data.frame(id = c(1,2,3,4,6), score=c(10,20,30,40,50))
test3

total <- left_join(test1,test2,by="id")
total
total <- left_join(test1,test2)
total

#left_join
# by를 안해도 공통적인 것으로 기준으로 join함
#좌측의 key field 를 기준으로 product를 도출함
result <- left_join(test1,test3)
result

library(dplyr)
setwd('C:\\r_suzin\\doit_resources')
getwd()
df_exam <- read.csv("csv_exam.csv")
df_exam

name <- data.frame(class=c(1:5), teacher = c("kim","lee","park","choi","jung"))
exam_new <- left_join(df_exam, name, by="class")
exam_new

