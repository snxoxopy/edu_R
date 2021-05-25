

library(dplyr)

df_ratings <- read.csv("ratings.csv", header =T)
df_ratings_means<-df_ratings %>% group_by(movieId) %>% summarise(mean_rating = mean(rating), n=n())
View(df_ratings_means)
barplot(df_ratings_means$mean_rating~df_ratings_means$movieId)


