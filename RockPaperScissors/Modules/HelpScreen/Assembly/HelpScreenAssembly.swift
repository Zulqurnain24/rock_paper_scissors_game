//
//  HelpScreenAssembly.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit
import Swinject

class HelpScreenAssembly: Assembly {

    func assemble(container: Container) {
        container.register(HelpScreenRouterType.self) { (resolver) in

            return HelpScreenRouter(container: container)
        }
        
        container.register(HelpScreenViewType.self) { (_) in
            HelpScreenViewController()
            }.initCompleted { (resolver, helpScreenView) in
                helpScreenView.presenter = resolver.resolve(HelpScreenPresenterType.self)!
        }
        
        container.register(HelpScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(HelpScreenViewType.self)!
            let router = resolver.resolve(HelpScreenRouterType.self)!
            return HelpScreenPresenter(view: view , router: router) as HelpScreenPresenterType
        }
        
    }
    
}

