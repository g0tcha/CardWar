//
//  ViewController.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import UIKit

enum PlayButtonState: CustomStringConvertible {
    case playCard, playAgain
    
    var description: String {
        switch self {
        case .playCard: return "⚔️ Play card ⚔️"
        case .playAgain: return "Play again"
        }
    }
}

class ViewController: UIViewController {
    
    private let game = Game()
    private var playButtonState: PlayButtonState = .playCard
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var player1CountButton: UIButton!
    @IBOutlet weak var player2CountButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.state.onUpdate = { [weak self] state in
            self?.handleGameState(state)
        }
        
        startGame()
    }
    
    // MARK: - Actions
    
    @IBAction func handleCountTapped(_ sender: UIButton) {
        let countMessage = sender == player1CountButton ? game.player1.getRemainingCardsCountMessage : game.player2.getRemainingCardsCountMessage
        presentAlertController(with: "Cards Remaining", andMessage: countMessage)
    }
    
    @IBAction func handlePlayCardTapped(_ sender: UIButton) {
        if case .playAgain = playButtonState {
            startGame()
            playButtonState = .playCard
        } else {
            game.play()
        }
    }
}

// MARK: - Privates

private extension ViewController {
    
    func startGame() {
        game.start()
        playButton.setTitle("⚔️ Play card ⚔️", for: .normal)
    }
    
    func handleGameState(_ state: GameState) {
        self.informationLabel.text = state.text
        
        if case .ended = state {
            playButton.setTitle("Play again", for: .normal)
            playButtonState = .playAgain
        }
    }
}
