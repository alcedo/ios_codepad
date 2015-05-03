// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let t:(String) -> String = { (String) in
    println("hello")
    return "hello"
}


let q:(String)->String = {s1 in return s1}

q("ha")

func me<T>(name: T) -> T {
    return name
}


for i in 0...4 {
   print(i)
}


for x in stride(from:2.2, through:2.9, by:0.3)
{
    println (x)
}