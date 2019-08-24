//
//  OptionScreenContract.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit

protocol OptionSettingsScreenViewType: class {
    
    var presenter:OptionSettingsScreenPresenterType? { get set }

}

protocol OptionSettingsScreenRouterType: class {
    
    func presentOptionSettingsScreenViewController(sender: UIViewController)
    func presentGameScreenViewController(sender: UIViewController)
    func presentCreditScreenViewController(sender: UIViewController)
}

protocol OptionSettingsScreenPresenterType: class {
    
    init(view: OptionSettingsScreenViewType, router: OptionSettingsScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
    func presentGameScreenViewController()
    func presentCreditScreenViewController()
}
