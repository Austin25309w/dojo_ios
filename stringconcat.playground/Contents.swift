//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// loop from 1 to 5 including 5
for i in 1...5 {
    print(i)
}
// loop from 1 to 5 excluding 5
for i in 1..<5 {
    print(i)
}

var myInt = 1
func changeMyInt(someInt: inout Int) {         // must specify "inout"
    someInt = someInt + 1
    print(someInt)
}
changeMyInt(someInt: &myInt)                            // must pass in the variable with "&" symbol
print(myInt)