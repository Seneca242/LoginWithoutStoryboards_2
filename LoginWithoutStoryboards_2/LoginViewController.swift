//
//  ViewController.swift
//  LoginWithoutStoryboards_2
//
//  Created by Дмитрий Дмитрий on 17.12.2022.
//

import UIKit
//import SnapKit
// подключить SnapKit и попробовать
class LoginViewController: UIViewController {

    private let userName = "Dima"
    private let password = "123"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .yellow
        // почитать об этом
//        stackView.setContentCompressionResistancePriority(<#T##priority: UILayoutPriority##UILayoutPriority#>, for: <#T##NSLayoutConstraint.Axis#>)
//        stackView.setContentHuggingPriority(<#T##priority: UILayoutPriority##UILayoutPriority#>, for: <#T##NSLayoutConstraint.Axis#>)
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
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
        button.configuration = .bordered()
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
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .gray
        setupSubviews(subviews: stackView)
        addElementsToStackView(elements: userNameTF, passwordTF, loginButton, buttonsStackView)
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
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameTF.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            userNameTF.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordTF.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        ])
                
        buttonsStackView.addArrangedSubview(forgotUserName)
        buttonsStackView.addArrangedSubview(forgotPassword)
        
        //
        NSLayoutConstraint.activate([
            forgotUserName.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor),
            forgotUserName.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor),
            forgotUserName.leadingAnchor.constraint(equalTo: forgotPassword.leadingAnchor),
            forgotUserName.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor),
        ])
        
        // более красивый способ через SnapKit
//        forgotUserName.snp.makeConstraints {
//            $0.left.right.equalToSuperview().proirity(.defaultLow)
//            $0.height.equal(to: passwordTF).multiple(0.5)
//        }
        
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
        let test = UIViewController() // заменить свой вью контроллер и определить его тайтл
        
        let navigationControllerTest = UINavigationController(rootViewController: test)
//        navigationControllerTest.navigationBar
//        welcomeVC.modalPresentationStyle = .fullScreen
//        present(welcomeVC, animated: true)
        
        //
        let tabbar = UITabBarController()
        welcomeVC.tabBarItem = .init(title: "welcome", image: nil, tag: 0)
        navigationControllerTest.tabBarItem = .init(title: "test", image: nil, selectedImage: nil)
        
        tabbar.modalPresentationStyle = .fullScreen
//        tabbar.modalTransitionStyle
        tabbar.viewControllers = [welcomeVC, navigationControllerTest]
        
        present(tabbar, animated: true)
        
        // понадобятся в дальнейшем
//        navigationControllerTest.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
//        navigationControllerTest.popViewController(animated: <#T##Bool#>)
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

