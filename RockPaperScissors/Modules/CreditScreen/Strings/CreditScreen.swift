//
//  CreditScreen.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum CreditScreen: String {
    
    case viewControllerTitle = "VIEW_CONTROLLER_TITLE"
    case creditsTitle = "CREDITS_TITLE"
    case creditName = "CREDITS_NAME"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension CreditScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
