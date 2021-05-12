setwd('C:\\r_suzin\\Data\\Part-III')
data <- read.csv('one_sample.csv')
head(data)

View(data)


# 1. 모집단 귀무가설 수립
# 2. 샘플 구간추정
# 3. p-value 값 해석
# 4. 귀무가설을 기각하고 대립가설을 선택하는 것이 목적
# 5. p-value 값이 낮을 수록 대립가설을 선택하는 것이 타당함
# p-value 값 < 0.05 일 경우 모집단의 귀무가설 기각 가능

# p191 연구환경
# 귀무가설: 기존 불만율과 현재 불만율이 차이가 없다.

x <- data$survey
str(data)
summary(x)  # na표기 해줌, 결측치 확인
length(x)
table(x)    # na를 확인해주지 않음 0: 불만족, 1: 만족

#install.packages("prettyR") #freq를 사용하기 위함
library(prettyR)
freq(x) # na를 표기해 주는 함수

#이항분포 비율검정

binom.test(c(136,14), p=0.8)
binom.test(136, 150, p=0.8)
binom.test(136, 150, p=0.8, alternative = "two.sided", conf.level = 0.95)

# p-value = 0.0006735 -> 이항분포도를 따르고있는 데이터, 귀무가설을 기각할 발생할 오류 0.06%
# 결론: 만족도가 80%가 아니다. (80% 이상, 이하 유무는 알 수 없음)
# 위는 양측검정이다. 양끝에 있는 0.025구간을 뺀 구간을 대상으로 검정
# 모수에 대한 통계량이 아니다라고 설명. -> 대립가설이 채택 80%가 아니다.

# 귀무가설: sample data가 모집단을 벗어난다는 가설 -> 모집단 가설이 잘 못됨을 증명
# 기각했을 때 오류 발생률이 작아야 기존 모집단
# p-value: 값이 낮을 수록 가설에 대한 오류가 