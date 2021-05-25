setwd('C:\\r_suzin\\PRJ\\data')
df_movie <- read.csv("movies.csv")

summary(is.na(df_mvs))
# year 항목 67개 결측치 발견
# 원인
# > summary(is.na(df_mvs))
# budget         company         country         director      
# Mode :logical   Mode :logical   Mode :logical   Mode :logical  
# FALSE:6820      FALSE:6820      FALSE:6820      FALSE:6820     
# 
# genre           gross            name           rating       
# Mode :logical   Mode :logical   Mode :logical   Mode :logical  
# FALSE:6820      FALSE:6820      FALSE:6820      FALSE:6820     
# 
# released        runtime          score            star        
# Mode :logical   Mode :logical   Mode :logical   Mode :logical  
# FALSE:6820      FALSE:6820      FALSE:6820      FALSE:6820     
# 
# votes           writer           year        
# Mode :logical   Mode :logical   Mode :logical  
# FALSE:6820      FALSE:6820      FALSE:6753  # TRUE :67     



summary(df_mvs["budget"] == 0)
?which
df_mvs[which(df_mvs["budget"] == 0),7]

# for bud in df_mvs["budget"]
# bud

if (df_mvs["budget"] == 0)
  df_mvs["name"]


complete.cases(df_mvs)
df_mvs[!complete.cases(df_mvs), ]
trans_data <- function(budget, company, country, director, genre,
                       gross, name, rating, released, runtime,
                       score, star, votes, writer, year){
  
  data.frame(budget=budget, company=company, country=country,
             director=director, genre=genre, gross-gress,
             name=name, rating=rating, released=released,
             runtime=runtime, score=score, star=start, votes=votes,
             writer=writer, year=year)
}

rm_na_mvs <- function(budget, company, country, director, genre,
                             gross, name, rating, released, runtime,
                             score, star, votes, writer, year){
  
  data.frame(budget=budget, company=company, country=country,
             director=director, genre=genre, gross-gress,
             name=name, rating=rating, released=released,
             runtime=runtime, score=score, star=start, votes=votes,
             writer=writer, year=year)
}


library(rpart)
library(caret)
idx <- rpart()