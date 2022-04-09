//
//  ValidationViewController.swift
//  RxApp-Validation
//
//  Created by Jeytery on 07.04.2022.
//

import UIKit
import SnapKit
import RxSwift

class ValidationViewController: UIViewController {
    
    private let enterLabel = UILabel()
    private let validateButton = UIButton()
    private let validateLabel = UILabel()
    private let validateTextField = UITextField()
    private let stackView = UIStackView()
    
    private let viewModel = ValidationViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStackView()
        configureValidateButton()
        
        bind()
        
        view.backgroundColor = .systemBackground
    }
}

private extension ValidationViewController {
    private func bind() {
        let name = validateTextField.rx.text.orEmpty.asObservable()
        let validate = validateButton.rx.tap.asObservable()
        
        let input = ValidationViewModel.Input(name: name, validate: validate)
        
        let output = viewModel.transform(input: input)
        
        output.greeting
            .drive(validateLabel.rx.text)
            .disposed(by: bag)
    }
}

//MARK: - ui
private extension ValidationViewController {
    private func configureValidateButton() {
        validateButton.backgroundColor = .systemBlue
        validateButton.tintColor = .white
        validateButton.setTitle("confirm", for: .normal)
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
        }
    
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        enterLabel.text = "Enter name"
        enterLabel.backgroundColor = .systemGray6
        
        stackView.addArrangedSubview(enterLabel)
        stackView.addArrangedSubview(validateTextField)
        stackView.addArrangedSubview(validateButton)
        stackView.addArrangedSubview(validateLabel)
        
        validateTextField.backgroundColor = .systemGray6
        validateTextField.placeholder = "For example: Jeytery"
        
        validateTextField.backgroundColor = .systemGray6
    }
}
