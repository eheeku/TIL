/*
1. 원소 추가
m[key] = elem

2. 특정 키 값 가져오기
elem = m[key]

3. 맵에 원소 제거
delete(m,key)

4. 맵에 키가 존재하는지 확인 (있으면 true)
elem,ok = m[key]
*/

package main
import "fmt"

func main() {
    m := make(map[string]int)

    m["Answer"]= 42
    fmt.Println ("m[\"Answer\"]값은: ", m["Answer"])
}
