install.packages("tm")
install.packages("tidyverse")
install.packages("quanteda")

library(tm)
library(readr)
library(tidyverse)
library(quanteda)

c_text <- c("fairy tales", "fairy tale")



df_text <- as.data.frame(cbind(doc = c("doc1", "doc2"), text = c("the quick brown fox jumps over the lazy dog", "The quick brown foxy ox jumps over the lazy god")), stringsAsFactors = F)

df.count1 <- df %>% unnest_tokens(word, text) %>% 
  count(doc, word) %>% 
  bind_tf_idf(word, doc, n) %>% 
  select(doc, word, tf_idf) %>% 
  spread(word, tf_idf, fill = 0) 

setwd("C:\r_suzin\PRJ\data\ml-latest-small")

corpus = readRDS(file=)
