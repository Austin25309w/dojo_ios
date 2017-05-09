//: Playground - noun: a place where people can play

import UIKit

class Animal
{
    var name: String
    var health = 100
    
    init(name: String)
    {
        self.name = name
    }
    
    func displayHealth()
    {
        print(self.health)
    }
}


class Cat : Animal
{
    init(Catname: String) {
        super.init(name: Catname)
        self.health = 150
    }
    
    func Growl()
    {
        print("Rawr!")
    }
    
    func Run()
    {
        print("Running!")
        self.health = self.health - 10
    }
}

class Cheetah : Cat
{
    override func Run()
    {
        
        if self.health >= 50
        {
            print("Running Fast")
            self.health = self.health - 50
        }
        
        else
        {
            print("Sorry, not enough health to run")
        }
    }
    
    func Sleep()
    {
        if self.health <= 200
        {
            self.health = self.health + 50
        }
        
        else
        {
            print("Health already full")
        }
    }
}

class Lion : Cat
{
    init(LionName: String)
    {
        super.init(Catname: LionName)
        self.health = 200
    }
    
    override func Growl()
    {
        print("ROAR!!!! I am the King of the Jungle")
    }
}

//Create a Cheetah
var cheetah = Cheetah(Catname: "Charlie")

//Have the Cheetah run 4 times
cheetah.Run()
cheetah.Run()
cheetah.Run()
cheetah.Run()

//Display the Cheetah's health
cheetah.displayHealth()

//Create a Lion. 
var lion = Lion(LionName: "Leo")

//Have the Lion run 3 times. 
lion.Run()
lion.Run()
lion.Run()

//Have the Lion growl.
lion.Growl()
