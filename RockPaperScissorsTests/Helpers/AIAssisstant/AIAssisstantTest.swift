//
//  AIAssisstantTest.swift
//  RockPaperScissorsTests
//
//  Created by Zulqurnain on 5/21/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

import XCTest

@testable import RockPaperScissors

class AIAssisstantTest: XCTestCase {
    func testAIAssisstant() {
        let aIAssistant = AIAssisstant()
        counterMoveTest(aIAssistant, move: GameMove.Paper, expectedMove: GameMove.Scissor)
        winnerAssessment(aIAssistant, GameMove.Rock, GameMove.Scissor, expectedWinner: Player.one.rawValue)
    }
    
    // MARK: - private tests
    
    private func counterMoveTest(_ aIAssistant: AIAssisstant,  move: GameMove, expectedMove: GameMove) {
        XCTAssertEqual(aIAssistant.computeCounterMove(move: move), expectedMove)
    }
    
    private func winnerAssessment(_ aIAssistant: AIAssisstant, _ player1Move: GameMove, _ player2Move: GameMove, expectedWinner: String) {
        XCTAssertEqual(aIAssistant.computeWinner(player1Move: player1Move, player2Move: player2Move), expectedWinner)
    }
    
}
