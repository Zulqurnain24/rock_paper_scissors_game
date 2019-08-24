//
//  GameResultScreenRouter.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class GameResultScreenRouter {
    
    private var container: Container
    
    init(container: Container) {
        self.container = container
    }  
}

// MARK: - FittingRoomRouterType

extension GameResultScreenRouter: GameResultScreenRouterType {
    func presentGameScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(GameScreenRouterType.self) as? GameScreenRouter else { return }
        router.presentGameScreenViewController(sender: sender)
    }
    
    func presentOptionScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(OptionScreenRouterType.self) as? OptionScreenRouter else { return }
        router.presentOptionScreenViewController(sender: sender)
    }
    
    func presentGameResultScreenViewController(sender: UIViewController, withResultString: String) {
        guard let controller = container.resolve(GameResultScreenViewType.self) as? GameResultScreenViewController else { return }
        sender.navigationController?.isNavigationBarHidden = false
        controller.messageToDisplay = withResultString
        UIApplication.topViewController()?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func dismissGameResultScreen(sender: UIViewController) {
        sender.dismiss(animated: true, completion: nil)
    }
}


