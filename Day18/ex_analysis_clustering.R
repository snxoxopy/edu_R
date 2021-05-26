setwd("C:\\r_suzin\\Data\\MLData")
df_acdm <- read.csv("academy.csv")

library(cluster)

hcl <- hclust(dist(df_acdm)^2, method="single")
plot(hcl, hang=-1, xlab="student", ylab="distant")

library(graphics)
kms <- kmeans(df_acdm, 5)
kms

str(kms)


# K-means clustering with 5 clusters of sizes 8, 14, 10, 9, 11
# 
# Cluster means:
#   학생번호 국어점수평균 수학점수평균 영어점수평균 과학점수평균 학업집중도
# 1 37.37500     56.12500     75.75000     62.25000     80.12500   66.25000
# 2 17.14286     69.71429     88.50000     69.92857     89.57143   72.14286
# 3 30.30000     89.00000     89.80000     86.50000     90.40000   89.00000
# 4 29.22222     52.66667     48.88889     52.66667     49.33333   62.22222
# 5 24.81818     89.90909     68.27273     84.09091     62.81818   72.72727
# 
# Clustering vector:
#   [1] 5 2 4 2 3 3 2 2 4 5 2 5 5 4 5 2 2 3 2 2 2 2 4 1 2 1 5 3 1 5 2 3 4 5 4 1 2 3 3 1 5 3 5
# [44] 1 4 3 5 1 3 4 4 1
# 
# Within cluster sum of squares by cluster:
#   [1] 2334.125 4266.143 3392.600 7346.000 4915.455
# (between_SS / total_SS =  69.4 %)
# 
# Available components:
#   
#   [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
# [6] "betweenss"    "size"         "iter"         "ifault"      

plot(df_acdm, col = kms$cluster)

# elbow point 구하기
wss <- 0

for (i in 1:10) wss[i] <- sum(kmeans(df_acdm, centers = i)$withinss)

wss
# k를 1-10까지 변화시키면서 각 with을 구한다. 
plot(1:10, wss, type="b", xlab = "Number of Clusters", ylab="Within group sum of squares")





