//
//  AudioAssisstantTest.swift
//  RockPaperScissorsTests
//
//  Created by Zulqurnain on 5/21/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

import XCTest

@testable import RockPaperScissors

class AudioAssisstantTest: XCTestCase {
    func testAudioAssisstantTest() {
         AudioAssisstant.shared.playSound(soundName: AudioFiles.win.rawValue, withFormat:  AudioFormats.wav.rawValue)
        AudioAssisstant.shared.playSound(soundName: AudioFiles.loose.rawValue, withFormat:  AudioFormats.wav.rawValue)
        AudioAssisstant.shared.playSound(soundName: AudioFiles.timerTick.rawValue, withFormat:  AudioFormats.wav.rawValue)
        AudioAssisstant.shared.playSound(soundName: AudioFiles.levelMusic1.rawValue, withFormat:  AudioFormats.mp3.rawValue)
        AudioAssisstant.shared.playSound(soundName: AudioFiles.levelMusic2.rawValue, withFormat:  AudioFormats.mp3.rawValue)
    }
    
}
