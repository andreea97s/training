//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Andreea on 22/03/2018.
//  Copyright © 2018 Andreea. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        
        var shuffled = [Card]()
        var temp = cards
        for _ in 1...temp.count {
            let rand = Int(arc4random_uniform(UInt32(temp.count)))
            shuffled.append(temp[rand])
            temp.remove(at: rand)
        }
        
        print(shuffled)
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
 
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either 2 cards or no cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
}
