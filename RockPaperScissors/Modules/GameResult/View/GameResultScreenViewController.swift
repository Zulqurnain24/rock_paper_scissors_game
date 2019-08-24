//
//  PauseScreenViewController.swift
//  RockPaperScissors
//
//  Created by Zulqurnain on 5/20/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class GameResultScreenViewController: BaseViewController {
    
    var presenter: GameResultScreenPresenterType?

    private let resultlabel: UILabel = {
        let label = UILabel()
        label.text = GameResultScreen.drawTitle.localized
        label.font = Typography.headlineXXXL.font
        label.textColor = Palette.blue.color
        label.accessibilityIdentifier = "titlelabelIdentifier"
        label.backgroundColor = Palette.white.color
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        label.tag = Tag.titlelabel.rawValue
        return label
    }()
    
    var messageToDisplay = ""
    
    private var shouldHideStatusBar: Bool = false
    
    private var selectedOutfitIndexPath: IndexPath?
    
    var snowFlakeManager = ParticleEffectManager()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(SplashScreen.viewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
        //Display Win Loose message
        displayAppropriateMessage()
    }
    
    func displayAppropriateMessage() {
        
        var color = Palette.green.color
        
        switch messageToDisplay {
        case "Player1":
            messageToDisplay = messageToDisplay + " " + GameScreen.resultLabel.localized
            //display confetti
            snowFlakeManager.injectSnowLayer(into: view)
        case "Player2":
            messageToDisplay = messageToDisplay + " " + GameScreen.resultLabel.localized
            color = Palette.red.color
        default:
            messageToDisplay = GameScreen.resultDrawLabel.localized
            color = Palette.orange.color
        }
        resultlabel.text = messageToDisplay
        resultlabel.textColor = color
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        shouldHideStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func displayResult() {
        resultlabel.text = messageToDisplay
        guard messageToDisplay == "Player 1 wins" else { return }
        snowFlakeManager.injectSnowLayer(into: view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    
    // MARK: - Private Methods
    
    @objc private func handleBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UI Setup
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(resultlabel)
    }
    
    private func setupRegularConstraints() {
        
        resultlabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(0.03 * UIScreen.main.bounds.height)
            make.width.equalTo(0.25 * UIScreen.main.bounds.width)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }
   
}

extension GameResultScreenViewController:  GameResultScreenViewType {
    
}

// MARK: - Tags

private extension GameResultScreenViewController {
    
    private enum GestureType: Int {
        
        case torsoSwipe
        case lowerBodySwipe
        case outfitSwipe
        
    }
    
    private enum Tag: Int {
        
        case titlelabel = 0
        case customSpinnerUIImageview
    }
    
}
