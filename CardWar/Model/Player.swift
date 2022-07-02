//
//  Player.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

class Player {
    
    private var deck: [Card] = []
    
    init() {}
    
    func popCard() -> Card? {
        deck.popLast()
    }
    
    func appendCards(cards: [Card]) {
        deck.append(contentsOf: cards)
    }
    
    func hasCards() -> Bool {
        !deck.isEmpty
    }
    
    func displayDeckCount() {
        print("\(deck.count) cards in the deck\n")
    }
}
