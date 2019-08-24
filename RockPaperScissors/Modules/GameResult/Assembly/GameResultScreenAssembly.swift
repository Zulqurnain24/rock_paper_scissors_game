//
//  GameResultScreenAssembly.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class GameResultScreenAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(GameResultScreenRouterType.self) { (resolver) in
            
            return GameResultScreenRouter(container: container)
        }
        
        container.register(GameResultScreenViewType.self) { (_) in
            GameResultScreenViewController()
            }.initCompleted { (resolver, gameResultScreenView) in
                gameResultScreenView.presenter = resolver.resolve(GameResultScreenPresenterType.self)!
        }
        
        container.register(GameResultScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(GameResultScreenViewType.self)!
            let router = resolver.resolve(GameResultScreenRouterType.self)!
            return GameResultScreenPresenter(view: view , router: router) as GameResultScreenPresenterType
        }
        
    }
    
}


