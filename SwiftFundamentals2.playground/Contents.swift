//: Playground - noun: a place where people can play

import UIKit

//First, create a loop (either for or while) that prints all of the values from 1-255
var i = 1
while i < 256
{
    print(i)
    i = i + 1
}

//Next, create a program that prints all of the values from 1-100 that are divisible by 3 or 5 but not both
var j = 1
while j < 101
{
    print(j)
    if (j % 3 == 0) && (j % 5 == 0) {
        print("FizzBuzz")
    }
        
    else if j % 3 == 0
    {
        print("Fizz")
    }
    
    else if j % 5 == 0
    {
        print("Buzz")
    }
    j = j + 1
}
//Now modify that program to print "Fizz" when the number is divisible by 3 and "Buzz" when the number is divisible by 5 as well as "FizzBuzz" when the number is divisible by both!
