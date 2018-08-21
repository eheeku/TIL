# GO

### pointer
``` go
func main(){
    i,j := 42,2701
    
    p := &i
    fmt.Println(*p)	//포인터를 통해 i의 값을 읽습니다
    *p =21 //p가 가르키는 값을 21로 변환
    fmt.Println (*p)
}
```

### for
* 특이하게 괄호 없이 중괄호 필수
* for i := 0 ; i <10 ; i ++ {}
* for i <1000 {}
* for {}
#### range와 함께
```go
var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}

func main() {
	//① 일반적인 range
	fmt.Println("① 일반적인 range")
	for i, v := range pow {
		fmt.Printf("2**%d = %d\n", i, v)
	}
	
	//② 인덱스가 필요없는 경우 _로 비워둘 수 있습니다.
	fmt.Println("② 인덱스가 필요없는 경우")
	for _, v := range pow {
	    fmt.Println(v)
	}
}
```
### if
* if 조건문 {}
* if statement; [조건문] {} : 조건 검사 전 간단한 statement 실행
``` go
//주의 ! else문은 if문의 닫히는 } 중괄호와 함께 쓸 것
if x<0 { 
} else {
    
}
if v := math.Pow(x,n); v<lim {}
// v는 if문 내부에서만 사용 가능
```
> Pow x**n  

### switch
* swich i { case 0:  case f(): }
```go
switch {
case a >10 :
grade = "A"
case a >20 :
grade = "B"
default :
grade ="F"
}
```
### struct
* type name struct {}
* .을 이용해 필드에 접근할 수 있습니다.
* type 이름은 name으로 쓸 수 있습니다.
``` go
type Vertex struct {
    X int
    Y int
}
var (
v1 = Vertex {1,2}
v2 = Vertex {X: 1}	//x에만 1 y : 0
v3 = Vertex {}	//x,y 0

func main (){
var p = &v1	// 포인터를 이용해 값 변환도 가능
p.X = 10
}
```
### 배열 1
```go
var a [10] int
primes := [6]int{2, 3, 5, 7, 11, 13} //선언 초기화
```
### 배열 2 슬라이스
1. 슬라이스 사용하기 
```
package main

import "fmt"

func main() {
	names := [4]string{
		"John",
		"Paul",
		"George",
		"Ringo",
	}
	fmt.Println("배열 names:", names)

	fmt.Println("①슬라이스 선언")
	// 슬라이스 선언방법
	// ① 일반적인 선언방법 : 변수 선언과 비슷합니다. 슬라이스타입은 []type입니다.
	var s1 []string = names[0:3]
	// ② 슬라이스도 var키워드와 타입 명시를 생략할 수 있습니다.
	s2 := names[0:2]

	fmt.Println("names[0:3]:", s1)	// 앞에서부터 세개 들어감
	fmt.Println("names[0:2]:", s2)	// 앞에서부터 두개 들어감 

	//s1에서 값을 바꾸면 names, s1에서도 바뀐 값을 볼 수 있습니다.
	fmt.Println("②슬라이스로 값 변경")
	fmt.Println("s1[0]", s1[0])
	s1[0] = "XXX"
	fmt.Println("s1[0] = XXX 실행 후 s1:", s1)
	fmt.Println("s1[0] = XXX 실행 후 s2:", s2)
	fmt.Println("s1[0] = XXX 실행 후 names:", names)

	s2 = s1[0:2]
	fmt.Println("s2 = s1[0:2] 실행 후  s2:", s2)
}
```
2. 슬라이스 사용하기
``` go 
package main

import "fmt"

func main() {

	fmt.Println("① 슬라이스 리터럴 선언")
	//① 기본형 슬라이스 리터럴
	q := []int{2, 3, 5, 7, 11, 13}
	fmt.Println("기본형 슬라이스 리터럴:", q)
	//②구조체 슬라이스 리터럴
	s := []struct {
		i int
		b bool
	}{
		{2, true},
		{3, false},
		{5, true},
		{7, true},
		{11, false},
		{13, true},
	}
	fmt.Println("구조체 슬라이스 리터럴:", s)

	fmt.Println("② 슬라이스를 슬라이스")
	q = q[:2]
	fmt.Println("q[:2]:", q)

	q = q[1:]
	fmt.Println("q[1:]:", q)

}

```

3. 슬라이스 사용하기
``` go
package main

import "fmt"

func main() {
	// make()로 가변 길이 배열 만들기
	a := make([]int, 5)
	fmt.Printf("a := make([]int, 5)의\t")
	printSlice(a)	// 결과 [0 0 0 0 0]

	b := make([]int, 0, 5)
	fmt.Printf("b := make([]int, 0, 5)의\t")
	printSlice(b)	// 결과 []

	c := b[:2]
	fmt.Printf("c := b[:2]의\t\t")
	printSlice(c)	// 결과 [0 0]

	d := c[2:5]
	fmt.Printf("d := c[2:5]의\t\t")
	printSlice(d)	// 결과 [0 0 0]
	
	// 한번에 여러개 원소를 추가할 수 있습니다.
	d = append(d, 1,2,3)
	fmt.Printf("d = append(d, 1,2,3)후\t")
	printSlice(d)	// 결과 [0 0 0 1 2 3]

}

func printSlice(s []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(s), cap(s), s)
}
```

### 그외
* map
* function value
* 클로져
* 메소드 선언
* 리시버 타입
* 인터페이스
* empty


[참고](https://golang.org/)
