setwd('C:\\r_suzin\\PRJ\\open\\open')
df_sub <- read.csv('sample_submission.csv')
df_test <- read.csv('test.csv')
df_train <- read.csv('train.csv')
str(df_test)
is.na(df_test)
is.na(df_test$DAYS_EMPLOYED)
summary(df_test$DAYS_EMPLOYED)

install.packages("lubridate")
library("lubridate")

df_mv_lns <- read.table("movies.dat")
?read.table


setwd('C:\\r_suzin\\PRJ\\data\\ml-1m\\ml-1m')
df_movies <- read.csv('movies.dat')

setwd('C:\\r_suzin\\PRJ\\data\\archive')
df_movies <- read.csv('movies.csv')

library(jsonlite)

fromJSON(json_text)
json_text <- df_movies$belongs_to_collection
json_text <- df_movies$genres

class(json_text)
class

library(jsonlite)
fromJSON(json_text)

setwd('C:\\r_suzin\\PRJ\\ref')
df_cycle <- read.csv('공공자전거 이용정보(일별)_2020.07_12.csv')
str(df_cycle)
is.na(df_cycle)

library(jsonlite)

fromJSON(json_text)

data = fromJSON("exjson.json")
data


print(data)
View(data)
install.packages('read.table')
library(readxl)
library(read.table)
??fread

setwd("C:\\r_suzin\\PRJ\\data\\ml-latest-small")
df_movies <- read.csv("movies.csv")
df_ratings <- read.csv("ratings.csv")
df_tags <- read.csv("tags.csv")
df_links <- read.csv("links.csv")

summary(df_movies)
# movieId title genres
summary(df_ratings)
summary(is.na(df_ratings))
# userId movieId rating timestamp
summary(df_tags)
summary(is.na(df_tags))
# userId movieId tag timestamp
summary(df_links)
summary(is.na(df_links))
which(is.na(df_links$tmdbId))
#movieId imdbId tmdbId
# tmdbId NA 8개 존재 
# [1]  625  844 2142 3028 5533 5855 6060 7383
# ex) 791,0113610,
# ex) 1107,0102336,
# -> 값이 없음
View(df_links)
head(df_links$imdbId) # an identifier for movies
３

unique(df_movies$genres)
table(df_tags$tag)


table(df_movies$genres)



df_movies$genre