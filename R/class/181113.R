# 플로차트와 R 스크립트 반드시
# 에니메이션

install.packages("animation")
install.packages("png")

library(animation)
library(png)

ani.options(interval=0.5)
plot.new()

rect(0,0,1,1,col="white")

for(i in 1:6){
  img = paste("C://Users/eheeku/Desktop/study/pracR/soucre/ch06/ball",i,".png",sep="") # 파일명에 따라 , 달라질 수 있습니다
  img = readPNG(img)
  rasterImage(img,0,0,1,1)
  ani.pause()
}

dev.off()