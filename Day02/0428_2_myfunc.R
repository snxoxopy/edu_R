
a <- 10
b <- 20

myMax<-function(x, y){
  max = x
  if(max < y){
    max = y
  }else{
    max = x
  }
  cat("max=", max)
  return(max)
}

#main

c <- 100
d <- 200
result = myMax(c, d)
print(result)

mysum<-function(...){
  #return(sum(...))
  return(sum(c(...)))
}

mysum(1,2,3,4,5,6)

myfunc<-function(name, age=0, dept){
  cat("이름: ", name)
  cat("나이: ", age)
  cat("학과: ", dept)
}


myfunc(name="유수진", dept="전자")
