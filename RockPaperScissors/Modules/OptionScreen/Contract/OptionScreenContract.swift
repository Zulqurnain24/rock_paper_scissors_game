//
//  OptionScreenContract.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit

protocol OptionScreenViewType: class {
    
    var presenter: OptionScreenPresenterType? { get set }

}

protocol OptionScreenRouterType: class {
    
    func presentOptionScreenViewController(sender: UIViewController)
    func presentGameScreenViewController(sender: UIViewController)
    func presentCreditScreenViewController(sender: UIViewController)
    func presentOptionsSettingViewController(sender: UIViewController)
    func presentHelpScreenViewController(sender: UIViewController)
}

protocol OptionScreenPresenterType: class {
    
    init(view: OptionScreenViewType, router: OptionScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
    func presentGameScreenViewController()
    func presentCreditScreenViewController()
    func presentOptionsSettingViewController()
    func presentHelpScreenViewController()
}
