//
//  CreditScreen.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum HelpScreen: String {
    
    case viewControllerTitle = "VIEW_CONTROLLER_TITLE"
    case rulesTitle = "RULES_SCREEN"
    case rulesDescription = "RULES_INSTRUCTIONS"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension HelpScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
