//
//  Card.swift
//  ConcentrationGame
//
//  Created by Andreea on 22/03/2018.
//  Copyright © 2018 Andreea. All rights reserved.
//

import Foundation

struct Card {
    
    var identifier : Int
    var isFaceUp = false
    var isMatched = false
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
