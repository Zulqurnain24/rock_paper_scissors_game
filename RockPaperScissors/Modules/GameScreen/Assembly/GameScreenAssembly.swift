//
//  GameScreenAssembly.swift
//  RockPaperScissorsAssignment
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit
import Swinject

class GameScreenAssembly: Assembly {

    func assemble(container: Container) {
        container.register(GameScreenRouterType.self) { (resolver) in

            return GameScreenRouter(container: container)
        }
        
        container.register(GameScreenViewType.self) { (_) in
            GameScreenViewController()
            }.initCompleted { (resolver, gameView) in
                gameView.presenter = resolver.resolve(GameScreenPresenterType.self)!
        }

        container.register(GameScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(GameScreenViewType.self)!
            let router = resolver.resolve(GameScreenRouterType.self)!
            return GameScreenPresenter(view: view, router: router) as GameScreenPresenterType
        }
        
    }
    
}

