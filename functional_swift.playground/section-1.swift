// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// get event numbers
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

var evens = Array(1...10).filter(isEven)

evens = Array(1...10).filter { $0 % 2 == 0 }
evens

var evenSum = Array(1...10)
    .filter { (number) in number % 2 == 0 }
    .reduce(0) { (total, number) in total + number }

println(evenSum)


/// use functional programming techniques to group a list of words into an index based on the first letter of each word.

/** sample output
[(C, [Cat, Chicken]),
(F, [fish]),
(D, [Dog]),
(M, [Mouse, monkey]),
(G, [Guinea Pig])]
**/
//import Foundation

let words = ["Cat", "Chicken", "fish", "Dog",
    "Mouse", "Guinea Pig", "monkey"]