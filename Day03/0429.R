vec1<-seq(1:9)
rm(list=ls())
?rm

x<-'2021-01-01'
#as data형태를 바꿔주는 객체
#Date: Method
as.Date(x) + 15
#R은 모든 데이터를 객체로 다룸
#사용자 정의
# 메모리 미리 할당 불가능
# stack에 할당불가
# Heap에 할당 -> Heap은 영역이 구분되지 않은 메모리 여역
obj<-as.Date(x)+15
class(obj)

mat0 <- c(1,2,3,4)
mat0
mat1 <- matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4), nrow=2)
mat2
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=T)
mat3
mat4 <-  matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=T)
mat4

mat4 <- rbind(mat4,c(11,12,13))
mat4

mat5 <- matrix(c('a','b','c','d'), nrow=2, byrow=T)
mat5

mat5 <- cbind(mat5,c('e','f'))
mat5
