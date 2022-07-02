//
//  Dealer.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

final class Dealer {
    
    private var deck: MainDeck
    
    init() {
        deck = MainDeck()
    }
    
    func prepareShuffledDeck() {
        deck.shuffle()
    }
    
    func splitDeck() -> (PlayableDeck, PlayableDeck) {
        deck.split()
    }
}
