//: Playground - noun: a place where people can play

import UIKit


struct Card{
    var valueOfTheCard: String
    var suitOfTheCard: String
    var numericalValueOfTheCard: Int
    
}

class Deck
{
    var cards = [Card]()
    
    init()
    {
        self.Reset()
    }
    
    func Reset()
    {
        
        var potentialCardValues: [String] = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
        var potentialSuits: [String] = ["Clubs", "Spades", "Heart", "Diamond"]
        
        for i in 0..<potentialSuits.count
        {
            for j in 0..<potentialCardValues.count
            {
                cards.append(Card(valueOfTheCard: potentialCardValues[j], suitOfTheCard: potentialSuits[i], numericalValueOfTheCard: j+1))
            }
        }
    }
    
    func Deal() -> Card
    {
        let topMostCard: Card! = cards.first
        cards.remove(at: 0)
        return topMostCard
    }
    
    func Shuffle()
    {
        for i in 0..<cards.count
        {
            let rand_idx: Int = Int(arc4random_uniform(UInt32(cards.count)))
            let tempCard: Card = cards[i]
            cards[i] = cards[rand_idx]
            cards[rand_idx] = tempCard
        }
    }
}

//Give the Player a discard method of type (Card) -> Bool which discards the Card specified and returns True if the Card existed and was successfully removed or False if the Card was not in the player's hand.

class Player
{
    var name: String
    var hand: [Card]
    
    init(name: String)
    {
        self.name = name
        self.hand = [Card]()
    }
    
    func Draw(deckOfCards:Deck) -> Card
    {
        let cardThatWasDrawn: Card = deckOfCards.Deal()
        hand.append(cardThatWasDrawn)
        return cardThatWasDrawn
    }
    
    func Discard(cardToDiscard:Card) -> Bool
    {
        for i in 0..<self.hand.count
        {
            if hand[i].numericalValueOfTheCard == cardToDiscard.numericalValueOfTheCard && hand[i].suitOfTheCard == cardToDiscard.suitOfTheCard && hand[i].valueOfTheCard == cardToDiscard.valueOfTheCard{
                hand.remove(at: i)
                return true
            }
            
        }
        return false
    }

}

