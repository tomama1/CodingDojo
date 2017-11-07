import UIKit

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}


struct Card {
    let color : String
    let roll : UInt32
    init(color: String) {
        self.color = color
        if self.color == "Blue"{
            self.roll = arc4random_uniform(UInt32(2))+1
        }
        else if self.color == "Red"{
            self.roll = arc4random_uniform(UInt32(2))+3
        }
        else{
            self.roll = arc4random_uniform(UInt32(2))+5
        }
    }
}

class Deck {
    var cards = [Card]()
    
    init() {
        cards = [Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Blue"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Green"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red"),Card(color: "Red")]
    }
    func deal() -> Card{
        let topcard : Card = cards.remove(at: 0)
        return topcard
    }

    func isEmpty()-> Bool{
        if self.cards.count == 0{
            return false
        }
        else{
            return true
        }
    }
    func shuffle(){
        self.cards = self.cards.shuffled()
    }
}

class Player {
    var name = String()
    var hand : [Card] = []
    
    init(name: String) {
        self.name = name
    }
    func draw(deck: Deck) -> Card {
        let newcard = deck.deal()
        self.hand.append(newcard)
        return newcard
    }
    func rollDice() -> UInt32{
        let roll : UInt32 = arc4random_uniform(UInt32(6))+1
        return roll
    }
    func matchingCards(color: String, num : UInt32)-> Int{
        var count: Int = 0
        for card in self.hand{
            if ((card.color == color) && (card.roll == num)){
                count+=1
            }
        }
        return count
    }
}


var thedeck = Deck()
var Me = Player(name: "Matthew")
var Op = Player(name: "Computer")

thedeck.shuffle()

Me.draw(deck: thedeck)
Op.draw(deck: thedeck)
Me.draw(deck: thedeck)
Op.draw(deck: thedeck)
Me.draw(deck: thedeck)
Op.draw(deck: thedeck)
Me.draw(deck: thedeck)
Op.draw(deck: thedeck)

var MeDiceRoll : UInt32 = Me.rollDice()
var OpDiceRoll : UInt32 = Op.rollDice()
print (Me.matchingCards(color: "Red", num : MeDiceRoll))
print (Op.matchingCards(color: "Red", num : OpDiceRoll))
print (Me.hand)
print (Op.hand)






