//
//  AppPreview.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/25/24.
//

import UIKit

class AppPreview: UIView {
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let modelLabel = UILabel()
    private let modelImageView = UIImageView()
    private let seperatorView = UIView()
    
    override init (frame: CGRect) {
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
        titleLabel.do {
            $0.text = "미리 보기"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        imageView.do {
            $0.image = .tossPreview
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 25
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }
        

        modelImageView.do {
            $0.image = .init(systemName: "iphone.gen3")
            $0.tintColor = .systemGray2
        }
        
        modelLabel.do {
            $0.text = "iPhone"
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.textColor = .systemGray2
        }
        
        seperatorView.do {
            $0.backgroundColor = .systemGray2
        }
    }
    
    private func setUI() {
        self.addSubViews(titleLabel, imageView, modelImageView, modelLabel, seperatorView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.height.equalTo(450)
            $0.width.equalTo(snp.width).multipliedBy(0.6)
        }
        
        modelImageView.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.left)
            $0.top.equalTo(imageView.snp.bottom).offset(10)
        }
        
        modelLabel.snp.makeConstraints {
            $0.centerY.equalTo(modelImageView.snp.centerY)
            $0.left.equalTo(modelImageView.snp.right).offset(10)
        }
        
        seperatorView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(modelLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.4)
            
        }
    }
}

#Preview {
    AppPreview()
}
