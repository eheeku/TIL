## 함수 연습

### 문자를 입력하여 문자별 거꾸로 출력
```
rev_string = function(string){
  a = strsplit(string,split='')
  b = a[[1]][nchar(string):1]
  c = paste(b,collapse='')
  print(c)
}
rev_string('hello im jozzlight')
```
### 문자를 입력하여 단어별 거꾸로 출력
```
rev_word = function(string){
  a = strsplit(string,split=' ')
  b = a[[1]][length(a[[1]]):1]
  c = paste(b,collapse=' ')
  print(c)
}
rev_word('hello im jozzlight')
```
### 숫자를 입력하여 그 수보다 작은 짝수 출력
```R
print_Even = function (num){
 a = 0:num
 result = a[which(a%%2 != 0)]
 print(result)
}
print_Even(5)
```
### 3개의 점수를 입력하여 평균을 구하는 함수
```
three_means=function(num1,num2,num3){
  means=(num1+num2+num3)/3
  print(means)
}
three_means(100,200,300)
```
