
# 변수에 값을 넣는 방법
x <- 1
y <- 2
z <- x+y
z
x <- 2
z <- x+y
z

# 사칙연산 실수 정수등, 자료형을 자기 알아서 프린트해줍니다
# ex ) 9/2 를 하면 4.5 출력
x <- 9
y = 2
z <- x+y # 덧셈
z
z <- x*y # 곱셈
z

# 그 외 사칙연산 %% 나머지 %/% 몫
z <- x%%y
z
z <- x%/%y
z

# value , demo (시각화에 사용합니다), length
demo(persp)
demo(graphics)

# 배열
x <- c(1,2,3)
y <- c(2,3,4)

z <- x+y
z

# 원소 개수가 다르면 length 에러가 납니다
x <- c(1,2,3)
y <- c(2,3,4,5)

z <- x+y
z

# length 함수는 반드시 외워두어야 합니다
length(x) # result : 3
length(y) # result : 4

# 문자 다루기
x <- c(1,2,3)
y <- c('1','2','3','4','5')
x+y # error
z <- c('how','are','you','?')
z
length(z) # 4 를 출력합니다 (주의하기)

# 구조를 알려주는 함수 str() 반드시 외워두어야 합니다
str(x)
str(y)

# 비교 연산자 bool값으로 출력됩니다 true false
1+3 == 5 #FALSE
1+3 == 4 #TRUE
x <- 2
x > 5 #FALSE

x <- TRUE
y <- FALSE

x|y #TRUE
x&y # FALSE
!x # FALSE
!x #FALSE (숫자의 경우 0이면 FALSE, 그 외는 TRUE로 인식 됩니다)


#간단한 함수  (sum,mean,,,,)
x <- c(1,2,3,4,6,34,-15,6,9,100,23,3,-4,2,53,213,22,12,34,65,23,21,101,-88,35,6,8,99)
length(x)
a <- sum (x) # 덧셈 
b <- mean(x) # 평균
c <- a/length (x) # mean이라는 함수를 사용한 결과와 같다 

# 최댓값 최솟값 
d <- max(x)
e <- min(x)

# y에 1부터 100까지 넣고 싶을 때
y <- c(1:100)
y

# R 에서의 배열은 1번째부터 시작한다 주의 할 것 !
x[1]
x[2]
x[3:10] # x의 3번째부터 10 번째까지의 값을 알려줍니다


z <- c(10:2) # 거꾸로 대입하기
# z 10 9 8 7 6 ..... 2

# which 와 기본 함수 반드시 기억해야합니다
which(x>100) # 100보다 큰 값의 위치를 알려줍니다

x>5 
#출력값은 각각의 수에 대해 전부 비교합니다
#[1] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
#[20]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE

sum(x>30) # TURE 의 갯수가 나와서 9가 나오는 것 입니다 주의 !

x[x>99] # 99보다 큰 값들이 나옵니다 
#따라서 99보다 큰 수를 더하라
sum(x[x>99]) # 이거 잘 알고 있어야 합니다 

which(x>99) #99보다 큰 값들의 위치를 알려줍니다 


# 예를들어 평균 300만 이상 받는 사람들의 급여 평균을 구하는 문제
mean(sum(x[x>300])) 


# 데이터 프레임
name <- c('a','b','c','d')
sex <- c('f','f','f','m')
occup <- c('x','y','z','k')
age <- c(40,35,29,45)
# 데이터 프레임으로 만드는 작업
member <- data.frame(name,age,sex,occup)

member[3] # 3열이 출력됩니다 

member[,1] # 1열을 가로로 출력합니다
# 출력결과 : a b c d 
# member [,1] == member[1,1] == member$name

member[1,] # 1행을 출력합니다
# 출력결과 : a 40 f x

# $에 대해서 각 열에 해당하는 값들을 출력해줍니다 
member$name
member$age
member$sex
member$occup