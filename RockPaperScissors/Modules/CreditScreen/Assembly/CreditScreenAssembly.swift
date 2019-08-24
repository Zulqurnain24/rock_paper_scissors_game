//
//  CreditScreenAssembly.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit
import Swinject

class CreditScreenAssembly: Assembly {

    func assemble(container: Container) {
        container.register(CreditScreenRouterType.self) { (resolver) in

            return CreditScreenRouter(container: container)
        }
        
        container.register(CreditScreenViewType.self) { (_) in
            CreditScreenViewController()
            }.initCompleted { (resolver, creditScreenView) in
                creditScreenView.presenter = resolver.resolve(CreditScreenPresenterType.self)!
        }
        
        container.register(CreditScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(CreditScreenViewType.self)!
            let router = resolver.resolve(CreditScreenRouterType.self)!
            return CreditScreenPresenter(view: view , router: router) as CreditScreenPresenterType
        }
        
    }
    
}

