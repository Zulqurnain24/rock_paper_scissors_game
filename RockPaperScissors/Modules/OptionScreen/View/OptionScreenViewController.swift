//
//  OptionScreenController.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class OptionScreenViewController: BaseViewController {
    
    var presenter: OptionScreenPresenterType?
    
    var shouldHideStatusBar = false
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "game_screen.png")
        imageView.isUserInteractionEnabled = true
        imageView.tag = Tag.backgroundImageView.rawValue
        return imageView
    }()
    
    private let gameStartButton: Button = {
        let button = Button(style: .orangeWhiteLarge, text: OptionScreen.startButtonTitle.localized)
        button.addTarget(self, action: #selector(handleStartButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "gameStartButtonIdentifier"
        button.tag = Tag.gameStartButton.rawValue
        return button
    }()

    private let gameCreditButton: Button = {
        let button = Button(style: .orangeWhiteLarge, text: OptionScreen.creditButtonTitle.localized)
        button.addTarget(self, action: #selector(handlCreditButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "gameCreditButtonIdentifier"
        button.tag = Tag.gameStartButton.rawValue
        return button
    }()
    
    private let gameOptionsSettingButton: Button = {
        let button = Button(style: .orangeWhiteLarge, text: OptionScreen.optionsSettingButtonTitle.localized)
        button.addTarget(self, action: #selector(handleGameOptionsSettingButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "gameScoreButtonIdentifier"
        button.tag = Tag.gameOptionsSettingButton.rawValue
        return button
    }()
    
    private let gameHelpScreenButton: Button = {
        let button = Button(style: .orangeWhiteLarge, text: OptionScreen.helpButtonTitle.localized)
        button.addTarget(self, action: #selector(handleHelpScreenButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "gameHelpScreenButtonIdentifier"
        button.tag = Tag.gameHelpScreenButton.rawValue
        return button
    }()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(OptionScreen.viewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
      
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
        setNeedsStatusBarAppearanceUpdate()
    }
    
    @objc func handleStartButtonTapped() {
        presenter?.presentGameScreenViewController()
    }
    
    @objc func handlCreditButtonTapped() {
        presenter?.presentCreditScreenViewController()
    }
    
    @objc func handleGameOptionsSettingButtonTapped() {
        presenter?.presentOptionsSettingViewController()
    }
    
    @objc func handleHelpScreenButtonTapped() {
        presenter?.presentHelpScreenViewController()
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
        backgroundImageView.frame = view.frame
        view.addSubview(backgroundImageView)
        view.addSubview(gameStartButton)
        view.addSubview(gameCreditButton)
        view.addSubview(gameOptionsSettingButton)
        view.addSubview(gameHelpScreenButton)
    }
    
    private func setupRegularConstraints() {

        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        gameStartButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.15 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
           // make.bottom.equalTo(gameCreditButton.snp.top).offset(45)
        }
        gameCreditButton.snp.makeConstraints { make in
            make.top.equalTo(gameStartButton.snp.bottom).offset(0.08 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
           // make.bottom.equalTo(gameScoreButton.snp.top).offset(45)
        }
        gameOptionsSettingButton.snp.makeConstraints { make in
            make.top.equalTo(gameCreditButton.snp.bottom).offset(0.08 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }
        gameHelpScreenButton.snp.makeConstraints { make in
            make.top.equalTo(gameOptionsSettingButton.snp.bottom).offset(0.08 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }

    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }

}

extension OptionScreenViewController: OptionScreenViewType {
    
}

// MARK: - Tags

private extension OptionScreenViewController {
    
    private enum Tag: Int {
        case gameStartButton = 0
        case gameCreditsButton
        case gameOptionsSettingButton
        case gameHelpScreenButton
        case backgroundImageView
    }
    
}
