//: Playground - noun: a place where people can play

import UIKit

//Create a function tossCoin() -> String
//Have this function print "Tossing a Coin!"
//Next have the function randomly pick either "Heads" or "Tails"
//Have the function print the result 
//Finally, have the function return the result

func tossCoin() -> String
{
    var choice: String
    print("Tossing a Coin!")
    let random: UInt32 = arc4random_uniform(2)
    if random == 0 {
        choice = "Heads"
        print(choice)
    }
    else {
        choice = "Tails"
        print(choice)
    }
    return choice
}

//Now create another function tossMultipleCoins(Int) -> Double
//Have this function call the tossCoin function multiple times based on the Integer input Have the function return a Double that reflects the ratio of head toss to total toss

func tossMultipleCoins(timesToToss times: Int) -> Double
{
    var result: String
    var headCount: Int = 0
    for i in 1...times
    {
        result = tossCoin()
        if result == "Heads"
        {
            headCount = headCount + 1
        }
    }
    
    return Double(headCount) / Double(times)

}

tossCoin()
tossMultipleCoins(timesToToss: 5)


