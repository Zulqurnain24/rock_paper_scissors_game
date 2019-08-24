//
//  NewsDetailViewcontroller.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class HelpScreenViewController: BaseViewController {
    
    var presenter: HelpScreenPresenterType?
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "game_screen.png")
        imageView.isUserInteractionEnabled = true
        imageView.tag = Tag.backgroundImageView.rawValue
        return imageView
    }()
    
    private let rulesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = HelpScreen.rulesTitle.localized
        label.font = Typography.headlineXXXXL.font
        label.textColor = Palette.white.color
        label.accessibilityIdentifier = "rulesTitleLabelIdentifier"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.tag = Tag.creditsNameLabel.rawValue
        return label
    }()

    private let rulesLabel: UILabel = {
        let label = UILabel()
        label.text = HelpScreen.rulesDescription.localized
        label.font = Typography.headlineXXXXL.font
        label.textColor = Palette.white.color
        label.numberOfLines = 0
        label.accessibilityIdentifier = "rulesLabelIdentifier"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.tag = Tag.creditsTitleLabel.rawValue
        return label
    }()

    private var shouldHideStatusBar: Bool = false

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(HelpScreen.viewControllerTitle.localized)"
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
        shouldHideStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
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

        view.addSubview(backgroundImageView)
        view.addSubview(rulesTitleLabel)
        view.addSubview(rulesLabel)
    }
    
    private func setupRegularConstraints() {

        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        rulesTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.1 * UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(0.8 * UIScreen.main.bounds.width)
            make.height.equalTo(0.02 * UIScreen.main.bounds.height)
        }

        rulesLabel.snp.makeConstraints { make in
            make.top.equalTo(rulesTitleLabel.snp.bottom).offset(-0.02 * UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(0.8 * UIScreen.main.bounds.width)
            make.height.equalTo(0.15 * UIScreen.main.bounds.height)
        }

    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }

}


extension HelpScreenViewController: HelpScreenViewType {
    
}


// MARK: - Tags

private extension HelpScreenViewController {
    
    private enum GestureType: Int {
        
        case torsoSwipe
        case lowerBodySwipe
        case outfitSwipe
        
    }
    
    private enum Tag: Int {
        
        case backgroundImageView = 1
        case creditsNameLabel = 2
        case creditsTitleLabel = 3
        
    }
    
}
