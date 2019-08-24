//
//  GameScreenContract.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit

protocol GameScreenViewType: class {
    
    var presenter: GameScreenPresenterType? { get set }
    
    func startSpinner()
    
    func stopSpinner()

    func setCountLabelValue(value: String)
    
    func update1PlayerState(move: GameMove)
    
    func update2PlayerState(move: GameMove)
    
    func getPlayer1Move() -> GameMove
    
    func getPlayer2Move() -> GameMove
    
    func disableButtons()
    
    func playCollidPlayerViews()
}

protocol GameScreenRouterType: class {
    
    func presentOptionScreenViewController(sender: UIViewController)
    
    func presentGameScreenViewController(sender: UIViewController)

    func presentGameResultScreenViewController(sender: UIViewController, withResultString: String)
}

protocol GameScreenPresenterType: class {
    
    init(view: GameScreenViewType, router: GameScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
    
    func viewWillDisAppear()
    
    func initiateTimer(interval: Int, intervalCompletionHandler: @escaping () -> Void, completionHandler: @escaping () -> Void)
    
    func getWinnerName(player1Move: GameMove, player2Move: GameMove) -> String
    
    func playAppropriateSound(playerString: String)
    
    func presentGameResultScreenViewController(withMessage: String)
    
    func stopTimer()

}
