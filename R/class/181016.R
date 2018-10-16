# 15,16,17,19장 강의를 중심으로 공부합니다 

# 16. 문자열, 문자순서 바꾸기 함수  
strsplit('How are you?',split='') # 암기  
a <- strsplit('How are you?',split='')
a
class(a)
a[[1]] # 이거 주목하기

# 떨어진거 붙이기
paste(a[[1]])
paste(a[[1]],collapse="") # collapse 알기 

# 뒤에서부터 쪼개서 붙여서 출력하고 싶을 때

a[[1]][1] # H
a[[1]][12] # ?
a[[1]][12:1] # 거꾸로 출력 (중요)

b <- a[[1]][12:1] # 거꾸로 만든거 b에 넣어서 
paste(b,collapse='')  # 거꾸로 되어있는거 붙이기

# 12를 그때그때 세어 볼 수 없으니 어떤 수라도 역으로 출력하는 함수를 만들어봅니다 p.110

reversed_f <- function(string){
  a <- strsplit(string,split = ' ')
  reversed <- a[[1]][nchar(string):1]
  reversed
  paste(reversed,collapse=' ')
}

reversed_f("i am fine")


# length 와 nchar 차이점
string <- c ("how are you ?",'apple')

length(string)
nchar(string)


# 문제 "my name is eunjee song" 문장의 문자를 모두 쪼개서 역으로 만들고 붙여서 출력하시오 ( 함수 이용)

rev_f <- function(string){
  a<-strsplit(string,split='')
  b<-a[[1]][nchar(string):1]
  paste(b,collapse='')
  
}

c <- rev_f ("my name is eunjee song")
c


# 17 문자단어순서 바꾸기 함수
a <- strsplit('how are you?', split=' ')
class(a) # a 의 타입은 list

b <- a[[1]][3:1]
paste(b,collapse=' ')

length(a[[1]]) # 3 : 단어 별
nchar(a[[1]]) # 3 3 4


reversed_wf <- function(string){
  a <- strsplit(string,split=' ')
  str_length <- length(a[[1]])
  reversed <- a[[1]][str_length:1]
  paste(reversed,collapse=' ')
}

c <- reversed_wf("i am fine.")
c

# 문제 my name is eunjee song 문장의 단어별로 쪼개서 역으로 만들고 붙여서 출력하시오 ( 함수 이용)

rev_2 <- function(string){
  a <- strsplit(string,split=' ')
  len <- length(a[[1]]) # <------ nchar(string)
  #len<- nchar(string) nononono
  reversed <- a[[1]][len:1]
  b <- paste(reversed,collapse=' ')
}

c <- rev_2 ("my name is eunjee song")
c

# 19

x <- 1:10 # 1~10
y <- x-1 # 0~9

plot(y) #선형 그래프를 그려줍니다 (암기)

mtcars # r이 제공하는 자동차 관련 데이타
mtcars$mpg # mpg에 대한 데이타 출력 

plot(mtcars$mpg)
#10 ~ 30 사이에 데이터가 mpg
#index 가로축은 차이름들이 순서대로 있는거다

# dotchart 잘 알기

dotchart(mtcars$mpg)
# y축이 첫번째 자동차 ~ 끝까지 x축이 mpg
row.names(mtcars) # 차이름

dotchart(mtcars$mpg,labels=row.names(mtcars))
# labels  === y 축 근데 글씨가 너무 겹친다 그래서 글씨 지정

dotchart(mtcars$mpg,labels=row.names(mtcars),cex=0.7)
# cex 글씨 크기

#mpg와 cyl의 상관 관계를 보고싶으면 

# mpg를 작은 순서에서 큰 순서대로 한다 order 함수
carmpg <- mtcars[order(mtcars$mpg),]

carmpg$cyl

dotchart(carmpg$mpg,labels=row.names(mtcars),cex=0.7)

# 색깔 나타내기
carmpg$color[carmpg$cyl==4] <- "blue"
carmpg$color[carmpg$cyl==6] <- "green"
carmpg$color[carmpg$cyl==8] <- "red"

#color=carmpg$color 로 지정한 색깔을 적용시킬 수 있다 
dotchart(carmpg$mpg,labels=row.names(carmpg),cex=0.7,color=carmpg$color)

# 차트에 제목 넣는 방법 main
dotchart(carmpg$mpg,labels=row.names(carmpg),cex=0.7,color=carmpg$color,main="Milage of cars")
