#Data.frame

no <- c(1,2,3,4)
name <- c('Apple','Peach','Banana','Grape')
price <- c(500,200,100,50)
qty <- c(5,2,4,7)
sales <- data.frame(NO=no,NAME=name,PRICE=price,QTY=qty)
sales

sales2 <- matrix(c(1,'Apple',500,5,
                   2,'Peach',200,2,
                   3,'Banana',100,4,
                   4,'Grape',50,7),nrow=4,byrow=T)
sales2
sales2[1,3]
sales2[1,]
sales2[,3]
sales2[c(1,2),]
sales2[,c(1,2)]
sales2[,c(1:3)]
sales2[,c(2,3)]
sales2[c(1,3),c(1,2)]
sales2[c(1:3),c(1,2)]

subset(sales,qty<5)
subset(sales,name=='Peach')
