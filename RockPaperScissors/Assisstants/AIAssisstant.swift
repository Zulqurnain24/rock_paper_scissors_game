//
//  AIAssisstant.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/05/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation

enum GameType: Int {
    
    // Possible Moves
    
    case PlayerVSCPU = 0
    
    case CPUVSCPU

}

enum Player: String {

    case one = "Player1"
    
    case two = "Player2"
    
}

enum GameMove: Int {
    
    // Possible Moves
    
    case Rock = 0
    
    case Paper = 1
    
    case Scissor = 2
    
}

class AIAssisstant: NSObject {
    var gameType = GameType.PlayerVSCPU
    func computeCounterMove(move: GameMove) -> GameMove {
        switch move {
        case .Paper:
            return .Scissor
        case .Scissor:
            return .Rock
        case .Rock:
            return .Paper
        }
    }
    func setGameType(gameType: GameType) {
        self.gameType = gameType
    }
    func getGameType() -> GameType {
        return gameType
    }
    func computeWinner(player1Move: GameMove, player2Move: GameMove) -> String {
        if player1Move.rawValue == 0 && player2Move.rawValue == 1 {
            return Player.two.rawValue
        } else if player1Move == GameMove.Paper && player2Move == GameMove.Scissor {
            return Player.two.rawValue
        } else if player1Move == GameMove.Scissor && player2Move == GameMove.Rock {
            return Player.two.rawValue
        } else  if player1Move == GameMove.Paper && player2Move == GameMove.Rock {
            return Player.one.rawValue
        } else if player1Move == GameMove.Scissor && player2Move == GameMove.Paper {
            return Player.one.rawValue
        } else if player1Move == GameMove.Rock && player2Move == GameMove.Scissor {
            return Player.one.rawValue
        }
        return "Draw"
    }
}
