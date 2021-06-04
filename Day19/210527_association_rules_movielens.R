library(recommenderlab)
library(reshape2)
#install.packages("data.table")
library(data.table)#sp
library(ggplot2)
#install.packages("DT")
library(DT)
library(stringr) 
library(arules)
library(arulesViz)


setwd('C:\\r_suzin\\PRJ\\data\\ml-latest-small')
df_movies<- read.csv('movies.csv', stringsAsFactors = FALSE)
df_genre <- as.data.frame(df_movies$genre, stringsAsFactors = FALSE)

View(df_genre)
df_sp_genre <- as.data.frame(tstrsplit(df_genre[,1], "[|]", type.convert=TRUE))

View(df_sp_genre)

write.csv(df_sp_genre, 'C:\\r_suzin\\PRJ\\data\\ml-latest-small\\split_genre.csv')
?write.csv


trn_movies <- read.transactions("split_genre.csv", fotmat="single", sep=",",cols())
result_rules <- apriori(Groceries,
                        parameter = list(support=0.005, confidence=0.5, minlen=2))
