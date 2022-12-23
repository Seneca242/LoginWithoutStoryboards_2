//
//  ViewController.swift
//  LoginWithoutStoryboards_2
//
//  Created by Дмитрий Дмитрий on 17.12.2022.
//

import UIKit

class LoginViewController: UIViewController {

    private let userName = "Dima"
    private let password = "123"
    
//    private lazy var containerView: UIView = .init()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var userNameTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 18)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
//        button.sizeToFit()
        return button
    }()
    
    private lazy var forgotUserName: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot User Name?", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 18)
        button.addTarget(self, action: #selector(forgotName), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPassword: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(forgotMyPassword), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .gray
        view.addSubview(containerView)
        setupSubviews(subviews: userNameTF, passwordTF, loginButton, forgotUserName, forgotPassword)
        setupContainerConstraints()
    }
    
    private func setupSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            containerView.addSubview(subview)
        }
    }
    
    private func setupContainerConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameTF.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 300),
            userNameTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            userNameTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 10),
            passwordTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            passwordTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 30)
        ])
        
        forgotUserName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forgotUserName.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 90),
            forgotUserName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        ])
        
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forgotPassword.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            forgotPassword.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 90)
        ])
    }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        )
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc private func login() {
        if userName != userNameTF.text || password != passwordTF.text {
            showAlert(
                title: "Wrong User Name or Password",
                message: "Write correct User Name and Password"
            )
        }
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true)
    }
    
    @objc private func forgotName() {
       showAlert(
        title: "Oops!",
        message: "Your User Name is \(userName)"
       )
    }
    
    @objc private func forgotMyPassword() {
        showAlert(
            title: "Oops!",
            message: "Your Password is \(password)"
        )
    }
    
}

