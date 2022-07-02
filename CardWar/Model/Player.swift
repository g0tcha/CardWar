//
//  Player.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

class Player {
    
    private var deck: PlayableDeck?
    
    init() {}
    
    func setDeck(_ deck: PlayableDeck) {
        self.deck = deck
    }
    
    func playCard() -> Card? {
        deck?.popCard()
    }
    
    var getRemainingCardsCountMessage: String {
        guard let deck = deck else {
            return "This player has no deck."
        }
        return "\(deck.count) cards remaining."
    }
}
