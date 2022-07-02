//
//  PlayableDeck.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

class PlayableDeck: Deck {
    
    override init(cards: [Card]) {
        super.init()
    }
    
    func popCard() -> Card? {
        cards.popLast()
    }
    
    func appendCards(_ cardsToAppend: [Card]) {
        cards.append(contentsOf: cardsToAppend)
    }
}
