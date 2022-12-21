//
//  WelcomeViewController.swift
//  LoginWithoutStoryboards_2
//
//  Created by Дмитрий Дмитрий on 20.12.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 18)
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log out", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 18)
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupSubviews(subviews: welcomeLabel, logoutButton)
        setupConstraints()
    }
    
    private func setupSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupConstraints(){
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            why does the button go down if these constraints apply?
//            logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
            logoutButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 400)
        ])
    }
    
    @objc private func logout() {
        dismiss(animated: true)
    }
}
