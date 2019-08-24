//
//  OptionScreenController.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class OptionSettingsScreenViewController: BaseViewController {
    
    var presenter: OptionSettingsScreenPresenterType?
    
    var shouldHideStatusBar = false
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "game_screen.png")
        imageView.tag = Tag.backgroundImageView.rawValue
        return imageView
    }()
    
    lazy var gameTypeSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Player VS CPU", "CPU VS CPU"])
        control.frame = view.frame
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.white.cgColor
        control.tintColor = .white
        control.isUserInteractionEnabled = true
        control.addTarget(self, action: #selector(gameModeValueChanged), for: .valueChanged)
        control.accessibilityIdentifier = "GameType"
        
        return control
    }()
    
    lazy var gameDurationSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["5 Seconds", "10 Seconds"])
        control.frame = view.frame
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.white.cgColor
        control.tintColor = .white
        control.isUserInteractionEnabled = true
        control.addTarget(self, action: #selector(gameDurationValueChanged), for: .valueChanged)
        control.accessibilityIdentifier = "GameDuration"
        
        return control
    }()
    
    lazy var playSoundSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Music ON", "Music OFF"])
        control.frame = view.frame
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.white.cgColor
        control.tintColor = .white
        control.isUserInteractionEnabled = true
        control.addTarget(self, action: #selector(playSoundValueChanged), for: .valueChanged)
        control.accessibilityIdentifier = "PlaySound"
        
        return control
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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    @objc func gameModeValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            GameConfiguration.shared.gameType = GameType.PlayerVSCPU
        case 1:
            GameConfiguration.shared.gameType = GameType.CPUVSCPU
        default:
            break
        }
    }
    
    @objc func gameDurationValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            GameConfiguration.shared.timerCount = GameDuration.short
        case 1:
            GameConfiguration.shared.timerCount = GameDuration.medium
        default:
            break
        }
    }
    
    @objc func playSoundValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            GameConfiguration.shared.shouldPlaySound = true
            AudioAssisstant.shared.playSound(soundName: AudioFiles.levelMusic1.rawValue, withFormat: AudioFormats.mp3.rawValue)
        case 1:
            GameConfiguration.shared.shouldPlaySound = false
            AudioAssisstant.shared.stopSound()
        default:
            break
        }
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
        view.addSubview(gameTypeSegmentedControl)
        view.addSubview(playSoundSegmentedControl)
        view.addSubview(gameDurationSegmentedControl)
        
    }
    
    private func setupRegularConstraints() {

        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        gameTypeSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.2 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }
        
        playSoundSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(gameTypeSegmentedControl.snp.bottom).offset(0.08 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }
        
        gameDurationSegmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(playSoundSegmentedControl.snp.bottom).offset(0.08 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(SpacingRule.wideLeftMargin.value)
            make.right.equalToSuperview().offset(SpacingRule.wideRightMargin.value)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }

    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }

}

extension OptionSettingsScreenViewController: OptionSettingsScreenViewType {
    
}

// MARK: - Tags

private extension OptionSettingsScreenViewController {
    
    private enum Tag: Int {
        case gameStartButton = 0
        case gameCreditsButton
        case backgroundImageView
        case segmentedControl
    }
    
}
