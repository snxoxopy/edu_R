library(KoNLP)

extractNoun("아버지가 가방에 들어가신다다")
extractNoun("수진쓰 이제 쉼")
extractNoun("가방 바나나 주스 합니다.")
extractNoun("나는 바나나 주스를 마십니다.")
extractNoun("나 유수진")
extractNoun("오늘은 여기 까지 진행합니다!")
extractNoun("명사를 어떻게 구분할까요?")
extractNoun("머리를 감자")
extractNoun("감자를 깎습니다.")
extractNoun("일주일에 한번씩 횡단보도를 건너다.")
extractNoun("걸리버 여행기")

seg <- extractNoun("머리를 감자")
seg

seg2 <- extractNoun("일주일에 한번씩 횡단보도를 건너다.")
seg2[1]

seg3 <- c(extractNoun("일주일에 한번씩 횡단보도를 건너다."))
seg3[2]

seg4 <- seg3[-1]
seg4
setdiff(seg3,seg4)

seg8 <- c(1,2,3,4)
seg9 <- c(1,3,4,5)
setdiff(seg8, seg9)

getwd()
setwd("C:\\r_suzin\\Day03")
data<-readLines("seoul_new.txt")

data1 <- extractNoun(data[1])
data1
data2 <- extractNoun(data)
data2
data3 <- intersect(data2,data)
data3

data4 <- union(data1,'end')
data4

data5 <- matrix(data2[[1]],nrow=305,byrow=T)
data5

