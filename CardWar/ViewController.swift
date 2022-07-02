//
//  ViewController.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let game = Game()
    
    @IBOutlet weak var player1CountButton: UIButton!
    @IBOutlet weak var player2CountButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.state.onUpdate = { [weak self] state in
            self?.handleGameState(state)
        }
        
        game.start()
    }
    
    // MARK: - Actions
    
    @IBAction func handleCountTapped(_ sender: UIButton) {
        let countMessage = sender == player1CountButton ? game.player1.getRemainingCardsCountMessage : game.player2.getRemainingCardsCountMessage
        presentAlertController(with: "Cards Remaining", andMessage: countMessage)
    }
    
    @IBAction func handlePlayCardTapped(_ sender: UIButton) {
        game.play()
    }
}

// MARK: - Privates

private extension ViewController {
    
    func handleGameState(_ state: GameState) {
        switch state {
        case .ended(let winner):
            informationLabel.text = "Game ended, winner is \(winner)."
        case .notStarted:
            informationLabel.text = "You can start by hitting the BIG red button at the bottom of the screen."
        case .playing(let player1Card, let player2Card):
            informationLabel.text = "\(player1Card.description)\nVS.\n\(player2Card.description)"
        case .waitingForPlay:
            informationLabel.text = "Hey, you should play a card..."
        }
    }
}
