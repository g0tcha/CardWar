//
//  Deck.swift
//  CardWar
//
//  Created by Vincent Grossier on 03/07/2022.
//

import Foundation

class Deck {
    
    var cards: [Card] = []
    
    var count: Int {
        cards.count
    }
    
    init() {}
    
    init(cards: [Card]) {
        self.cards = cards
    }
}
