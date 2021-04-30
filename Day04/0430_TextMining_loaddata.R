rm(list=ls())
library(KoNLP)


#경로 표기시 \\ or / 사용
# \\ 영어, / 한글표기
getwd()
setwd("C:\\r_suzin\\Data")
data1 <- readLines("seoul_new.txt")
head(data1) #6개 까지 Data 확인

setwd("C:\\r_suzin\\Day04")
extractNoun("아버지가 방에 들어가신다.")
extractNoun("아버지가방에 들어가신다.")

# Read 방법 1
for(line in data1){
  print(extractNoun(line))
}

# Read 방법2
data2 <- sapply(data1, extractNoun)

# [optional arguments] USE.NAME은 정의된 순서와 상관없이 Label로 사용가능
data2 <- sapply(data1, extractNoun, USE.NAMES=F)

#lappy -> return type이 다름
data2 <- lapply(data1, extractNoun)
head(data2)
class(data2)


