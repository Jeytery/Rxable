//
//  AuthViewController.swift
//  RxApp-Authorization
//
//  Created by Jeytery on 09.04.2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class AuthViewController: UIViewController {
    
    private let viewModel = AuthViewModel()
    
    private let disposeBag = DisposeBag()
    
    private let stackView = UIStackView()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let authButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureElements()
        
        bindAuthButton()
        
        title = "Auth"
        view.backgroundColor = .systemBackground
    }
}

private extension AuthViewController {
    func configureElements() {
        loginTextField.backgroundColor = .systemGray6
        loginTextField.placeholder = "Enter login"
        
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.placeholder = "Enter password"
        
        authButton.backgroundColor = .systemBlue
        authButton.setTitle("Auth", for: .normal)
        authButton.setTitleColor(.white, for: .normal)
        
        authButton.addTarget(self, action: #selector(authButtonAction), for: .touchDown)
    }
    
    @objc func authButtonAction() {
        let alert = UIAlertController(
            title: "\(loginTextField.text!) registred!",
            message: "with password \(passwordTextField.text!)",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "Okay",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
        }
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 7
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(authButton)
    }
    
    func bindAuthButton() {
        Observable
            .combineLatest(loginTextField.rx.text, passwordTextField.rx.text)
            .map { [weak self] login, password in
                guard let self = self else { return false }
                
                if let login = login, login.count >= 4 {
                    self.loginTextField.textColor = .systemGreen
                }
                else {
                    self.authButton.backgroundColor = .systemGray5
                    self.loginTextField.textColor = .systemRed
                    return false
                }
                
                if let password = password, password.count >= 8 {
                    self.passwordTextField.textColor = .systemGreen
                }
                else {
                    self.authButton.backgroundColor = .systemGray5
                    self.passwordTextField.textColor = .systemRed
                    return false
                }
                
                self.authButton.backgroundColor = .systemBlue

                return true
            }
            .bind(to: authButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    func bind() {

    }
}
