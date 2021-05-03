#p133 혼자서 해보기
#Q1.
df_mpg <- as.data.frame(mpg)
str(df_mpg)

mpg_under4 <-  filter(df_mpg,df_mpg$displ<=4)
mpg_over5 <- filter(df_mpg, df_mpg$displ>=5)

mpg_mean_under4 <- mean(mpg_under4$displ)
mpg_mean_over5 <- mean(mpg_over5$displ)
mpg_mean_over5
mpg_mean_under4
# mpg_mean_over5 > mpg_mean_under4

#q2.

df_audi <- filter(df_mpg, manufacturer == "audi")
df_toyota <- filter(df_mpg, manufacturer == "toyota")
str(df_audi)

mean_audi_cty <- mean(df_audi$cty)
mean_toyota_cty <- mean(df_toyota$cty)
answer <- ifelse(mean_audi_cty>mean_toyota_cty, "audi", "toyota")
answer

#q3.
df_cfg <- filter(df_mpg, manufacturer %in% c("chevrolet","ford","honda"))
mean(df_cfg$cty)
