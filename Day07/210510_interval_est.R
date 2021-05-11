# 04. 구간추정
## 추정통계학
### 1) 점추정
### 2) 구간추정 = 신뢰도 + 구간추정 값
#ex) 모수(모평균)은 78~82점 사이에 졲재핛 가능성이 95%
# 신뢰구간의 의미: 표본의 평균이 모집단의 평균이 될 확률
# 95% 싞뢰구갂 : 싞뢰수준 1 − 𝛼 가 0.95인, 즉 𝛼를 0.05로 하는 싞뢰구갂


# 구간추정 실습예제 P146
s_head <- c(520, 498, 481, 512, 515, 542, 520, 518, 527, 526)
e_head <- mean(s_head)
e_head


n = 10
summation <- sum((s_head - e_head)^2)
s_sigma = sqrt(summation/(n-1))
s_sigma


p <- (s_head - e_head) / s_sigma
p
table(p)

#https://m.blog.naver.com/PostView.nhn?blogId=lchry&logNo=220477597918&proxyReferer=https:%2F%2Fwww.google.com%2F
t_25 <- 2.262

p1 <- e_head - t_25 * sigma/sqrt(n)
p2 <- e_head + t_25 * sigma/sqrt(n)
p1
p2

#1-alpha =0.95 
#0.95 = 
#alpha 

