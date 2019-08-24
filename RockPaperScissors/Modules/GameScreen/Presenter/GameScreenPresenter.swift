//
//  GameScreenPresenter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class GameScreenPresenter: NSObject {
    
    private weak var view: GameScreenViewType?
    private var router: GameScreenRouterType?
    
    var timer = Timer()
    
    var timerDuration = GameConfiguration.shared.timerCount.rawValue
    
    var aIAssistant = AIAssisstant()
    
    var player1Move = GameMove.Rock
    
    var player2Move = GameMove.Rock
    
    var gameType = GameConfiguration.shared.gameType

    required init(view: GameScreenViewType, router: GameScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension GameScreenPresenter: GameScreenPresenterType {
    func presentGameResultScreenViewController(withMessage: String) {
        router?.presentGameResultScreenViewController(sender: view as! UIViewController, withResultString: withMessage)
    }

    func playAppropriateSound(playerString: String) {
        switch playerString {
        case "Player1":
            AudioAssisstant.shared.playSound(soundName: AudioFiles.win.rawValue, withFormat:  AudioFormats.wav.rawValue)
        case "Player2":
            AudioAssisstant.shared.playSound(soundName: AudioFiles.loose.rawValue, withFormat: AudioFormats.wav.rawValue)
        default:
            break
        }
    }

    func viewDidLoad() {

    }
    
    func viewDidAppear() {

        view?.startSpinner()
        
        initiateTimer(interval: GameDuration.short.rawValue, intervalCompletionHandler: {
            
            if GameConfiguration.shared.gameType == GameType.PlayerVSCPU {
                self.logicForPlayerVSCPU()
            } else {
                self.logicForCPUVSCPU()
            }

            AudioAssisstant.shared.playSound(soundName: AudioFiles.timerTick.rawValue, withFormat: AudioFormats.wav.rawValue)
        }, completionHandler: {
            
            self.view?.stopSpinner()

            self.stopTimer()
            
            self.view?.playCollidPlayerViews()

            guard let winnerString = self.getWinnerName(player1Move: (self.view?.getPlayer1Move())!, player2Move: (self.view?.getPlayer2Move())!) as String? else { return }

            self.playAppropriateSound(playerString: winnerString)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.presentGameResultScreenViewController(withMessage: winnerString)
            }
        })
    }

    func viewWillDisAppear() {
        stopTimer() 
    }
    
    func logicForPlayerVSCPU() {
        self.view?.update2PlayerState(move:self.aIAssistant.computeCounterMove(move: (self.view?.getPlayer1Move())!))
    }
    
    func logicForCPUVSCPU() {
        
        view?.disableButtons()
        
        switch randomBool() {
        case true:
            self.view?.update1PlayerState(move:self.aIAssistant.computeCounterMove(move: (self.view?.getPlayer2Move())!))
            
        case false:
            self.view?.update2PlayerState(move:self.aIAssistant.computeCounterMove(move: (self.view?.getPlayer1Move())!))
            
        }
    }
    
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    func configureAIAssisstant() {
        aIAssistant.setGameType(gameType: gameType)
    }
    
    func getWinnerName(player1Move: GameMove, player2Move: GameMove) -> String {
        return aIAssistant.computeWinner(player1Move: player1Move, player2Move: player2Move)
    }
    
    func initiateTimer(interval: Int, intervalCompletionHandler: @escaping () -> Void, completionHandler: @escaping () -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: true, block: {[weak self] (_) in
            self?.timerDuration -= 1
            guard let count = self?.timerDuration else { return }
            self?.view?.setCountLabelValue(value: "\(count)")
            intervalCompletionHandler()
            if self?.timerDuration == 0 {
                self?.timer.invalidate()
                completionHandler()
            }
        })
    }
    
    func stopTimer() {
       timer.invalidate()
    }
}
