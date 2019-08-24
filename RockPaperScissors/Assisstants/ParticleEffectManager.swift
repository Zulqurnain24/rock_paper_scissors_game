//
//  ParticleEffectManager.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

/// Manages the life cycle of the slow flake animation
internal struct ParticleEffectManager {

    fileprivate let confettiLayer = CAEmitterLayer()
    fileprivate lazy var confettiCell: CAEmitterCell = {
        let confettiCell = CAEmitterCell()
        confettiCell.contents = UIImage(named: "confetti")?.cgImage
        confettiCell.scale = 0.06
        confettiCell.scaleRange = 0.3
        confettiCell.emissionRange = .pi
        confettiCell.lifetime = 8.0
        confettiCell.birthRate = 40
        confettiCell.velocity = -30
        confettiCell.velocityRange = -20
        confettiCell.yAcceleration = 30
        confettiCell.xAcceleration = 5
        confettiCell.spin = -0.5
        confettiCell.spinRange = 1.0
        return confettiCell
    }()

    /// Injects snow layer into view hierarchy
    ///
    /// - Parameter view: UIView to insert snow layer within
    mutating func injectSnowLayer(into view: UIView) {
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
        confettiLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        confettiLayer.emitterShape = .point
        confettiLayer.beginTime = CACurrentMediaTime()
        confettiLayer.duration = CFTimeInterval(exactly: 15.0)!
        confettiLayer.timeOffset = CFTimeInterval(arc4random_uniform(6) + 5)
        confettiLayer.emitterCells = [confettiCell]
        confettiLayer.anchorPoint = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
        view.layer.addSublayer(confettiLayer)
    }

    /// Removes snow flake animation
    func removeParticleEffect() {
        confettiLayer.removeFromSuperlayer()
    }

}
