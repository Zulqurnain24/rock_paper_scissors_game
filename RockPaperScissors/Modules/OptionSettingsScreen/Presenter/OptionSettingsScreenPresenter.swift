//
//  NewsDetailPresenter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class OptionSettingsScreenPresenter: NSObject {
    
    private weak var view: OptionSettingsScreenViewType?
    private var router: OptionSettingsScreenRouterType?

    required init(view: OptionSettingsScreenViewType, router: OptionSettingsScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension OptionSettingsScreenPresenter: OptionSettingsScreenPresenterType {
    
    func presentGameScreenViewController() {
        router?.presentGameScreenViewController(sender: view as! UIViewController)
    }

    func presentCreditScreenViewController() {
        router?.presentCreditScreenViewController(sender: view as! UIViewController)
    }
    
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }
   
}

