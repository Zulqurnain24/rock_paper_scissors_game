//
//  OptionScreenRouter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class OptionSettingsScreenRouter {

    private var container: Container
    
    init(container: Container) {
        self.container = container
    }

}

// MARK: - FittingRoomRouterType

extension OptionSettingsScreenRouter: OptionSettingsScreenRouterType {
    
    func presentGameScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(GameScreenRouterType.self) as? GameScreenRouter else { return }
        router.presentGameScreenViewController(sender: sender)
    }
    
    func presentCreditScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(CreditScreenRouterType.self) as? CreditScreenRouter else { return }
        router.presentCreditScreenViewController(sender: sender)
    }
    
    func presentOptionSettingsScreenViewController(sender: UIViewController) {
        guard let controller = container.resolve(OptionSettingsScreenViewType.self) as? OptionSettingsScreenViewController else { return }
        sender.navigationController?.isNavigationBarHidden = true
        sender.navigationController?.navigationItem.hidesBackButton = true
        guard controller.presenter != nil else { return }
        UIApplication.topViewController()?.navigationController?.pushViewController(controller, animated: true)
    }
}

