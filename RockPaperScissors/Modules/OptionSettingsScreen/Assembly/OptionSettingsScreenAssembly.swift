//
//  OptionScreenAssembly.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit
import Swinject

class OptionSettingsScreenAssembly: Assembly {

    func assemble(container: Container) {
        container.register(OptionSettingsScreenRouterType.self) { (resolver) in

            return OptionSettingsScreenRouter(container: container)
        }
        
        container.register(OptionSettingsScreenViewType.self) { (_) in
            OptionSettingsScreenViewController()
            }.initCompleted { (resolver, optionSettingsScreenView) in
                optionSettingsScreenView.presenter = resolver.resolve(OptionSettingsScreenPresenterType.self)!
        }

        container.register(OptionSettingsScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(OptionSettingsScreenViewType.self)!
            let router = resolver.resolve(OptionSettingsScreenRouterType.self)!
            return OptionSettingsScreenPresenter(view: view, router: router) as OptionSettingsScreenPresenterType
        }

    }
    
}

