//
//  OptionScreenAssembly.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit
import Swinject

class OptionScreenAssembly: Assembly {

    func assemble(container: Container) {
        container.register(OptionScreenRouterType.self) { (resolver) in

            return OptionScreenRouter(container: container)
        }
        
        container.register(OptionScreenViewType.self) { (_) in
            OptionScreenViewController()
            }.initCompleted { (resolver, optionScreenView) in
                optionScreenView.presenter = resolver.resolve(OptionScreenPresenterType.self)!
        }

        container.register(OptionScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(OptionScreenViewType.self)!
            let router = resolver.resolve(OptionScreenRouterType.self)!
            return OptionScreenPresenter(view: view, router: router) as OptionScreenPresenterType
        }

    }
    
}

