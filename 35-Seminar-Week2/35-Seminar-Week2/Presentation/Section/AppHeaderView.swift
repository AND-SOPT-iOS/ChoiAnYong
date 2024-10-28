//
//  AppHeaderView.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/23/24.
//

import UIKit

class AppHeaderView: UIView {
    private let appIconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let openButton = UIButton(type: .system)
    private let installButton = UIButton(type: .system)
    
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
        appIconImageView.do {
            $0.image = .tossIcon
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 25
            $0.layer.borderWidth = 0.4
            $0.layer.borderColor = UIColor.systemGray2.cgColor
        }
        
        titleLabel.do {
            $0.text = "토스"
            $0.font = .systemFont(ofSize: 25, weight: .medium)
        }
        
        descriptionLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.font = .systemFont(ofSize: 15, weight: .medium)
            $0.textColor = .systemGray
        }
        
        openButton.do {
            $0.setTitle("열기", for: .normal)
            $0.layer.cornerRadius = 17
            $0.backgroundColor = .tintColor
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        installButton.do {
            $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        }
    }
    
    private func setUI() {
        self.addSubViews(appIconImageView, titleLabel, descriptionLabel, openButton, installButton)
    }
    
    private func setLayout() {
        appIconImageView.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.size.equalTo(118)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(appIconImageView.snp.right).offset(20)
            $0.top.equalTo(appIconImageView)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalTo(appIconImageView.snp.right).offset(20)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        
        openButton.snp.makeConstraints {
            $0.left.equalTo(appIconImageView.snp.right).offset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(35)
            $0.width.equalTo(80)
        }
        
        installButton.snp.makeConstraints {
            $0.right.bottom.equalToSuperview()
            $0.size.equalTo(35)
        }
    }
}

#Preview {
    AppHeaderView()
}
