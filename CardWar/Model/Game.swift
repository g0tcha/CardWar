//
//  Game.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

final class Game {
    
    private let dealer: Dealer
    private let player1: Player
    private let player2: Player
    
    init() {
        dealer = Dealer()
        player1 = Player()
        player2 = Player()
    }
}
