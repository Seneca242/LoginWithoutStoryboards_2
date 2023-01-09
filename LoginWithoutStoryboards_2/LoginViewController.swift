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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .yellow
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotUserName: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot User Name?", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
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
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonsStackView)
        stackView.addArrangedSubview(textFieldsStackView)
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .gray
        setupSubviews(subviews: stackView)
        addElementsToStackView(elements: textFieldsStackView, loginButton, buttonsStackView)
        setupConstraints()
    }
    
    private func setupSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func addElementsToStackView(elements: UIView...) {
        elements.forEach { element in
            stackView.addArrangedSubview(element)
        }
    }
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        textFieldsStackView.addArrangedSubview(userNameTF)
        textFieldsStackView.addArrangedSubview(passwordTF)
        
        buttonsStackView.addArrangedSubview(forgotUserName)
        buttonsStackView.addArrangedSubview(forgotPassword)
        
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

