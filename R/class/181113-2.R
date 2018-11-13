# 8장 텍스트마이닝 워드 클라우드
# 텍스트 마이닝
#install.packages("wordcloud")

library(wordcloud)
library(RColorBrewer) #색깔..
pal2 = brewer.pal(8,"Dark2")
word = c("인천","서울")
n = c(14,100)
# ex 인천에 있는 백화점은 14개 서울에는 100개라고 했을 때, wordcloud를 이용해 나타내고 싶다면

wordcloud(word,n,colors = "blue") #시각적 효과를 극대화 시킨 테크닉 입니다. 정확한 수치는 알 수 없습니다
wordcloud(word,n,colors = pal2) #색깔
#-------------- page 약 211
