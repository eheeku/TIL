# 40 ~ 120 까지 300개로 쪼개라
x <- seq(40,120,length=300)

# x 를 가지고 정규 분포 곡선을 그려봅니다
# 정규분포는 평균과 표준편차에 의해 그려진다
y <- dnorm(x,mean=80,sd=10)

# 아주 작아야 그렸을 때 합이 1이 된다

plot(x,y)

# 자료가 300개 했지만, 무수히 많다 생각하고 선으로 나타내고싶다
# line의 이니셜 l을 type에 대입하면 선으로 나타낼 수 있습니다
plot(x,y,type="l")

# 색깔을 넣고싶다면 col 속성을 사용하면 됩니다 
plot(x,y,type="l",col="red")

# 표준편차에 따라 어떻게 달라지는지 확인 해봅니다
y1  <- dnorm(x,mean=80,sd=20)
plot(x,y1,type="l",col="blue")

# type 적기 귀찮으면 lines 함수를 사용하면 됩니다
# 장점은 plot과 다른 함수이기 때문에 두개를 겹쳐서 그릴 수 있다는 것 입니다
lines(x,y1,col="blue")

#pnorm qnorm dnorm에 대해 공부합니다 
#probablity between 65-75
#probablity - 있을법함 
a <- pnorm(75,mean=80,sd=10)
b <- pnorm(65,mean=80,sd=10)
a-b

# the probablity of over 92 
# 92까지의 넓이를 구합니다
c <- pnorm(92,mean=80,sd=10)
#그리고 1에서 a를 빼면 됩니다
1-c # 약 11% 정도 된다는 거 0.115xxxx
#68보다 작은 probablity

# 30% 이하가 되는 지점이 얼마인가
# 전체 100% 에서 30% 이하가 되는 점을 구합니다

qnorm(0.3,mean=80,sd=10) # 30이 아니라 0.3 이라는 점
# 출력 : 74.75xxxx 약 75 정도

# 평균 80을 중심으로 가운데 60 %가 되는 점은 얼마인가
# 가운데 60%니까 평균 80 밑으로는 50% 
# 80% 와 20 % ..?

qnorm(0.2,mean=80,sd=10) # 71.58이 20 %를 나타내는 지점
qnorm(0.8,mean=80,sd=10) # 88이 20%를 나타내는 지점



# 문제

# 어느 대학 학생 토익 성적 평균 500 표준편차 20
x <- seq(0,990,length=300)
y <- dnorm(x,mean=500,sd=20)

plot(x,y)
# 어느 학생의 점수가 510점 이하일 확률
a <- pnorm(510,mean=500,sd=20)
# 약 69 %

# 점수가 480점부터 515점 사이에 있을 확률
a <- pnorm(515,mean=500,sd=20)
b <- pnorm(480,mean=500,sd=20)
a-b
#약 61%

#어떤 학생이 시험에서 523점을 받았을 때, 이 학생보다 높은 점수를 받은 학생은 전체의 몇 %나 될까
a <- pnorm(523,mean=500,sd=20)
1-a # 약 12%

#이 시험에서 상위 15% 만이 면접을 볼 수 있다고 한다면 몇 점 이상을 받아야 하는가
a <- qnorm(0.85,mean=500,sd=20)
a
#약 520.7점 이상 521



#숫자를 입력하여 그 수보다 작은 짝수 출력
n <- function(num){
  a <- 0:num
  answer <- list()
  for(i in a){
    if(i%%2 == 0)
    answer <- append(i,answer)
  }
  print(answer)
}

n(10)

# 3개의 점수를 입력하여 평균을 구하는 함수

my_mean<-function (num1,num2,num3){
  m <- (num1+num2+num3)/3
  print(m)
}
my_mean(10,20,30)


