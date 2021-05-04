# p160 분석 도전

df_exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

library(ggplot2)
library(dplyr)
         
df_midwest <- as.data.frame(ggplot2::midwest)
str(df_midwest)

#p160
#q1
df_midwest<- df_midwest %>% 
  mutate(adptot = (poptotal - popadults)/poptotal * 100)

#q2.
df_midwest %>% 
  arrange(desc(adptot)) %>% 
  select(county, adptot) %>% 
  head(5)

#q3.
df_midwest <- df_midwest %>%
  mutate(grade = ifelse(adptot >= 40, "large", ifelse(adptot<40 & adptot >=30, "middle", "small")))


table(df_midwest$grade)

#q4.
df_midwest %>% 
  mutate(asianptot = (popasian/poptotal) * 100) %>% 
  arrange(asianptot) %>% 
  select(state, county, asianptot) %>% 
  head(10)

