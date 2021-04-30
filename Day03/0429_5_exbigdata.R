getwd()
setwd("C:\\Program Files\\R\\R-3.6.1\\library")
install.packages("KoNLP")
library(KoNLP)

install.packages("Sejong")

install.packages("hash")

install.packages("rJava")

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_102")

install.packages("tau")

install.packages("devtools")

list = ls()
rm(list=ls())

getwd()
setwd("C:\\r_suzin\\Day03")
data1<-readLines("seoul_new.txt")
data1
class(data) #문자열 벡터구조
length(data1)
?readLines

data1[1]

