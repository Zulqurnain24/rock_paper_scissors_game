//
//  RockPaperScissorsUITests.swift
//  RockPaperScissorsUITests
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class RockPaperScissorsUITests: XCTestCase {
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's usually a good idea
        // to exit if a failure was encountered
        continueAfterFailure = true
        
        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")

    }

    // MARK: - Tests
    //Test game flow
    func testGameFlow() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        
        //Navigate to the game screen
        // Tap the "Start" button
        self.app.buttons["Start"].tap()
        
        //Play the game screen
        // Tap the "Rock" button
        self.app.buttons["Rock"].tap()
        
        // Tap the "Paper" button
        self.app.buttons["Paper"].tap()
        
        // Tap the "Rock" button
        self.app.buttons["Scissor"].tap()
        
        app.terminate()
        
    }
    
    //Test game credit flow
    func testCreditsFlow() {
        
        //Relaunch app
        app.launch()
        
        // Tap the "Settings" button
        self.app.buttons["Credits"].tap()
        
    }
    
    //Test game option flow
    func testOptionSettingFlow() {
        
        //Relaunch app
        app.launch()
        
        // Tap the "Settings" button
        self.app.buttons["Settings"].tap()
        
        // Tap the "GameType" button
        self.app.segmentedControls["GameType"].tap()
        
        // Tap the "GameDuration" button
        self.app.segmentedControls["GameDuration"].tap()
        
        // Tap the "PlaySound" button
        self.app.segmentedControls["PlaySound"].tap()
        
        app.terminate()
        
    }
    
    //Test game help flow
    func testHelpFlow() {
        
        //Relaunch app
        app.launch()
        
        // Tap the "Help" button
        self.app.buttons["Help"].tap()
        
        app.terminate()
        
    }
}
