//
//  Game.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

enum GameState {
    case ended(winner: String)
    case notStarted
    case playing(player1Card: Card, player2Card: Card)
    case waitingForPlay
}

final class Game {
    
    private let dealer: Dealer
    let player1: Player
    let player2: Player
    var state: Variable<GameState> = Variable(.notStarted)
    
    init() {
        dealer = Dealer()
        player1 = Player()
        player2 = Player()
    }
    
    func start() {
        dealer.shuffleDeck()
        let decks = dealer.splitDeck()
        player1.setDeck(decks.0)
        player2.setDeck(decks.1)
        state.value = .waitingForPlay
    }
    
    func play() {
        guard let player1Card = player1.playCard() else {
            state.value = .ended(winner: "Player 2")
            return
        }
        
        guard let player2Card = player2.playCard() else {
            state.value = .ended(winner: "Player 1")
            return
        }
        
        state.value = .playing(player1Card: player1Card, player2Card: player2Card)
        
//        dealer.checkResult(player1Card, player2Card)
    }
}
