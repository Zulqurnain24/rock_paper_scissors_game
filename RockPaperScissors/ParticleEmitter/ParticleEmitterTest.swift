//
//  ParticleEmitterTest.swift
//  RockPaperScissorsTests
//
//  Created by Zulqurnain on 5/21/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

import XCTest

@testable import RockPaperScissors

class ParticleEmitterTest: XCTestCase {
    func testParticleEmitter() {
        var particleEffectManager = ParticleEffectManager()
        particleEffectManager.injectSnowLayer(into: (UIApplication.topViewController()?.view)!)
        particleEffectManager.removeParticleEffect()
    }

}

