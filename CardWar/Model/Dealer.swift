//
//  Dealer.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

enum DealerResult {
    case player1Winning
    case player2Winning
    case draw
}

final class Dealer {
    
    private var deck: MainDeck
    
    init() {
        deck = MainDeck()
    }
    
    func shuffleDeck() {
        deck.shuffle()
    }
    
    func splitDeck() -> (PlayableDeck, PlayableDeck) {
        deck.split()
    }
    
    func checkResult(_ player1Card: Card, _ player2Card: Card) -> DealerResult {
        if player1Card > player2Card {
            return .player1Winning
        } else if player1Card < player2Card {
            return .player2Winning
        } else {
            return .draw
        }
    }
}
