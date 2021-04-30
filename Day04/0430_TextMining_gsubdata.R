rm(list=ls())
library(KoNLP)


#경로 표기시 \\ or / 사용
# \\ 영어, / 한글표기
getwd()
setwd("C:\\r_suzin\\Data")
data1 <- readLines("seoul_new.txt")
head(data1) #6개 까지 Data 확인

# Read 방법2
data2 <- sapply(data1, extractNoun)
head(data2)


#for(line in data1){
#  data2 <- extractNoun(line)
#}

# sapply: list 지원 X, unlist로 vector 자료구조 강제변환
table(unlist(data2))
#data3 <- table(unlist(data2))
head(data3)
data3 <- unlist(data2)

#?gsub("변경 전 문자", "변경 후 문자", "원본 데이터")
data3 <- gsub("\\d+", "",data3) #정규 표현식: \\d숫자, +: 1개이상
data3 <- gsub("서울시", "",data3)
data3 <- gsub("서울", "",data3)
data3 <- gsub("요청", "",data3)
data3 <- gsub("제안", "",data3)
data3 <- gsub(" ", "",data3)
data3 <- gsub("-", "",data3)
data3 <- gsub("OO","",data3)
data3 <- gsub("개선","",data3)
data3 <- gsub("문제","",data3)
data3 <- gsub("관리","",data3)
data3 <- gsub("민원","",data3)
data3 <- gsub("이용","",data3)
data3 <- gsub("관련","",data3)
data3 <- gsub("시장","",data3)
head(data3)


write(unlist(data3),"seoul_2.txt")
data4<-read.table("seoul_2.txt") #2차원형태로 읽어들임, 빈 행은 지움
write(unlist(data4),"seoul_2.txt")
data4
nrow(data4)

wordcount <- table(data4)
sort(wordcount,decreasing=T, 20) #20개만 추출




