//
//  UpdateInfoViewController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/7/24.
//

import UIKit

class UpdateInfoViewController: BaseViewController {
    private let titleLabel = UILabel()
    private let hobbyTextField = UITextField()
    private let passwordTextField = UITextField()
    private let idCheckLabel = UILabel()
    private let passwordCheckLabel = UILabel()
    private let updateButton = UIButton(type: .system)
    private let logoutButton = UIButton(type: .system)
    private let messageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        updateLoginButtonState()
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground

        titleLabel.do {
            $0.text = "정보 변경"
            $0.font = .systemFont(ofSize: 40, weight: .bold)
        }
        
        hobbyTextField.do {
            $0.placeholder = "hobby"
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
        
        updateButton.do {
            $0.setTitle("변경하기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 18
            $0.isEnabled = false
            $0.addTarget(
                self,
                action: #selector(updateButtonTapped),
                for: .touchUpInside
            )
        }
        
        logoutButton.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.tintColor = .systemBlue
            $0.addTarget(
                self,
                action: #selector(logoutButtonTapped),
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
            titleLabel,
            hobbyTextField,
            idCheckLabel,
            passwordTextField,
            passwordCheckLabel,
            updateButton,
            logoutButton,
            messageLabel
        )
    }
    
    override func setLayout() {        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.height.equalTo(50)
        }
        
        idCheckLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(10)
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
        
        updateButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(40)
            $0.height.equalTo(50)
        }
        
        logoutButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(updateButton.snp.bottom).offset(20)
        }
        
        messageLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoutButton.snp.bottom).offset(20)
        }
    }
    
    private func setDelegate() {
        hobbyTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension UpdateInfoViewController {
    @objc func logoutButtonTapped() {
        let status = KeyChainManager.shared.delete(key: KeyChainManager.tokenKey)
        
        if status {
            logoutSuccess()
        } else {
            messageLabel.text = "로그아웃 실패"
        }
    }
    
    @objc func updateButtonTapped() {
        let request = UpdateRequest(
            hobby: hobbyTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
        
        DispatchQueue.main.async {
            NetworkManager.shared.request(
                request: request,
                response: EmptyResponse.self,
                apiType: .updateInfo
            ) {
                [weak self] result in
                guard let self else { return }
                switch result {
                case .success(_):
                    self.messageLabel.text = "변경되었습니다!"
                case .failure(let error):
                    self.messageLabel.text = error.errorMessage
                }
            }
        }
    }
    
    private func updateLoginButtonState() {
        let isIdValid = checkText(hobbyTextField.text ?? "")
        let isPasswordValid = checkText(passwordTextField.text ?? "")
        let isNotEmpty = isEmptyText(
            hobbyText: hobbyTextField.text ?? "",
            passwordText: passwordTextField.text ?? ""
        )
        updateButton.isEnabled = (isIdValid || isPasswordValid) && isNotEmpty
        updateButton.backgroundColor = updateButton.isEnabled ? .black : .gray
    }
    
    private func logoutSuccess() {
        let mainTabBarController = LoginViewController()
        
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

extension UpdateInfoViewController: UITextFieldDelegate {
    private func isEmptyText(hobbyText: String, passwordText: String) -> Bool {
        return !hobbyText.isEmpty || !passwordText.isEmpty
    }
            
    private func checkText(_ text: String) -> Bool {
        return text.count > 0 && text.count <= 8
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let check = checkText(textField.text ?? "")
        
        if textField == hobbyTextField {
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
    UpdateInfoViewController()
}
