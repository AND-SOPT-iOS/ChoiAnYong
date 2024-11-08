//
//  OtherHobbyViewController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/7/24.
//

import UIKit

class OtherHobbyViewController: BaseViewController {
    private let titleLabel = UILabel()
    private let numberTextField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
        
        titleLabel.do {
            $0.text = "친구 취미 조회하기"
            $0.font = .systemFont(ofSize: 40, weight: .bold)
        }
        
        numberTextField.do {
            $0.placeholder = "usernumber"
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 18
            $0.font = .systemFont(ofSize: 18)
            $0.addLeftPadding(20)
        }
        
        searchButton.do {
            $0.setTitle("조회하기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .gray
            $0.layer.cornerRadius = 18
            $0.isEnabled = false
            $0.addTarget(
                self,
                action: #selector(SearchButtonTapped),
                for: .touchUpInside
            )
        }
        
        resultLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    override func setUI() {
        view.addSubViews(
            titleLabel,
            numberTextField,
            searchButton,
            resultLabel
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        numberTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(100)
            $0.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberTextField.snp.bottom).offset(20)
        }
        
        searchButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setDelegate() {
        numberTextField.delegate = self
    }
}

extension OtherHobbyViewController {    
    @objc private func SearchButtonTapped() {
        guard let number = Int(numberTextField.text!) else {
            return
        }
        DispatchQueue.main.async {
            NetworkManager.shared.request(
                request: EmptyRequest(),
                response: HobbyResponse.self,
                apiType: .otherHobby(id: number)
            ) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    resultLabel.text = success.result.hobby
                case .failure(let failure):
                    resultLabel.text = failure.errorMessage
                }
            }
        }
    }
}

extension OtherHobbyViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.isEmpty {
            searchButton.isEnabled = false
            searchButton.backgroundColor = .gray
            
        } else {
            searchButton.isEnabled = true
            searchButton.backgroundColor = .black
        }
    }
}

#Preview {
    OtherHobbyViewController()
}
