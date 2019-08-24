//
//  GameResultScreen.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum GameResultScreen: String {
    
    case player1Title = "PLAYER_1_WIN_TITLE"
    case player2Title = "PLAYER_2_WIN_TITLE"
    case drawTitle = "DRAW_TITLE"
    case dataFetchError = "DATA_FETCH_ERROR"
}

extension GameResultScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
