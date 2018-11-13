library(wordcloud)
library(RColorBrewer)

# 색
pal2 = brewer.pal(8,"Dark2")

data = read.csv(file.choose(),header=T)
#전국구를 삭제 한 파일을 사용
word = data$행정구역.시군구.별
feq = data$순이동..명.
wordcloud(word,feq,colors=pal2)


#과제 1번 애니메이션
library(animation)
library(png)
ani.options(interval=1)
plot.new()
for(i in 1:7){
  img = paste("C://Users/eheeku/Desktop/rhomework/",i,".png",sep="")
  img = readPNG(img)
  rasterImage(img,0,0,1,1)
  ani.pause()
}
dev.off()

#과제 2번 전국의 도별인구 이동의 추이 (1~9월)
data = read.csv(file.choose(),header=T)
# 도만 추출
data = data[grep("도$",data$행정구역.시군구.별),]

# 전입자
word = data$행정구역.시군구.별
feq = data$총전입..명.
wordcloud(word,feq,colors=pal2)
#전출자
word = data$행정구역.시군구.별
feq = data$총전출..명.
wordcloud(word,feq,colors=pal2)



#과제 3번 전국의 시별인구 이동의 추이
data = read.csv(file.choose(),header=T)
# 시만 추출
data = data[grep("시$",data$행정구역.시군구.별),]

# 전입자
word = data$행정구역.시군구.별
feq = data$총전입..명.
wordcloud(word,feq,colors=pal2)
#전출자
word = data$행정구역.시군구.별
feq = data$총전출..명.
wordcloud(word,feq,colors=pal2)