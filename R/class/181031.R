# 패키지 인스톨install.packages("ggvis")
# 패키지 이용library(ggvis)
# 집단의 상관성
mtcars
# mpg와 wt의 상관성을 찾아보고자 합니다
plot(mtcars$mpg,mtcars$wt)
# 반비례 관계를 갖는 듯한 모습의 그래프가 그려집니다

# 상관도를 더 확실하게 그릴 수 있고 숫자, index까지 직접 그려줍니다
mtcars %>%ggvis(~mpg,~wt)
# guessing layer_points () 라는 에러가 뜹니다. 그래서 R은 스스로 추측하는데 이걸 명시적으로 알려주고자 합니다
# 똑같이 그려주지만 원래는 layer_points()를 해주어야 합니다.
mtcars %>% ggvis(~mpg,~wt) %>% layer_points()
# 다양한 방법으로 그릴 수 있습니다
mtcars %>% ggvis(~mpg,~wt) %>% layer_lines()
mtcars %>% ggvis(~mpg,~wt) %>% layer_bars()

# smoots 는 회귀선을 뜻합니다,
mtcars %>% ggvis(~mpg,~wt) %>% layer_smooths()
# 어느 데이터인지 알아야 하니까, 다른 그래프와 함께 그려야합니다 그래서
mtcars %>% ggvis(~mpg,~wt) %>% layer_points() %>% layer_smooths()

# 시각화를 위해 points를 빨간색으로 변경합니다
mtcars %>% ggvis(~mpg,~wt,fill:="red") %>% layer_points() %>% layer_smooths()
