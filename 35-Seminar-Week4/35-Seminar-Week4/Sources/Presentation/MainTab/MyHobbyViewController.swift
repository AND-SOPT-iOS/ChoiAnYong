//
//  MyHobbyViewController.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/2/24.
//

import UIKit

import SnapKit
import Then

class MyHobbyViewController: BaseViewController {
    private let titleLabel = UILabel()
    private let userNumberLabel = UILabel()
    private let searchButton = UIButton(type: .system)
    private let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserNumber()
    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
        
        titleLabel.do {
            $0.text = "취미 조회하기"
            $0.font = .systemFont(ofSize: 40, weight: .bold)
        }
        
        userNumberLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
        }
        
        searchButton.do {
            $0.setTitle("조회하기", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 18
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
            userNumberLabel,
            searchButton,
            resultLabel
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        userNumberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        
        
        resultLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userNumberLabel.snp.bottom).offset(20)
        }
        
        searchButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setUserNumber() {
        guard let num = UserDefaults.standard.string(forKey: "UserNumber") else {
            return
        }
        
        userNumberLabel.text = "나의 회원 번호 \(num)"
    }
}

extension MyHobbyViewController {
        @objc private func SearchButtonTapped() {
            DispatchQueue.main.async {
                NetworkManager.shared.request(
                    request: EmptyRequest(),
                    response: HobbyResponse.self,
                    apiType: .hobby
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

#Preview {
    MyHobbyViewController()
}
