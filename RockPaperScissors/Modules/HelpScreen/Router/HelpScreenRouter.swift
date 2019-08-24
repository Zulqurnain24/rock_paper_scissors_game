//
//  HelpScreenRouter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class HelpScreenRouter {

    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    
}

// MARK: - HelpScreenRouterType

extension HelpScreenRouter: HelpScreenRouterType {
    func presentHelpScreenViewController(sender: UIViewController) {
        guard let controller = container.resolve(HelpScreenViewType.self) as? HelpScreenViewController else { return }
        sender.navigationController?.isNavigationBarHidden = true
        sender.navigationController?.navigationItem.hidesBackButton = true
        guard controller.presenter != nil else { return }
        UIApplication.topViewController()?.navigationController?.pushViewController(controller, animated: true)
    }

}

