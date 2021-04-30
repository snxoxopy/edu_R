rm(list=ls())
library(KoNLP)

# Load Data
getwd()
setwd("C:\\r_suzin\\Data")
data1 <- readLines("jeju.txt")
head(data1) #6개

# Ref. Data
local_name <- readLines("제주여행코스.txt")
local_name <- unlist(local_name)
#?gsub("변경 전 문자", "변경 후 문자", "원본 데이터")
#local <- gsub("^제주", "", local_name)
#local <- gsub("\\n", "", local_name)
#local <- gsub("\\s", "", local_name)
#local

# 형태소 분리
data2 <- sapply(data1, extractNoun, USE.NAMES=F)
#2차원 형태로 읽어들임, 빈 행은 지움
table(unlist(data2))
data3<-unlist(data2)

#=============================전처리1-숫자, 개행 삭제
#?gsub("변경 전 문자", "변경 후 문자", "원본 데이터")
data3 <- gsub("\\d+", "", data3)
#data3 <- gsub("[[:punct:]]", "", data3)
data3 <- gsub("\\n", "", data3)
data3

#연습
#length(unlist(strsplit("안녕-하세요","-")))
length(unlist(strsplit("안녕-하세요","-")))
length(unlist(strsplit("안녕-하세-요","-")))


#Filtering
for(jeju in data3){
  if (length(unlist(strsplit(jeju,"-")))>1){
    data4<-c(strsplit(jeju,"-"),data4)
  }
  else{
    if(nchar(jeju)>2){
      #print(jeju)
      data4<-c(jeju, data4)
    }
  }
}


class(data4)
#=============================전처리2- 특수문자, 숫자삭제
data4 <- unlist(data4)
data4 <- gsub("[[:punct:]]", "", data4)
data4 <- gsub("^요", "", data4) #연습
data4 <- gsub("$요", "", data4) #연습
data4 <- gsub("$니", "", data4) #연습
data4 <- gsub("\\d+", "", data4)
table(data4)


#============================= Write/Re-load/Sort Data
write(data4,"jeju_list.txt")
result<-read.table("jeju_list.txt") #2차원 형태로 읽어들임, 빈 행은 지움
result<-unlist(result)
nrow(result)
wordcount <- table(result)
sort(wordcount, decreasing=T, 15) #15개만 추출



# -----------------------
#Text 시각화를 위한 Lib.
library(wordcloud)
#Word 정보 출력을 위한 Lib. (색상과 같은 graphic 요소)
library(RColorBrewer) 

names(wordcount)
palete <- brewer.pal(9,"Set3") 
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,
          random.order=F,random.color=T,colors=palete)

# Layer를 쌓아 올리는 개념으로 graphic을 그림
legend(0.3,1 ,"제주도여행지",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")
