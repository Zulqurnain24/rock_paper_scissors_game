//
//  GameConfiguration.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

class GameConfiguration {
    var gameType: GameType = GameType.PlayerVSCPU
    var shouldPlaySound = true
    var timerCount: GameDuration = GameDuration.short
    static let shared: GameConfiguration = GameConfiguration()
}

