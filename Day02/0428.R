x <- '2021-04-28'
class(x)
x+10 # Error

as.Date('2021-04-27')
y <- as.Date(x)
class(y)
y+40

seq1 <- 1:5

vec1 <- c(1,2,3,4,5,5.5)
class(vec1)
vec1
vec2 <- c(1,TRUE)
class(vec2)
vec2

vec1[-2]
vec1[-1:-2]

for(n in vec1){
  print(n)
}


var1 <- 30
var2 <- 40

if(var1 > var2){
  cat("큰 수는 =", var1)
}else if(var1 == 50){
  print("var1 is 50")
}else{
  cat("큰 수는 =", var2)
}

ifelse(var1 > var2, var1, var2)

#emp_name = scan(what=character())
emp_name = "유수진"
switch(emp_name, "유수진"=30, "진수유"=40, "수진유"=50)
name <- c("유수진", "수진유")
which(name == "유수진") # index 반환

idx <- 0
for (n in name){
  idx <- idx + 1
  if (n == "유수진"){
    print(idx)
  }
}
