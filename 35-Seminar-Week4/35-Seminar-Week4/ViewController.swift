//
//  ViewController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/2/24.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setStyle()
        setUI()
        setLayout()
    }
    
    @objc private func loginButtonTapped() {
        let request = LoginRequest(
            username: idTextField.text!,
            password: passwordTextField.text!
        )
        
        DispatchQueue.main.async {
            NetworkManager.shared.request(
                request: request,
                response: LoginResponse.self,
                apiType: .login
            ) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    resultLabel.text = success.result.token
                case .failure(let failure):
                    resultLabel.text = failure.errorMessage
                }
            }
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.text = "로그인"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        idTextField.do {
            $0.placeholder = "아이디를 입력하세요"
         
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호를 입력하세요"
        }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
        
        resultLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    private func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(resultLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-40)
        }
        
        idTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
        }
    }
}

#Preview {
    ViewController()
}
