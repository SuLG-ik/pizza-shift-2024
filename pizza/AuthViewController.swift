//
//  AuthViewController.swift
//  pizza
//
//  Created by Володя on 06.07.2024.
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {

    enum State {
        case initial, phoneEntered
    }
    
    private let authButton = UIButton()
    private let infoLabel = UILabel()
    private let loginTextFieldsStack = UIStackView()
    private let phoneTextField = UITextField()
    private let codeTextField = UITextField()
    private let codeRepeatInfo = UILabel()
    private let codeRepeatButton = UIButton()
    
    private let codeTextFieldDelegate = FormatTextFieldDelegate(maskFormatter(mask: "XXXX"))
    private let phoneNumberTextFieldDelegate = FormatTextFieldDelegate(maskFormatter(mask: "+X XXX XXX XX XX"))
    
    private var state = State.initial {
        didSet {
            updateState()
        }
    }
    
    private var secondsToCodeRepeat = -1 {
        didSet {
            updateCodeRepeat()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWindow()
        setupViews()
    }
    
    private func setupViews() {
        setupInfoText()
        setupLoginFields()
        setupLoginButton()
        setupCodeRepeat()
    }
    
    private func setupWindow() {
        self.title = "Авторизация"
    }
    
    private func setupLoginFields() {
        self.view.addSubview(self.loginTextFieldsStack)
        self.loginTextFieldsStack.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(AppSizes.verticalOffset)
            make.leading.trailing.equalToSuperview().inset(AppSizes.horizontalInsets)
        }
        self.loginTextFieldsStack.axis = .vertical
        self.loginTextFieldsStack.spacing = AppSizes.textFieldStackSpacing
        setupPhoneInput(stack: self.loginTextFieldsStack)
        setupCodeInput(stack: self.loginTextFieldsStack)
    }
    
    private func setupPhoneInput(stack: UIStackView) {
        stack.addArrangedSubview(self.phoneTextField)
        self.phoneTextField.snp.makeConstraints { make in
            make.height.equalTo(AppSizes.textFieldHeight)
        }
        self.phoneTextField.keyboardType = .phonePad
        self.phoneTextField.placeholder = "Телефон"
        self.phoneTextField.layer.borderColor = AppColors.textFieldBorderColor?.cgColor
        self.phoneTextField.layer.borderWidth = AppSizes.textFieldBorderWidth
        self.phoneTextField.layer.cornerRadius = AppSizes.textFieldCornerRadius
        self.phoneTextField.delegate = phoneNumberTextFieldDelegate
    }
    
    private func setupCodeInput(stack: UIStackView) {
        stack.addArrangedSubview(self.codeTextField)
        self.codeTextField.snp.makeConstraints { make in
            make.height.equalTo(AppSizes.textFieldHeight)
        }
        self.codeTextField.keyboardType = .phonePad
        self.codeTextField.placeholder = "Проверочный код"
        self.codeTextField.layer.borderColor = AppColors.textFieldBorderColor?.cgColor
        self.codeTextField.layer.borderWidth = AppSizes.textFieldBorderWidth
        self.codeTextField.layer.cornerRadius = AppSizes.textFieldCornerRadius
        updateCodeTextField()
        self.codeTextField.delegate = codeTextFieldDelegate
    }
    
    private func setupLoginButton() {
        self.view.addSubview(self.authButton)
        self.authButton.snp.makeConstraints{ make in
            make.trailing.leading.equalToSuperview().inset(AppSizes.horizontalInsets)
            make.top.equalTo(self.loginTextFieldsStack.snp.bottom).offset(AppSizes.verticalOffset)
            make.height.equalTo(AppSizes.buttonHeight)
        }
        self.authButton.setTitle("Войти", for: .normal)
        self.authButton.backgroundColor = AppColors.brandColor
        self.authButton.layer.cornerRadius = AppSizes.buttonCornerRadius
        self.authButton.addTarget(self, action: #selector(onContinueButtonTapped), for: .touchUpInside)
    }
    
    private func setupInfoText() {
        self.view.addSubview(infoLabel)
        self.infoLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview().inset(AppSizes.horizontalInsets)
        }
        self.infoLabel.textColor = AppColors.primaryTextColor
        self.infoLabel.font.withSize(AppSizes.textFontSize)
        self.infoLabel.text = "Введите номер телефона для входа в личный кабинет"
        self.infoLabel.numberOfLines = 0
    }
    
    private func setupCodeRepeat() {
        setupCodeRepeatMessage()  
        setupCodeRepeatButton()
        updateCodeRepeat()
    }
    
    private func setupCodeRepeatButton() {
        self.view.addSubview(codeRepeatButton)
        self.codeRepeatButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(AppSizes.horizontalInsets)
            make.top.equalTo(self.authButton.snp.bottom).offset(AppSizes.verticalOffset)
        }
        codeRepeatButton.setTitleColor(AppColors.secondaryColor, for: .normal)
        codeRepeatButton.setTitle("Запросить код ещё раз", for: .normal)
    }
    
    private func setupCodeRepeatMessage() {
        self.view.addSubview(codeRepeatInfo)
        self.codeRepeatInfo.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(AppSizes.horizontalInsets)
            make.top.equalTo(self.authButton.snp.bottom).offset(AppSizes.verticalOffset)
        }
        self.codeRepeatInfo.numberOfLines = 0
        self.codeRepeatInfo.textColor = AppColors.hintColor
        self.codeRepeatInfo.text = "Запросить код повторно можно через \(secondsToCodeRepeat) секунд"
    }
    
    private func updateCodeRepeat() {
        self.codeRepeatInfo.text = "Запросить код повторно можно через \(secondsToCodeRepeat) секунд"
        self.codeRepeatInfo.isHidden = secondsToCodeRepeat < 1
        self.codeRepeatButton.isHidden = secondsToCodeRepeat != 0
    }
    
    private func updateCodeTextField() {
        self.codeTextField.isHidden = state != .phoneEntered
    }
    
    private func updateState() {
        updateCodeTextField()
        updateCodeRepeat()
        if (state == .phoneEntered) {
            onCodeSended()
        }
    }
    
    private func onCodeSended() {
        secondsToCodeRepeat = 60
    }
    
    @objc
    private func onContinueButtonTapped() {
        switch self.state {
        case .initial:
            self.state = .phoneEntered
            break
        case .phoneEntered:
            navigateMain()
        }
        self.state = .phoneEntered
    }
    
    private func validatePhone(text: String) {
        
    }
    
    private func navigateMain(animated: Bool = true) {
        self.navigationController?.setViewControllers([MainViewController()], animated: animated)
    }
    
}

#Preview {
    AuthViewController()
}
