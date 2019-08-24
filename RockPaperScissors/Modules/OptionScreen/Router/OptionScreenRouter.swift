//
//  OptionScreenRouter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class OptionScreenRouter {

    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    
}

// MARK: - FittingRoomRouterType

extension OptionScreenRouter: OptionScreenRouterType {
    func presentHelpScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(HelpScreenRouterType.self) as? HelpScreenRouter else { return }
        router.presentHelpScreenViewController(sender: sender)
    }
    
    func presentOptionsSettingViewController(sender: UIViewController) {
        guard let router = container.resolve(OptionSettingsScreenRouterType.self) as? OptionSettingsScreenRouter else { return }
        router.presentOptionSettingsScreenViewController(sender: sender)
    }
    
    
    func presentGameScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(GameScreenRouterType.self) as? GameScreenRouter else { return }
        router.presentGameScreenViewController(sender: sender)
    }
 
    func presentCreditScreenViewController(sender: UIViewController) {
        guard let router = container.resolve(CreditScreenRouterType.self) as? CreditScreenRouter else { return }
        router.presentCreditScreenViewController(sender: sender)
    }
    
    func presentOptionScreenViewController(sender: UIViewController) {
        guard let controller = container.resolve(OptionScreenViewType.self) as? OptionScreenViewController, let visibleViewController = sender.navigationController?.visibleViewController else { return }
        guard visibleViewController is OptionScreenViewController == false else { return } // guard against re-presenting if already visible
        sender.navigationController?.isNavigationBarHidden = true
        sender.navigationController?.navigationItem.hidesBackButton = true
        guard controller.presenter != nil else { return }
        let rootViewController = UINavigationController(rootViewController: controller)
        rootViewController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
    }
}

