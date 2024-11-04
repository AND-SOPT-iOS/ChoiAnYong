//
//  AppVersionCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class AppVersionCell: BaseCollectionViewCell {
    static let identifier: String = "AppVersionCell"
        
    private let versionLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setStyle() {
        versionLabel.do {
            $0.text = "5.183.0"
            $0.font = .systemFont(ofSize: 15, weight: .medium)
            $0.textColor = .systemGray2
        }
                        
        versionLabel.do {
            $0.text = "버전 5.183.0"
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.textColor = .systemGray2
        }
        
        dateLabel.do {
            $0.text = "5일 전"
            $0.font = .systemFont(ofSize: 18, weight: .regular)
            $0.textColor = .systemGray2
        }
        
        descriptionLabel.do {
            $0.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
            $0.font = .systemFont(ofSize: 16, weight: .light)
            $0.numberOfLines = 3
        }
    }
    
    override func setUI() {
        addsubViews(versionLabel, dateLabel, descriptionLabel)
    }
    
    override func setLayout() {
        versionLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.right.equalToSuperview()
            $0.centerY.equalTo(versionLabel.snp.centerY)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalTo(versionLabel.snp.left)
            $0.right.equalTo(dateLabel.snp.right).offset(-50)
            $0.top.equalTo(versionLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
        }
    }

}

#Preview {
    AppVersionCell()
}
