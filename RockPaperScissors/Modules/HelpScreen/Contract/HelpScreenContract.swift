//
//  HelpScreenContract.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit

protocol HelpScreenViewType: class {
    
    var presenter: HelpScreenPresenterType? { get set }

}

protocol HelpScreenRouterType: class {
    
    func presentHelpScreenViewController(sender: UIViewController)

}

protocol HelpScreenPresenterType: class {
    
    init(view: HelpScreenViewType, router: HelpScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
}
