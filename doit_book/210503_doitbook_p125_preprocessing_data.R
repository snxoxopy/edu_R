#6.자유자재로 데이터 가공하기p125

#1. Preprocessing - dplyr
library(dplyr)

#2. 조건에 맞는 데이터(행)만 추출하기
setwd("C:\\r_suzin\\doit_resources")
exam  <- read.csv("csv_exam.csv")
str(exam)
View(exam)

#pipline 기술: 매개변수를 이용하지 않고 하나의 seq.로 명령 수행
exam %>% filter(class == 1) #filter(exam, class=1)

# %>% 단축키: ctrl + shift + m
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(exam$english <= 80) #pipeline 사용할 경우 english만 써도 됨
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(math>=90 | english <50)

# %in% for in과 구분하기 위함
exam %>% filter(class %in% c(1,3,5))

# %/%: 나눗셈의 몫
# %%: 나눗셈의 나머지
