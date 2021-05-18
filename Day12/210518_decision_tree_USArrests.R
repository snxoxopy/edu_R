# 3대 체포수/10만명
data("USArrests")
str(USArrests)

# statistics about violent crime rates by us state.
# Murder: Murder arrests (per 100,000) :살읶
# Assault: Assault arrests (per 100,000) : 폭행
# UrbanPop: Percent urban population # target으로 사용
# Rape: Rape arrests (per 100,000) : 강간


# 'data.frame':	50 obs. of  4 variables:
# $ Murder  : num  13.2 10 8.1 8.8 9 7.9 3.3 5.9 15.4 17.4 ...
# $ Assault : int  236 263 294 190 276 204 110 238 335 211 ...
# $ UrbanPop: int  58 48 80 50 91 78 77 72 80 60 ...
# $ Rape    : num  21.2 44.5 31 19.5 40.6 38.7 11.1 15.8 31.9 25.8 ...


head(USArrests)

# Murder Assault UrbanPop Rape
# Alabama      13.2     236       58 21.2
# Alaska       10.0     263       48 44.5
# Arizona       8.1     294       80 31.0
# Arkansas      8.8     190       50 19.5
# California    9.0     276       91 40.6
# Colorado      7.9     204       78 38.7

library(rpart)

summary(lm(UrbanPop ~., data=USArrests))

t1 <- rpart(UrbanPop ~., data = USArrests)
t1

#n= 50 
#
# node), split, n, deviance: (편차)^2? 분산, yval:평균 
# * denotes terminal node
# 
# 1) root 50 10266.4200 65.54000            # Urban  
# 2) Rape< 17.55 21  4368.9520 58.04762     # 21/50(UrbanPop)
#   4) Assault< 94 9  1100.0000 50.66667 *    
#   5) Assault>=94 12  2410.9170 63.58333 *
# 3) Rape>=17.55 29  3864.9660 70.96552     # 29/50(UrbanPop)
#   6) Murder>=12.45 7   847.7143 64.42857 *
#   7) Murder< 12.45 22  2622.9550 73.04545  
#     14) Rape< 21.2 7  1018.8570 69.14286 *
#     15) Rape>=21.2 15  1447.7330 74.86667 *
# UrbanPop -> 연속형 변수 -> Regression Tree
# F통계량 확인목적: 집단 간 분산 값을 크게, 집단 내 분산을 작게

table(t1)

?rpart

summary(t1)

hist(USArrests$UrbanPop)
plot(sort(USArrests$UrbanPop))
plot(t1, margin=0.2)
nrow(USArrests)

rpart.plot(t1)
text(t1,cex=0.8)
plot(USArrests$Rape, USArrests$Murder, col = ifelse(USArrests$UrbanPop>median(USArrests$UrbanPop), "blue", "lightblue"),pch=19)
