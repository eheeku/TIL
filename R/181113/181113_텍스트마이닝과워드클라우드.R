# 지역별 순이동 인구 수에 따른 워드 클라우드 
library(wordcloud)

word = c ("인천","강화군","옹진군")
frequency = c(651,85,61)
wordcloud(word,frequency,colors = "blue")
# 빈도수가 큰 단어를 중앙에 배치 random.order = F
# 빈도수가 큰 단어부터 지정한 색의 순서로 출력 random.color = F
wordcloud(word,frequency,random.order = F,random.color=F,
          colors=rainbow(length(word)))