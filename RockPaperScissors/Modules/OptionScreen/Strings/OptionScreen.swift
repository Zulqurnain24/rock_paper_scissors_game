//
//  OptionScreen.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum OptionScreen: String {
    
    case startButtonTitle = "START_BUTTON_TITLE"
    case creditButtonTitle = "CREDIT_BUTTON_TITLE"
    case scoreButtonTitle = "SCORE_BUTTON_TITLE"
    case optionsSettingButtonTitle = "OPTION_SETTING_TITLE"
    case helpButtonTitle = "HELP_BUTTON_TITLE"
    case dataFetchError = "DATA_FETCH_ERROR"
    case viewControllerTitle = "VIEW_CONROLLER_TITLE"
}

extension OptionScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
