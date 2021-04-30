
date1 = as.Date('2021-01-01'); date1
date2 = as.Date('2021-01-31'); date2
date4 = seq(from=date1, to=date2, by=1)
date5 = seq(date1, date2, 1)
print(date4)
print(date5)

vect <- c('사과','배','감','버섯','고구마')
vect[-3]

vec1 <- c('봄','여름','가을','겨울')
vec2 <- c('봄','여름','초여름','초가을')

cat(vec1, vec2)
union(vec1, vec2)

vec1[-which(vec1 %in% vec2)]
setdiff(vec1, vec2)
#vec2[-which(vec2 %in% vec1)]

vec1[which(vec1 %in% vec2)]
intersect(vec2, vec1)