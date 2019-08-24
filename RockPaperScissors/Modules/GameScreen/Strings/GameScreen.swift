//
//  GameScreenString.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum GameScreen: String {
    
    case viewControllerTitle = "VIEW_CONTROLLER_TITLE"
    case player1Name = "PLAYER_ONE_NAME"
    case player2Name = "PLAYER_TWO_NAME"
    case playerCPU = "PLAYER_CPU"
    case promptScreenLoseMessage = "PROMPT_SCREEN_LOOSE_MESSAGE"
    case promptScreenWinMessage = "PROMPT_SCREEN_WIN_MESSAGE"
    case dataFetchError = "DATA_FETCH_ERROR"
    case resultLabel = "RESULT_LABEL"
    case resultDrawLabel = "RESULT_DRAW_LABEL"
}

extension GameScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
