# 라벨을 달고 싶을 때,
women
height = women$height
plot(height)
weight = women$weight
plot(weight)
plot(height,weight,xlab="키",ylab="몸무게")


# 교과서 5장 차트 프로그래밍
# 부서별 영업 실적
x = c(9,15,20,6)
label = c("영업1팀","영업2팀","영업3팀","영업4팀")

pie(x,labels=label,main="부서별 영업 실적")
#아마도 시계 반대방향으로 차례로 만들어 주는 것 같습니다
pie(x,labels=label,init.angle=90,main="부서별 영업 실적")

# 퍼센트를 표시하고 싶습니다
# round 반올림 ceiling 올림 
ptc = round(x/sum(x)*100)

#라벨에 ptc를 붙여주고자 합니다 paste
label = paste(label,ptc)
label= paste(label,"%",sep="")  # 이렇게 해야 딱 붙는다
pie(x,labels=label,init.angle=90,main="부서별 영업 실적")

# 3D로 나타내기 p.122
install.packages("plotrix")
library(plotrix)
pie3D(x,labels=label,explode = 0.1,labelcex = 0.8, main="부서별 영업 실적")

#막대 그래프
barplot(x,names.arg=label,main="부서별 영업 실적")
#col=rainbow(length(x)) 구분되는 색깔 4가지로 자동으로 그려줍니다
barplot(x,names.arg=label,main="부서별 영업 실적",col=rainbow(length(x)))

barplot(x,names.arg=label,main="부서별 영업 실적",col=rainbow(length(x)),
        xlab="부서",ylab="영업실적(억원)")

# r의 내장 된 데이터 중 지진에 관련된 데이터 이용

quakes
head(quakes)
mag = quakes$mag

# 히스토그램 그리기
# 컬러등은 보지 않습니다
hist(mag,main="지진 발생강도의 분포",xlab="지진강도",ylab="발생건수")

# breaks는 4 ~ 6.5까지 0.5 간격으로 나눠 나타내라
hist(mag,main="지진 발생강도의 분포",xlab="지진강도",ylab="발생건수",
     col=rainbow(7),breaks=seq(4,6.5,by=0.5))

