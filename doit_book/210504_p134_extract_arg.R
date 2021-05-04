rm(list=ls())
#library(readxl)#.excel file을 읽기 위한 lib.
library(dplyr)
setwd('C:\\r_suzin\\doit_resources')
getwd()
df_exam <- read_excel('excel_exam.xlsx')
df_exam <- read.csv("csv_exam.csv")
str(df_exam)
df_exam %>% select(math)
df_exam %>% select(class, math, english)
df_exam %>% select(-math)

#가독성을 높이기 위한 개행
df_exam %>% 
  filter(class==1) %>% 
  select(english)

df_exam %>% 
  filter(id, math) %>% 
  head(10)

library(ggplot2)
#사용자 정의 자료구조 tibble
df_mpg <- as.data.frame(ggplot2::mpg)
str(df_mpg)

df_mpg %>% 
  select(class, cty) %>% 
  head(10)


# p138
df_mpg %>% 
  select(class, cty) %>% 
  filter(class=="suv")

suv_cty <- filter(df_mpg)

#uninstall