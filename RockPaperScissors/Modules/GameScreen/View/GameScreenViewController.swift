//
//  GameScreenController.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit
import SpriteKit

enum ObjectImage: String {
    typealias RawValue = String
    
    // Possible Moves
    
    case player1_Rock = "Rock_1p.png"
    
    case player1_Paper = "Paper_1p.png"
    
    case player1_Scissor = "Scissors_1p.png"
    
    case player2_Rock =  "Rock_2p.png"
    
    case player2_Paper = "Paper_2p.png"
    
    case player2_Scissor = "Scissors_2p.png"
    
}

enum GameDuration: Int {
    typealias RawValue = Int
    
    // Game Duration
    case initial = 4
    case short = 6
    case medium = 11
    
}

class GameScreenViewController: BaseViewController {
    
    var presenter: GameScreenPresenterType?
    
    var counter = GameDuration.short.rawValue
    
    var snowFlakeManager = ParticleEffectManager()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "game_screen.png")
        imageView.isUserInteractionEnabled = true
        imageView.tag = Tag.backgroundImageView.rawValue
        return imageView
    }()
    
    private let player1Label: UILabel = {
        let label = UILabel()
        label.text = GameScreen.player1Name.localized
        label.font = Typography.headlineXXXL.font
        label.textColor = Palette.blue.color
        label.accessibilityIdentifier = "player1LabelIdentifier"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        label.tag = Tag.player1Label.rawValue
        return label
    }()
    
    private var player1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Rock_1p")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let RockButton: Button = {
        let button = Button(style: .image, text: "", image: #imageLiteral(resourceName: "yellow"))
        button.addTarget(self, action: #selector(toggleToRock), for: .touchUpInside)
        button.tag = Tag.rockButton.rawValue
        button.accessibilityIdentifier = "Rock"
        button.titleLabel?.text = "Rock"
        return button
    }()

    private let PaperButton: Button = {
        let button = Button(style: .image, text: "", image: #imageLiteral(resourceName: "blue"))
        button.addTarget(self, action: #selector(toggleToPaper), for: .touchUpInside)
        button.tag = Tag.paperButton.rawValue
        button.accessibilityIdentifier = "Paper"
        button.titleLabel?.text = "Paper"
        return button
    }()

    private let ScissorButton: Button = {
        let button = Button(style: .image, text: "", image: #imageLiteral(resourceName: "red"))
        button.addTarget(self, action: #selector(toggleToScissor), for: .touchUpInside)
        button.tag = Tag.scissorButton.rawValue
        button.accessibilityIdentifier = "Scissor"
        button.titleLabel?.text = "Scissor"
        return button
    }()

    private let player2Label: UILabel = {
        let label = UILabel()
        label.text = GameScreen.player2Name.localized
        label.font = Typography.headlineXXXL.font
        label.textColor = Palette.red.color
        label.accessibilityIdentifier = "player2LabelIdentifier"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        label.tag = Tag.player2Label.rawValue
        return label
    }()

    private var player2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Rock_2p")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private var customSpinnerUIImageview: CustomSpinnerUIImageview = {
        let customSpinnerUIImageview = CustomSpinnerUIImageview(image: UIImage(named: "SplashScreenLoader.png"), animationImagesNames: ["SplashScreenLoader1.png", "SplashScreenLoader2.png", "SplashScreenLoader3.png", "SplashScreenLoader4.png"], animateDuration: Float(GameDuration.short.rawValue))
        customSpinnerUIImageview.contentMode = .scaleAspectFit
        customSpinnerUIImageview.isUserInteractionEnabled = true
        customSpinnerUIImageview.round(by: 6)
        customSpinnerUIImageview.layer.borderWidth = 0
        customSpinnerUIImageview.backgroundColor = Palette.clear.color
        customSpinnerUIImageview.accessibilityIdentifier = "customSpinnerUIImageviewIdentifier"
        customSpinnerUIImageview.tag = Tag.customSpinnerUIImageview.rawValue
        return customSpinnerUIImageview
    }()
    
    private var counterlabel: UILabel = {
        let label = UILabel()
        label.text =  ""
        label.font = Typography.headlineXXXL.font
        label.textColor = Palette.green.color
        label.accessibilityIdentifier = "counterlabelIdentifier"
        label.backgroundColor = Palette.clear.color
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        label.tag = Tag.player2Label.rawValue
        return label
    }()

    private var shouldHideStatusBar: Bool = false
    private var player1Move = GameMove.Rock
    private var player2Move = GameMove.Rock
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(GameScreen.viewControllerTitle.localized)"
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
        presenter?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        shouldHideStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
        presenter?.viewWillDisAppear()
    }

    func playCollidPlayerViews() {
        UIView.animate(withDuration: 2.5, animations: {
            self.player2ImageView.frame.origin.y -= 100
            self.player1ImageView.frame.origin.y += 100
            self.counterlabel.frame.size.height = 0
            self.counterlabel.frame.size.width = 0
            self.customSpinnerUIImageview.frame.size.height = 0
            self.customSpinnerUIImageview.frame.size.width = 0
        }, completion: nil)
    }
    
    func disableButtons() {
        RockButton.isHidden = true
        PaperButton.isHidden = true
        ScissorButton.isHidden = true
    }
    
    @objc func toggleToRock() {
        player1ImageView.image = #imageLiteral(resourceName: "Rock_1p")
        player1Move = GameMove.Rock
        player1ImageView.setNeedsDisplay()
    }
    
    @objc func toggleToPaper() {
        player1ImageView.image = #imageLiteral(resourceName: "Paper_1p")
        player1Move = GameMove.Paper
        player1ImageView.setNeedsDisplay()
    }
    
    @objc func toggleToScissor() {
        player1ImageView.image = #imageLiteral(resourceName: "Scissors_1p")
        player1Move = GameMove.Scissor
        player1ImageView.setNeedsDisplay()
    }
    
    func startSpinner() {
        customSpinnerUIImageview.spin()
    }
    
    func stopSpinner() {
        customSpinnerUIImageview.stop()
    }
    
    func setCountLabelValue(value: String) {
        counterlabel.text = value
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
        view.addSubview(player1Label)
        view.addSubview(player1ImageView)
        view.addSubview(player2Label)
        view.addSubview(player2ImageView)
        view.addSubview(counterlabel)
        view.addSubview(customSpinnerUIImageview)
        view.addSubview(RockButton)
        view.addSubview(PaperButton)
        view.addSubview(ScissorButton)
  
    }
    
    private func setupRegularConstraints() {
        player1Label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0.05 * UIScreen.main.bounds.height)
            make.right.equalTo(player1ImageView.snp.left)
            make.height.equalTo(0.067 * UIScreen.main.bounds.height)
            make.width.equalTo(0.2 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().offset(-0.217 * UIScreen.main.bounds.height)
        }
        
        player1ImageView.snp.makeConstraints { (make) in
            make.left.equalTo(player1Label.snp.right)
            make.height.equalTo(0.101 * UIScreen.main.bounds.height)
            make.width.equalTo(0.101 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().offset(-0.2 * UIScreen.main.bounds.height)
        }
        
        RockButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0.02 * UIScreen.main.bounds.height)
            make.right.equalTo(PaperButton.snp.left)
            make.height.equalTo(0.067 * UIScreen.main.bounds.height)
            make.width.equalTo(0.067 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().offset(-0.135 * UIScreen.main.bounds.height)
        }
        
        PaperButton.snp.makeConstraints { (make) in
            make.left.equalTo(RockButton.snp.right)
            make.right.equalTo(ScissorButton.snp.left)
            make.height.equalTo(0.067 * UIScreen.main.bounds.height)
            make.width.equalTo(0.067 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().offset(-0.135 * UIScreen.main.bounds.height)
        }
        
        ScissorButton.snp.makeConstraints { (make) in
            make.left.equalTo(PaperButton.snp.right)
            make.height.equalTo(0.067 * UIScreen.main.bounds.height)
            make.width.equalTo(0.067 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().offset(-0.135 * UIScreen.main.bounds.height)
        }
        
        player2Label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.2 * UIScreen.main.bounds.height)
            make.left.equalToSuperview().offset(0.05 * UIScreen.main.bounds.height)
            make.right.equalTo(player2ImageView.snp.left)
            make.height.equalTo(0.067 * UIScreen.main.bounds.height)
            make.width.equalTo(0.2 * UIScreen.main.bounds.height)
        }
        
        player2ImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.203 * UIScreen.main.bounds.height)
            make.left.equalTo(player2Label.snp.right)
            make.height.equalTo(0.101 * UIScreen.main.bounds.height)
            make.width.equalTo(0.101 * UIScreen.main.bounds.height)
        }
        
        customSpinnerUIImageview.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(0.203 * UIScreen.main.bounds.height)
            make.width.equalTo(0.203 * UIScreen.main.bounds.height)
        }
        
        counterlabel.snp.makeConstraints { (make) in
            make.center.equalTo(customSpinnerUIImageview.snp.center)
            make.height.equalTo(0.101 * UIScreen.main.bounds.height)
            make.width.equalTo(0.101 * UIScreen.main.bounds.height)
        }
        
        self.view.bringSubviewToFront(customSpinnerUIImageview)
    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }
    
}

extension GameScreenViewController: GameScreenViewType {
    func update2PlayerState(move: GameMove) {
        DispatchQueue.main.async {
            switch move {
            case GameMove.Paper:
                self.player2ImageView.image = UIImage(named: ObjectImage.player2_Paper.rawValue)
            case GameMove.Rock:
                self.player2ImageView.image = UIImage(named: ObjectImage.player2_Rock.rawValue)
            case GameMove.Scissor:
                self.player2ImageView.image = UIImage(named: ObjectImage.player2_Scissor.rawValue)
            }
            self.player2Move = move
            self.player2ImageView.setNeedsDisplay()
            self.view.setNeedsDisplay()
        }
    }
    
    func update1PlayerState(move: GameMove) {
        DispatchQueue.main.async {
            switch move {
            case GameMove.Paper:
                self.player1ImageView.image = UIImage(named: ObjectImage.player1_Paper.rawValue)
            case GameMove.Rock:
                self.player1ImageView.image = UIImage(named: ObjectImage.player1_Rock.rawValue)
            case GameMove.Scissor:
                self.player1ImageView.image = UIImage(named: ObjectImage.player1_Scissor.rawValue)
            }
            self.player1Move = move
            self.player1ImageView.setNeedsDisplay()
            self.view.setNeedsDisplay()
        }
    }
    
    func getPlayer1Move() -> GameMove {
        return player1Move
    }
    
    func getPlayer2Move() -> GameMove {
        return player2Move
    }

}

// MARK: - Tags

private extension GameScreenViewController {
    
    private enum GestureType: Int {
        
        case torsoSwipe
        case lowerBodySwipe
        case outfitSwipe
        
    }
    
    private enum Tag: Int {
        
        case player1Label = 0
        case player2Label
        case customSpinnerUIImageview
        case player1RockButton
        case player1ScissorButton
        case player1PaperButton
        case player2RockButton
        case player2ScissorButton
        case player2PaperButton
        case rockButton
        case paperButton
        case scissorButton
        case backgroundImageView
    }
    
}
