list1 <- list(name=c('James Seo','서진수'),
              address='Seoul' ,
              tel='010-8706-4712',
              pay=500)
list1$name
list1[1]
list1 #list1$name

list1$name
class(list1$name) # charatter 값을 갖고옴
list1[1]
class(list1[1]) #list object를 가져옴
list1[[1]]
class(list1[[1]]) # 값

list1$name <- c('Seojinsu','James Seo')

list1$birth <- as.Date('1994-05-10')
list1
list1$birth <- NULL
list1