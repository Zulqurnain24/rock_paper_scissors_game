//
//  NewsDetailPresenter.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class OptionScreenPresenter: NSObject {
    
    private weak var view: OptionScreenViewType?
    private var router: OptionScreenRouterType?

    required init(view: OptionScreenViewType, router: OptionScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension OptionScreenPresenter: OptionScreenPresenterType {
    func presentHelpScreenViewController() {
        router?.presentHelpScreenViewController(sender: view as! UIViewController)
    }
    
    func presentOptionsSettingViewController() {
        router?.presentOptionsSettingViewController(sender: view as! UIViewController)
    }
    
    func presentGameScreenViewController() {
        router?.presentGameScreenViewController(sender: view as! UIViewController)
    }
  
    func presentCreditScreenViewController() {
        router?.presentCreditScreenViewController(sender: view as! UIViewController)
    }
    
    func viewDidLoad() {
        
        //start level music
        AudioAssisstant.shared.playSound(soundName: AudioFiles.levelMusic2.rawValue, withFormat: AudioFormats.mp3.rawValue)
        
    }
    
    func viewDidAppear() {
        
    }
   
}

