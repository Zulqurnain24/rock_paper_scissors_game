//
//  NewsDetailPresenter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class HelpScreenPresenter: NSObject {
    
    private weak var view: HelpScreenViewType?
    private var router: HelpScreenRouterType?

    required init(view: HelpScreenViewType, router: HelpScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension HelpScreenPresenter: HelpScreenPresenterType {
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }
   
}
