//
//  GameScreenRouter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class GameScreenRouter {

    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    
}

// MARK: - FittingRoomRouterType

extension GameScreenRouter: GameScreenRouterType {
    func presentGameResultScreenViewController(sender: UIViewController, withResultString: String) {
        guard let router = container.resolve(GameResultScreenRouterType.self) as? GameResultScreenRouter else { return }
        router.presentGameResultScreenViewController(sender: sender, withResultString: withResultString)
    }
    
    func presentOptionScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(OptionScreenRouterType.self) as? OptionScreenRouter else { return }
        router.presentOptionScreenViewController(sender: sender)
    }
    
    func presentGameScreenViewController(sender: UIViewController) {
        guard let controller = container.resolve(GameScreenViewType.self) as? GameScreenViewController else { return }
        sender.navigationController?.isNavigationBarHidden = true
        sender.navigationController?.navigationItem.hidesBackButton = true
        guard controller.presenter != nil else { return }
        UIApplication.topViewController()?.navigationController?.pushViewController(controller, animated: true)
    }

}

