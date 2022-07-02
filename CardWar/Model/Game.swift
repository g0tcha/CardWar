//
//  Game.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

enum GameState {
    case ended(winner: String, cards: [Card])
    case played(result: DealerResult, cards: [Card])
    case waitingForPlay
    
    var text: String {
        switch self {
        case .ended(let winner, let cards):
            return getCardsDescription(cards) + "\(winner) won the game. Game over."
        case .waitingForPlay:
            return "You can start by hitting the BIG blue button at the bottom of the screen."
        case .played(let result, let cards):
            return getCardsDescription(cards) + getResultText(result)
        }
    }
    
    private func getCardsDescription(_ cards: [Card]) -> String {
        "\(cards.map { $0.description }.joined(separator: "\nVS.\n"))\n\n"
    }
    
    private func getResultText(_ result: DealerResult) -> String {
        switch result {
        case .player1Winning:
            return "Player 1 won this round. The two cards are added to the deck."
        case .player2Winning:
            return "Player 2 won this round. The two cards are added to the deck."
        case .draw:
            return "Draw, cards returns to both players."
        }
    }
}

final class Game {
    
    private let dealer: Dealer
    let player1: Player
    let player2: Player
    var state: Variable<GameState> = Variable(.waitingForPlay)
    
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
        guard let player1Card = player1.playCard(), let player2Card = player2.playCard() else {
            fatalError("Unexpected state : cards should not be nil.")
        }
        
        let result = dealer.checkResult(player1Card, player2Card)

        switch result {
        case .draw:
            player1.insertCardsToDeck(cards: [player1Card])
            player2.insertCardsToDeck(cards: [player2Card])
        case .player1Winning:
            player1.insertCardsToDeck(cards: [player1Card, player2Card])
        case .player2Winning:
            player2.insertCardsToDeck(cards: [player1Card, player2Card])
        }
        
        if !player1.hasCard() {
            state.value = .ended(winner: "Player 2", cards: [player2Card, player1Card])
        } else if !player2.hasCard() {
            state.value = .ended(winner: "Player 1", cards: [player2Card, player1Card])
        } else {
            state.value = .played(result: result, cards: [player2Card, player1Card])
        }
    }
}
