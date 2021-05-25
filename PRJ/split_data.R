# split genre
df_genre <- data.frame(strsplit(df_movies$genres, "|", fixed=TRUE))
df_genre <- df_movies$genres
df_genre
sp_genre <- strsplit(df_genre, "|")


for (genre in length(df_genre))
{
  sp_genre <- strsplit(genre, "|")
}


head(sp_genre)

df_genre
?strsplit

m <- read.csv('movies.csv',header=T)
library(data.table)
m_new <- data.table()
n <- nrow(m) # total number of rows
n


for (i in 1:n)
{
  
  print(i) # to check progress
  
  name_index <- as.character(m[i, 1])
  item_index <- as.character(m[i, 3])
  
  item_index_split_temp <- data.frame(strsplit(item_index, split = '\\|'))
  m_temp <- data.frame(cbind(name_index, item_index_split_temp))
  
  names(m_temp) <- c("name", "item")
  
  m_new <- rbind(m_new, m_temp)
}
?rbind

# .csv 파일저장
#        mvid
#rating

#         genre
# movieid


