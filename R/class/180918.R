# 7. 데이터 프레임

name <- c('a','b','c','d')
sex <- c('f','f','f','m')
occup <- c('t','y','z','k')
age <- c(13,5,67,43)

member <- data.frame(name,age,sex,occup)
name[3]
member[1] # 1행 출력
member[1,] # 1열 출력
member[,1] # == member[1]
member$name

member[2,3] <- 'm' # 2행 3 열 요소를 m으로 변경

# 8. 파일 읽어오기
#lungdata <- read.csv(file.choose(),header = TRUE)
lungdata <- read.table(file.choose(),header = TRUE) # text 파일은 table로 불러와야 합니다
lungdata
lungdata[1]
max(lungdata$국어)
head(lungdata) # 앞에서부터 6개의 데이터를 불러옵니다
tail(lungdata) # 뒤 6개의 데이터를 불러옵니다
str(lungdata)

# 주사위 던지기 시뮬레이션
# uniform Distribution Simulate
runif(100) # 0부터 1까지 랜덤한 수 출력 (확률이 같을 때)
runif(10)*6
runif(100)*6
ceiling(runif(10000)*6) # 0~1 랜덤한 10000개의 숫자를 반올림하여 1~6 까지 랜덤하게 줍니다
ceiling(runif(10)*6) # 확률이 같을 때, 1~6까지 주사위가 있으므로 6을 곱해줍니다

dice <- ceiling(runif(10000)*6)
table(dice) # 1~6까지 각각 몇번 나왔는지 출력해줍니다

barplot(table(dice)) # 막대그래프로 그려줍니다
# runif 횟수가 많아질수록 1~6까지의 확률이 비슷해지는 것을 확인할 수 있습니다

# 변수 사요
roll <- 100
runif(roll)*6
dice <- ceiling(runif(roll)*6)
table(dice)
barplot(table(dice))용

# 10. 두개의 주사위를 던졌을 때 눈금의 합 확률
# sum of two dice

roll <- 10000
dice <- ceiling(runif(roll)*6) + ceiling(runif(roll)*6) # 2~ 12까지의 수 중에 랜덤으로 나옵니다
table(dice)
a <- table(dice)
barplot(a)


# 과제
#1 50명의 국어,수학,영어 점수 엑셀 자료를 이용
# 1) 국어,수학,영어의 각각 평균을 구한다
# 2) 50명 중 1등의 점수, 이름 출력
#2 3개의 주사위를 던졌을 때 눈금의 합이 나올 확률을 구하시오
roll <- 10000
dice <- ceiling(runif(roll)*6) + ceiling(runif(roll)*6) + ceiling(runif(roll)*6)
barplot(table (dice))

# 산포도 표준편차 ..
a <- c(1,2,3,4,100)
mean(a) # 산포도가 크기때문에 역할을 잘 못한다
var(a) # 숫자가 클 수록 자료들의 값이 많이 떨어져있다는 것을 의미합니다
sd(a)

# 행렬 이름 (해보기)
rownames(x) <- c ("1행","2행","3행","4행") # 행의 이름을 변경하거나 추가하고자 할 때
colnames(x) <- c ("1열","2열","3열","4열") # 열의 이름을 변경하거나 추가하고자 할 때

# 리스트 (해보기)
x <- list("홍길동","2016001",20,c("IT융합","데이터 관리"))

# 행/열 추가와 요소값 보기

cbind(x,학과=c("전산학","경영학")) # 데이터프레임 x에 열추가
rbind(성명="장발장",나이=40,주소="파리",학과="전산학") #행추가

#함수만들기 예습해보기
