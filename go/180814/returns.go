package main

import "fmt"

func divide1(divided,dividor int) (q,r int) {
    q = (int)(divided/dividor)
    r = divided%dividor
    return
}

func main (){
    var q,r int
    q,r = divide1(3,7)
    fmt.Println("q result :",q,"r result :",r)
}
