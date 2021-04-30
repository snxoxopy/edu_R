# R 64bit 실행(rstudio 실행도 가능)
# java, rJava 설치 install.packages("multilinguer")

install.packages("multilinguer")
#Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk-16.0.1')

#install rtools

# 이때 mac 사용자는 데스크탑 비밀번호를 물어봅니다. 입력해줘야 설치가 진행됩니다.

library(multilinguer)

#install_jdk()

# 위 함수에서 에러가 발생하면 알려주세요

# https://github.com/mrchypark/multilinguer/issues


# 의존성 패키지 설치

install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")


# github 버전 설치

install.packages("remotes")

# 64bit 에서만 동작합니다.

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
install.packages("KoNLP")
library(KoNLP)
