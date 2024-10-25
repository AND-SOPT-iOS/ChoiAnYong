//
//  AppDescriptionView.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/25/24.
//

import UIKit

class AppDescriptionView: UIView {
    private let descriptionLabel = UILabel()
    private let seeMoreButton = UIButton(type: .system)
    private let nameLabel = UILabel()
    private let developerLabel = UILabel()
    private let nextButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        descriptionLabel.do {
            $0.text = "토스 뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다.\n● 내 금융 현황을 한눈에, 홈•소비"
            $0.font = .systemFont(ofSize: 16, weight: .light)
            $0.numberOfLines = 3
        }
        
        seeMoreButton.do {
            $0.setTitle("더 보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
            $0.isUserInteractionEnabled = true
        }
        
        nameLabel.do {
            $0.text = "Viva Republic"
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.textColor = .systemBlue
        }
        
        developerLabel.do {
            $0.text = "개발자"
            $0.font = .systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .systemGray2
        }
        
        nextButton.do {
            $0.setTitle("〉", for: .normal)
            $0.setTitleColor(.systemGray, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        }
    }
    
    private func setUI() {
        self.addSubViews(descriptionLabel, seeMoreButton, nameLabel,developerLabel, nextButton)
    }
    
    private func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
            $0.right.equalToSuperview()
            
        }
        
        seeMoreButton.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.bottom.equalTo(descriptionLabel.snp.bottom)
        }
        
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(descriptionLabel.snp.left)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel.snp.centerY).offset(10)
            $0.right.equalToSuperview()
        }
        
        developerLabel.snp.makeConstraints {
            $0.left.equalTo(nameLabel.snp.left)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview()
        }
    }
    
}

#Preview {
    AppDescriptionView()
}
