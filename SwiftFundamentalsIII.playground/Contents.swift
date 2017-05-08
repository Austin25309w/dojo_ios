//: Playground - noun: a place where people can play

import UIKit

//Write a program that adds the numbers 1-255 to an array 

var numArray: [Int] = [Int]()
for i in 1...255
{
    numArray.append(i)
}


// Swap two random values in the array
//Hint: you can use the arc4random_uniform(UInt32) function to get a random number from 0 to the number passed in. The arc4random_uniform function takes in one parameter that is of the UInt32 type and returns a random number that is of the UInt32 type. How can you deal with this using your knowledge of types?

var first_random: UInt32 = arc4random_uniform(254)
var second_random: UInt32 = arc4random_uniform(254)
var first: Int = numArray[Int(first_random)]
var second: Int = numArray[Int(second_random)]

numArray[Int(first_random)] = second
numArray[Int(second_random)] = first

//Now write the code that swaps random values 100 times (You've created a "Shuffle"!) Remove the value "42" from the array and Print "We found the answer to the Ultimate Question of Life, the Universe, and Everything at index __" and print the index of where "42" was before you removed it.

for i in 1...100
{
    var first_random: UInt32 = arc4random_uniform(254)
    var second_random: UInt32 = arc4random_uniform(254)
    var first: Int = numArray[Int(first_random)]
    var second: Int = numArray[Int(second_random)]
    
    numArray[Int(first_random)] = second
    numArray[Int(second_random)] = first
}

var location: Int
for j in 0..<numArray.count
{
    if numArray[j] == 42
    {
        location = j
        print("We found the Ultimate Question of Life, the Universe, and Everything at index \(location)")
        var popped = numArray.remove(at: location)
        break
    }
 
}
