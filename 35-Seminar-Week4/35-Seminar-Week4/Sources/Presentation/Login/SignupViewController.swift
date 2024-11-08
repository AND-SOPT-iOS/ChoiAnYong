//
//  SignupViewController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/6/24.
//

import UIKit

class SignupViewController: BaseViewController {
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let idCheckLabel = UILabel()
    private let passwordCheckLabel = UILabel()
    private let hobbyTextField = UITextField()
    private let hobbyCheckLabel = UILabel()
    private let signupButton = UIButton(type: .system)
    private let messageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
        
        iconImageView.do {
            $0.image = .sopt
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 18
        }
        
        titleLabel.do {
            $0.text = "Welcome to SOPT!"
            $0.font = .systemFont(ofSize: 25, weight: .semibold)
        }
        
        idTextField.do {
            $0.placeholder = "username"
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 18
            $0.font = .systemFont(ofSize: 18)
            $0.addLeftPadding(20)
        }
        
        idCheckLabel.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 15)
            $0.isHidden = true
        }
        
        passwordTextField.do {
            $0.placeholder = "password"
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 18
            $0.addLeftPadding(20)
        }
        
        passwordCheckLabel.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 15)
            $0.isHidden = true
        }
        
        hobbyTextField.do {
            $0.placeholder = "hobby"
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 18
            $0.addLeftPadding(20)
        }
        
        hobbyCheckLabel.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 15)
            $0.isHidden = true
        }
        
        signupButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 18
            $0.isEnabled = true
            $0.configuration?.showsActivityIndicator = true
            var confiure = UIButton.Configuration.plain()
            confiure.showsActivityIndicator = false
            $0.configuration = confiure
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
        
        messageLabel.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 15)
        }
    }
    
    override func setUI() {
        view.addSubViews(
            iconImageView,
            titleLabel,
            idTextField,
            idCheckLabel,
            passwordTextField,
            passwordCheckLabel,
            hobbyTextField,
            hobbyCheckLabel,
            signupButton,
            messageLabel
        )
    }
    
    override func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.size.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(iconImageView.snp.centerX)
            $0.top.equalTo(iconImageView.snp.bottom).offset(40)
        }
        
        idTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.height.equalTo(50)
        }
        
        idCheckLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(idCheckLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        passwordCheckLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        hobbyCheckLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(20)
        }
        
        signupButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(hobbyCheckLabel.snp.bottom).offset(40)
            $0.height.equalTo(50)
        }
        
        messageLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signupButton.snp.bottom).offset(20)
        }
    }
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        hobbyTextField.delegate = self
    }
}

extension SignupViewController {
    @objc func loginButtonTapped() {
        signupButton.configuration?.showsActivityIndicator = true
        let request = SignupRequest(
            username: idTextField.text!,
            password: passwordTextField.text!,
            hobby: hobbyTextField.text!
        )
        
        DispatchQueue.main.async {
            NetworkManager.shared.request(
                request: request,
                response: SignupResponse.self,
                apiType: .singnup
            ) {
                [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let value):
                    UserDefaults.standard.set(
                        value.result.no,
                        forKey: "UserNumber"
                    )
                    self.signupButton.configuration?.showsActivityIndicator = false
                    navigationController?.popViewController(animated: true)
                case .failure(let error):
                    self.messageLabel.text = error.errorMessage
                    self.signupButton.configuration?.showsActivityIndicator = false
                }
            }
        }
    }
    
    private func updateLoginButtonState() {
        let isIdValid = checkText(text: idTextField.text ?? "")
        let isPasswordValid = checkText(text: passwordTextField.text ?? "")
        let isHobbyValid = checkText(text: hobbyTextField.text ?? "")
        signupButton.isEnabled = isIdValid && isPasswordValid && isHobbyValid
        signupButton.backgroundColor = signupButton.isEnabled ? .black : .gray
    }
}

extension SignupViewController: UITextFieldDelegate {
    func checkText(text: String) -> Bool {
        return text.count > 0 && text.count <= 8
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == idTextField {
            let check = checkText(text: textField.text ?? "")
            idCheckLabel.text = check ? "가능한 형식입니다." : "1~8자로 입력해주세요."
            idCheckLabel.isHidden = false
        } else if textField == passwordTextField {
            let check = checkText(text: textField.text ?? "")
            passwordCheckLabel.text = check ? "가능한 형식입니다." : "1~8자로 입력해주세요."
            passwordCheckLabel.isHidden = false
        } else if textField == hobbyTextField {
            let check = checkText(text: textField.text ?? "")
            hobbyCheckLabel.text = check ? "가능한 형식입니다." : "1~8자로 입력해주세요."
            hobbyCheckLabel.isHidden = false
        }
        updateLoginButtonState()
    }
}


#Preview {
    SignupViewController()
}
