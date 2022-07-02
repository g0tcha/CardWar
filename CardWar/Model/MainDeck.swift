//
//  MainDeck.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
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

final class MainDeck: Deck {
    
    override init() {
        super.init()
        
        Card.Family.allCases.forEach { family in
            Card.Value.allCases.forEach { value in
                self.cards.append(Card(family: family, value: value))
            }
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func split() -> (PlayableDeck, PlayableDeck) {
        let splittedDeck: ([Card], [Card]) = cards.splitInHalf()
        return (PlayableDeck(cards: splittedDeck.0), PlayableDeck(cards: splittedDeck.1))
    }
}
