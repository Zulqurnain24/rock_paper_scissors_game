//
//  GameResultScreenContract.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol GameResultScreenViewType: class {
    
    var presenter: GameResultScreenPresenterType? { get set }
}

protocol GameResultScreenRouterType: class {
    
    func presentGameScreenViewController(sender: UIViewController)
    
    func presentGameResultScreenViewController(sender: UIViewController, withResultString: String)
    
    func presentOptionScreenViewController(sender: UIViewController)
    
    func dismissGameResultScreen(sender: UIViewController)
}

protocol GameResultScreenPresenterType: class {
    
    init(view: GameResultScreenViewType,router: GameResultScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
}

