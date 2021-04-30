#install.packages("wordcloud")
#install.packages("RColorBrewer")

#Text 시각화를 위한 Lib.
library(wordcloud)
#Word 정보 출력을 위한 Lib. (색상과 같은 graphic 요소)
library(RColorBrewer) 

# 아래 wordcloud 에서 min.freq 에 있는 항목이 언급된 횟수로 최소 1회 이상 언급된 단어만 
# 출력하라는 예 입니다. 다른 옵션도 변경하면서 테스트 해 보세요.

names(wordcount)

palete <- brewer.pal(9,"Set3") 
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,
          random.order=F,random.color=T,colors=palete)

# Layer를 쌓아 올리는 개념으로 graphic을 그림
legend(0.3,1 ,"서울시 응답소 요청사항 분석",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")

