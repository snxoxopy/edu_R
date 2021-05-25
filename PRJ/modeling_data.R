
install.packages("recommenderlab")
library(recommenderlab)
library(tidyr)
data_packages <- data(package = "recommenderlab")
data_packages$results[, c("Item", "Title")]


as(Jester5k, "matrix")[1:10, 1:10]

set.seed(2017)
index <- sample(1:nrow(Jester5k), size = nrow(Jester5k) * 0.7)

train <- Jester5k[index, ]
class(train)
df_train <- 
test <- Jester5k[-index, ]




dim(train) 

as()

data(Jester5k)
class(Jester5k)
str(data_packages)
View(data_packages)
View(Jester5k)
# 해당 데이터는 1999년 4월부터 2003년 5월까지 Jester Online Joke 추천인 시스템에서 수집한 5,000명 사용자의 샘플을 포함하고 있습니다.
# 5,000명의 사용자와 100개의 농담을 포함한 평가 행렬이며 평가값의 범위는 -10~10 사이 값을 갖습니다. 선택된 모든 사용자는 최소 36개의 농담에 대해서 평가를 합니다.
# 실제 농담 데이터는 JesterJokes에 포함되어 있습니다.
# hist(getRatings(Jester5k), main = "Distribution of ratings")

## 

recommender_models <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")
recommender_models
View(recommender_models)

recomm_model <- Recommender(data = train, method = "UBCF")
recomm_model

df_ratings <- read.csv("ratings.csv", header =T)
str(df_ratings$rating)
str(df_ratings)
summary(df_ratings)
str(unique(df_ratings$movieId))

library(dplyr)

?gather


str(df_UserID_ratings)
unique(df_UserID_ratings$userID)
str()
unique(df_UserID_ratings$movieId)

df_mvtrain <- gather(df_UserID_ratings, key='key', value='value', )


str(df_mvtrain)
View(df_mvtrain)
as(df_ratings,"matrix")[1:3,1:3]

str(df_UserID_ratings)
View(df_UserID_ratings)

df_train <- df_ratings %>% select(c(1:3))
str(df_train)
head(df_train)
str(unique(df_ratings$movieId)) #9724
str(unique(df_ratings$userId)) #610
str(df_ratings$rating) #100836



## 

table(rowCounts(df_train$))
