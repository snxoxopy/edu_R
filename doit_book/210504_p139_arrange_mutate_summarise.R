#p139 6-4 순서대로 정렬하기
df_exam %>% arrange(desc(math))
exam %>% arrange(class, math)

#p142 파생변수 추가하기
setwd('C:\\r_suzin\\doit_resources')
getwd()
df_exam <- read_excel('excel_exam.xlsx')
df_exam <- read.csv("csv_exam.csv")
df_exam %>% 
  mutate(total = math + english + science) %>% 
  head

df_exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

#p141 혼자서해보기
df_mpg <- as.data.frame(ggplot2::mpg)

#q1.
df_mpg %>% filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)


#p144 혼자서해보기
#q1.
mpg_new <-df_mpg
df_mpg <- df_mpg %>% 
  mutate(totfuel = hwy + cty) %>% 
  head

#q2.
df_mpg <- df_mpg %>% 
  mutate(avgfuel = (hwy + cty)/2) %>% 
  head

#q3.
df_mpg %>%
  mutate(total = hwy + cty, mean = (total)/2) %>% 
  arrange(desc(avgfuel)) %>% 
  head(3)

#q4.
df_mpg %>% 
  mutate(total = hwy+cty, mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)


#p145 집단별로 요약하기
# 집계함수의 특성, vector -> scalar
df_exam %>% summarise(mean_math = mean(math))

df_exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

#여려 요약통계량을 한번에
df_exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            med_math = median(math),
            cnt_math = n())

#피벗데이블 통계량
df_mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

# dplyr 조합하기 p148
df_mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>%
  mutate(avg_fuel = (cty+hwy)/2) %>%
  summarise(avg_tot = mean(avg_fuel)) %>% 
  arrange(desc(avg_tot)) %>% 
  head(5)


# 혼자해보기 p150
#q`~2`
df_mpg %>% 
  group_by(class) %>% 
  summarise(avg_cty = mean(cty)) %>%
  arrange(desc(avg_cty))

#q3.
df_mpg %>% 
  group_by(manufacturer) %>% 
  summarise(avg_hwy = mean(hwy)) %>% 
  arrange(desc(avg_hwy)) %>% 
  head(3)

#q4.
df_mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>%
  summarise(cnt = n()) %>% 
  arrange(desc(cnt))

