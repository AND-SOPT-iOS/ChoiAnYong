//
//  LoginViewController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/6/24.
//

import UIKit

class LoginViewController: BaseViewController {
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let idCheckLabel = UILabel()
    private let passwordCheckLabel = UILabel()
    private let loginButton = UIButton(type: .system)
    private let signupButton = UIButton(type: .system)
    private let messageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        updateLoginButtonState()
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
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 18
            $0.isEnabled = false
            $0.addTarget(
                self,
                action: #selector(loginButtonTapped),
                for: .touchUpInside
            )
        }
        
        signupButton.do {
            $0.setTitle("회원 가입하기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.tintColor = .systemBlue
            $0.addTarget(
                self,
                action: #selector(signupButtonTapped),
                for: .touchUpInside
            )
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
            loginButton,
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
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.height.equalTo(50)
        }
        
        idCheckLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(idCheckLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        passwordCheckLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
        }
        
        loginButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(40)
            $0.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        messageLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signupButton.snp.bottom).offset(20)
        }
    }
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginViewController {
    @objc func signupButtonTapped() {
        let signupVC = SignupViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @objc func loginButtonTapped() {
        let request = LoginRequest(
            username: idTextField.text!,
            password: passwordTextField.text!
        )
        
        DispatchQueue.main.async {
            NetworkManager.shared.request(
                request: request,
                response: LoginResponse.self,
                apiType: .login
            ) {
                [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let value):
                    saveToken(value.result.token)
                case .failure(let error):
                    self.messageLabel.text = error.errorMessage
                }
            }
        }
    }
    
    private func saveToken(_ token: String) {
        let status = KeyChainManager.shared.save(data: token, key: KeyChainManager.tokenKey)
        if status {
            loginSuccess()
        }
    }
    
    private func updateLoginButtonState() {
        let isIdValid = checkText(text: idTextField.text ?? "")
        let isPasswordValid = checkText(text: passwordTextField.text ?? "")
        loginButton.isEnabled = isIdValid && isPasswordValid
        loginButton.backgroundColor = loginButton.isEnabled ? .black : .gray
    }
    
    private func loginSuccess() {
        let mainTabBarController = MainTabBarController()
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            UIView.transition(
                with: window,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: {
                    window.rootViewController = mainTabBarController
                },
                completion: nil
            )
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    private func checkText(text: String) -> Bool {
        return text.count > 0 && text.count <= 8
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let check = checkText(text: textField.text ?? "")
        
        if textField == idTextField {
            idCheckLabel.text = check ? "가능한 형식입니다." : "1~8자로 입력해주세요."
            idCheckLabel.isHidden = false
        } else if textField == passwordTextField {
            passwordCheckLabel.text = check ? "가능한 형식입니다." : "1~8자로 입력해주세요."
            passwordCheckLabel.isHidden = false
        }
        
        updateLoginButtonState()
    }
}

#Preview {
    LoginViewController()
}
