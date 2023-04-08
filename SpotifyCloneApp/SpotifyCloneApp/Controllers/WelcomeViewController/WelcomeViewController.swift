//
//  WelcomeViewController.swift
//  SpotifyCloneApp
//
//  Created by Evgeniy Docenko on 08.04.2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    private lazy var welcomeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "spotiWelcome")
        image.contentMode = .scaleToFill
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN IN WITH SPOTIFY", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        button.backgroundColor = UIColor(red: 0.12, green: 0.84, blue: 0.38, alpha: 1.00)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviews(view: [welcomeImage, signInButton])
    }
    
    private func setupUI() {
        self.view.layer.backgroundColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1).cgColor
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
    }
    
    @objc private func signInButtonAction() {
        let vc = LoginViewController()
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromBottom
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        navigationController?.pushViewController(vc, animated: false)
    }
    
    private func handleSignIn(success: Bool) {
        // Login User or error
        guard success else {
            let alert = UIAlertController(title: "Ooops!",
                                          message: "Something went wrong?",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
            return
        }
        
        let mainTabBarVC = TabBarViewController()
        mainTabBarVC.modalPresentationStyle = .fullScreen
        present(mainTabBarVC, animated: true)
    }
    
    private func setupConstraints() {
        welcomeImage.snp.makeConstraints { make in
            make.height.equalTo(114)
            make.width.equalTo(355)
            make.centerX.equalToSuperview()
            make.top.equalTo(250)
        }
        
        signInButton.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(150)
        }
    }
}
