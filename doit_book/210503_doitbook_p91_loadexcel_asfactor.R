#p91
rm(list=ls())
install.packages('readxl')
library(readxl)#.excel file을 읽기 위한 lib.
setwd('C:\\r_suzin\\doit_resources')
getwd()

df_exam <- read_excel('excel_exam.xlsx')
?read_excel
head(df_exam)
class(df_exam)
str(df_exam) #structure
data <- df_exam[1,3:5]
data
mean(data)

df_exam$id
df_exam$math
df_exam$english
df_exam$science

mat1 <- mean(df_exam$math)
eng1 <- mean(df_exam$english)
sci1 <- mean(df_exam$science)

tot_mean <- mean(mat1,eng1,sci1)


exam <- read.csv("csv_exam.csv")
head(exam, 10)     
tail(exam)
View(exam)
str(exam)
class(exam$class)
summary(exam)

exam$class <- as.factor(exam$class)
class(exam$class)
summary(exam)
str(exam)

table(exam)
