//
//  NewsDetailViewcontroller.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class CreditScreenViewController: BaseViewController {
    
    var presenter: CreditScreenPresenterType?
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "game_screen.png")
        imageView.isUserInteractionEnabled = true
        imageView.tag = Tag.backgroundImageView.rawValue
        return imageView
    }()
    
    private let creditsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = CreditScreen.creditsTitle.localized
        label.font = Typography.headlineXXXXL.font
        label.textColor = Palette.white.color
        label.accessibilityIdentifier = "cSVReaderPrimaryTitle"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.tag = Tag.creditsNameLabel.rawValue
        return label
    }()

    private let creditsNameLabel: UILabel = {
        let label = UILabel()
        label.text = CreditScreen.creditName.localized
        label.font = Typography.headlineXXXXL.font
        label.textColor = Palette.white.color
        label.numberOfLines = 0
        label.accessibilityIdentifier = "cSVReaderSecondaryTitle"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.tag = Tag.creditsTitleLabel.rawValue
        return label
    }()

    private var shouldHideStatusBar: Bool = false
    
    private var selectedOutfitIndexPath: IndexPath?
   
    private var shouldRespondtoTapGestures = true

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(CreditScreen.viewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        view.addSubview(creditsTitleLabel)
        view.addSubview(creditsNameLabel)
    }
    
    private func setupRegularConstraints() {

        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        creditsTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-0.136 * UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(0.272 * UIScreen.main.bounds.height)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }

        creditsNameLabel.snp.makeConstraints { make in
            make.top.equalTo(creditsTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(0.272 * UIScreen.main.bounds.height)
            make.height.equalTo(0.08 * UIScreen.main.bounds.height)
        }

    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }

}


extension CreditScreenViewController: CreditScreenViewType {
    
}


// MARK: - Tags

private extension CreditScreenViewController {
    
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
