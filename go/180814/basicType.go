package main

import ("fmt"
        "math/cmplx")

var ( i int
      f float64
      maxInt uint64
      z complex128 )

func main(){
    const format = "%T(%v)\n"
    fmt.Printf(format,maxInt,maxInt)
    fmt.Printf(format,z,z)

//    f = i
//    f = float64(i)
}
