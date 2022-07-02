//
//  PlayableDeck.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

class PlayableDeck: Deck {
    
    override init(cards: [Card]) {
        super.init(cards: cards)
    }
    
    var hasCards: Bool {
        !cards.isEmpty
    }
    
    func popCard() -> Card? {
        cards.popLast()
    }
    
    func insertCards(_ cardsToInsert: [Card]) {
        cards.insert(contentsOf: cardsToInsert.shuffled(), at: 0)
    }
}
