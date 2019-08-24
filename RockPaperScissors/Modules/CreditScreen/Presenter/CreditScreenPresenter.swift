//
//  NewsDetailPresenter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class CreditScreenPresenter: NSObject {
    
    private weak var view: CreditScreenViewType?
    private var router: CreditScreenRouterType?

    required init(view: CreditScreenViewType, router: CreditScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension CreditScreenPresenter: CreditScreenPresenterType {
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }
   
}
