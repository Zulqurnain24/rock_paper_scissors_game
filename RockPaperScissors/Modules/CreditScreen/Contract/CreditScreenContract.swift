//
//  SplashContract.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//


import UIKit

protocol CreditScreenViewType: class {
    
    var presenter: CreditScreenPresenterType? { get set }

}

protocol CreditScreenRouterType: class {
    
    func presentGameScreenViewController(sender: UIViewController)
    
    func presentCreditScreenViewController(sender: UIViewController)
    
}

protocol CreditScreenPresenterType: class {
    
    init(view: CreditScreenViewType, router: CreditScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
}
