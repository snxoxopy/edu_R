library(recommenderlab)
library(reshape2)
#install.packages("data.table")
library(data.table)
library(ggplot2)
#install.packages("DT")
library(DT)

library(stringr) #sp

setwd('C:\\r_suzin\\PRJ\\data\\ml-latest-small')
df_movies<- read.csv('movies.csv', stringsAsFactors = FALSE)
df_tags <- read.csv('tags.csv')
df_ratings <- read.csv('ratings.csv')

str(df_movies)
str(df_tags)
datatable(df_movies)

# as.data.frame(df_tags,stringsAsFactors = FALSE)
df_genre <- as.data.frame(df_movies$genre, stringsAsFactors = FALSE)

df_sp_genre <- as.data.frame(tstrsplit(df_genre[,1], "[|]", type.convert=TRUE))

str(df_sp_genre)

colnames(df_sp_genre) <- c(1:10)

list_genre <- c("Action", "Adventure", "Animation", "Children", "Comedy", "Crime",
                "Documentary", "Drama", "Fantasy",
                "Film-Noir", "Horror", "Musical", "Mystery", "Romance",
                "Sci-Fi", "Thriller", "War", "Western")

genre_mat1 <- matrix(0,9743,18)
genre_mat1[1,] <- list_genre
View(genre_mat1)
colnames(genre_mat1) <- list_genre

for (index in 1:nrow(df_sp_genre)){
  for(col in 1:ncol(df_sp_genre)){
    gen_col = which(genre_mat1[1,] == df_sp_genre[index,col])
    genre_mat1[index+1, gen_col] <- 1
  }
}

genre_mat2 <- as.data.frame(genre_mat1[-1,], stringsAsFactors = FALSE)


for (col in i:ncol(genre_mat2)){
  genre_mat2[,col] <- as.integer(genre_mat2[,col])
}

str(genre_mat2)

SearchMovie <- cbind(df_movies[,1:2], genre_mat2[]) # 

head(SearchMovie)

# movieId                              title Action Adventure Animation Children Comedy Crime Documentary
# 1       1                   Toy Story (1995)      0         1         1        1      1     0           0
# 2       2                     Jumanji (1995)      0         1         0        1      0     0           0
# 3       3            Grumpier Old Men (1995)      0         0         0        0      1     0           0
# 4       4           Waiting to Exhale (1995)      0         0         0        0      1     0           0
# 5       5 Father of the Bride Part II (1995)      0         0         0        0      1     0           0
# 6       6                        Heat (1995)      1         0         0        0      0     1           0
# Drama Fantasy Film-Noir Horror Musical Mystery Romance Sci-Fi Thriller War Western
# 1     0       1         0      0       0       0       0      0        0   0       0
# 2     0       1         0      0       0       0       0      0        0   0       0
# 3     0       0         0      0       0       0       1      0        0   0       0
# 4     1       0         0      0       0       0       1      0        0   0       0
# 5     0       0         0      0       0       0       0      0        0   0       0
# 6     0       0         0      0       0       0       0      0        1   0       0

#dcast data.table
ratingMatrix <- dcast(df_ratings, userId~movieId, value.var = "rating", na.rm = FALSE)
ratingMatrix <- as.matrix(ratingMatrix[,-1]) # remove userID

View(ratingMatrix)
#ratingMatrix <- as.matrix(ratingMatrix)

class(ratingMatrix)

ratingMatrix <- as(ratingMatrix, "realRatingMatrix")
ratingMatrix
View(ratingMatrix)
View(ratingMatrix[1:4, ])
class(ratingMatrix)

rec <- Recommender(ratingMatrix, method="POPULAR")

# Model
# 알고리즘에서 
recommendation_model <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")

names(recommendation_model)
lapply(recommendation_model, "[[", "description") # 모델설명 텍스트처리

recommendation_model$IBCF_realRatingMatrix$parameters

similarity_mat <- similarity(ratingMatrix[1:4, ], method = "cosine", which = "users")
#?similarity

as.matrix(similarity_mat)
image(as.matrix(similarity_mat), main = "user's similarity")

movies_simi <- similarity(ratingMatrix[, 1:4], method = "cosine", which = "items")
as.matrix(movies_simi)
image(as.matrix(movies_simi), main = "movie similarity")
# > as.matrix(movies_simi)
# 1         2         3         4
# 1 0.0000000 0.9644641 0.9715415 0.9838699
# 2 0.9644641 0.0000000 0.9389013 0.9609877
# 3 0.9715415 0.9389013 0.0000000 1.0000000
# 4 0.9838699 0.9609877 1.0000000 0.0000000



rating_values <- as.vector(ratingMatrix@data) # @= $의미와 같음
unique(rating_values)
# 1] 4.0 0.0 4.5 2.5 3.5 3.0
# 7] 5.0 0.5 2.0 1.5 1.0

table_rating <- table(rating_values)
table_rating


# rating_values
# 0     0.5       1     1.5       2     2.5       3     3.5 
# 5830804    1370    2811    1791    7551    5550   20047   13136 
# 4     4.5       5 
# 26818    8551   13211 



# most viewed movies visualization

library(ggplot2)
movie_views <- colCounts(ratingMatrix) # Count views for each movie
#names(movie_views)
table_views <- data.frame(movie = names(movie_views),
                           views = movie_views) # create dataframe of views
table_views <- table_views[order(table_views$views,
                                 decreasing = TRUE), ] # sort by number of views
# Total views of the top films생략

# table_views$title <- NA
# 현재 forrest gump 문제
# for (index in 1:9743){
#   table_views[index, 3] <- as.character(subset(df_movies, df_movies$movieId == table_views[index,1]))
# }
# table_views[1:6,]
# 
# ggplot(table_views[1:6,])
# geom_bar(stat="identity", fill="steelblue",)
# geom_text(aes(label=views), value = -0.3, size = 3.5)
# theme(axis.text = element_text(angle = 45, hjust = 1))
# ggtitle("Total views of the top films")
# 


image(ratingMatrix[1:30,1:30], axes=FALSE, main = "10 x 10 heatmap")

# 1. select usefull data
# 2. normalize
# 3. binarize

# 1. select usefull data
movie_ratings <- ratingMatrix[rowCounts(ratingMatrix) > 50, colCounts(ratingMatrix) > 50]
movie_ratings

# this bunch of code finds a heaatmap of top user and movies
minimum_movies <- quantile(rowCounts(movie_ratings), 0.98)
minimum_users <- quantile(colCounts(movie_ratings), 0.98)
image(movie_ratings[rowCounts(movie_ratings) > minimum_movies,
                    colCounts(movie_ratings) > minimum_users],
      main = "Heatmap of the top users and movies")


# a dist. of average rating of users

average_ratings <- rowMeans(movie_ratings)
class(average_ratings)

qplot(average_ratings, fill=I("steelblue"), col=I("red")) +
  ggtitle("A distribution of the average rating per user")


# 2. normalize

normalized_ratings <- normalize(movie_ratings)
sum(rowMeans(normalized_ratings) > 0.00001)

# heatmap of normalized value
image(normalized_ratings[rowCounts(normalized_ratings) > minimum_movies,
      colCounts(normalized_ratings) > minimum_users],
      main = "Normailized ratings of the top users")


# 3. Binarize means 0 and 1 we will recommend if rating of that movie is greater than 3.5

bin_min_movies <- quantile(rowCounts(movie_ratings), 0.90)
bin_min_users <- quantile(colCounts(movie_ratings), 0.95)

movies_watched <- binarize(movie_ratings, minRating = 1)
good_rated_films <- binarize(movie_ratings, minRating = 3)
image(good_rated_films[rowCounts(movie_ratings) > bin_min_movies, colCounts(movie_ratings)> bin_min_users],
    main = "Heatmap of the top users and movies")

# filtering sys
sampled_data <- sample(x= c(TRUE, FALSE),
                       size = nrow(movie_ratings),
                       replace = TRUE,
                       prob = c(0.8, 0.2))

training_data <- movie_ratings[sampled_data,]
testing_data <- movie_ratings[!sampled_data]

recommendation_system <- recommenderRegistry$get_entries(datatype = "realRatingMarix")
recommendation_system$IBCF_realRatingMarix$parameters

recommen_model <- Recommender(data = training_data,
                             method = "IBCF",
                             parameter = list(k=60))
# recommen_model
# 
# Recommender of type ‘IBCF’ for ‘realRatingMatrix’ 
# learned using 301 users.

info <- getModel(recommen_model)
View(info)
class(info$sim)

top_items <- 20
image(info$sim[1:top_items, 1:top_items],
      main = "Heatmap of the first rows and colunms")
