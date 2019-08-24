//
//  GameResultScreenPresenter.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class GameResultScreenPresenter: NSObject {
    
    private weak var view: GameResultScreenViewType?
    private var router: GameResultScreenRouterType?
    
    required init(view:GameResultScreenViewType, router: GameResultScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension GameResultScreenPresenter: GameResultScreenPresenterType {
    func viewDidLoad() {

    }
    
    func viewDidAppear() {
        
    }
}
