name <-c('john','jaehee','juliet','james') 
sex <-c('f','f','f','m')
occup <- c ('althele','doctor','ceo','analyst')
age <- c(40,35,43,29)
member <- data.frame(name,age,sex,occup)
member
name[3]
member[1]
member[1,]
member[,1] # member$name 과 같다
member $sex # 열을 가져오는 것입니다

# 재희의 직업 가져오기
member[2,4] # 2행의 4번째


# john의 sex을 m으로 변경
member[1,3] <- 'm'
