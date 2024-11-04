//
//  AppInfoCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class AppInfoCell: BaseCollectionViewCell {
    static let identifier: String = "AppInfoCell"
    
    private let reviewCountLabel = UILabel()
    private let reviewAvgLabel = UILabel()
    private let ratingLabel = UILabel()
    
    private let prizeTitleLabel = UILabel()
    private let prizeImageView = UIImageView()
    private let prizeSubtitleLabel = UILabel()
    
    private let ageTitleLabel = UILabel()
    private let detailAgeLabel = UILabel()
    private let ageUnitLabel = UILabel()
    
    private let firstVStackView = UIStackView()
    private let secondVStackView = UIStackView()
    private let thirdVStackView = UIStackView()
    
    private let firstSeperateView = UIView()
    private let secondSeperateView = UIView()
    
    private let hStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        reviewCountLabel.do {
            $0.text = "8.4만개의 평가"
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = .systemGray2
        }
        
        reviewAvgLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .systemGray
        }
        
        ratingLabel.do {
            $0.text = "★★★★☆"
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = .systemGray
        }
        
        prizeTitleLabel.do {
            $0.text = "수상"
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = .systemGray2
        }
        
        prizeImageView.do {
            $0.image = UIImage(systemName: "person")
            $0.tintColor = .systemGray
            
        }
        
        prizeSubtitleLabel.do {
            $0.text = "앱"
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = .systemGray2
        }
        
        ageTitleLabel.do {
            $0.text = "연령"
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = .systemGray2
        }
        
        detailAgeLabel.do {
            $0.text = "4+"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        ageUnitLabel.do {
            $0.text = "세"
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = .systemGray2
        }

        
        firstVStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
            $0.distribution = .equalSpacing
            $0.backgroundColor = .systemBackground
            $0.addArrangedSubview(reviewCountLabel)
            $0.addArrangedSubview(reviewAvgLabel)
            $0.addArrangedSubview(ratingLabel)
            $0.layoutMargins = .init(top: 10, left: .zero, bottom: 10, right: .zero)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        secondVStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
            $0.distribution = .equalSpacing
            $0.backgroundColor = .systemBackground
            $0.addArrangedSubview(prizeTitleLabel)
            $0.addArrangedSubview(prizeImageView)
            $0.addArrangedSubview(prizeSubtitleLabel)
            $0.layoutMargins = .init(top: 10, left: .zero, bottom: 10, right: .zero)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        thirdVStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
            $0.distribution = .equalSpacing
            $0.backgroundColor = .systemBackground
            $0.addArrangedSubview(ageTitleLabel)
            $0.addArrangedSubview(detailAgeLabel)
            $0.addArrangedSubview(ageUnitLabel)
            $0.layoutMargins = .init(top: 10, left: .zero, bottom: 10, right: .zero)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        hStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
            $0.distribution = .fillEqually
            $0.alignment = .center
            $0.backgroundColor = .systemGray2
            $0.addArrangedSubview(firstVStackView)
            $0.addArrangedSubview(secondVStackView)
            $0.addArrangedSubview(thirdVStackView)
            $0.layoutMargins = .init(top: 0.3, left: .zero, bottom: 0.3, right: .zero)
            $0.isLayoutMarginsRelativeArrangement = true
        }
        
        firstSeperateView.do {
            $0.backgroundColor = .systemGray2
        }
        
        secondSeperateView.do {
            $0.backgroundColor = .systemGray2
        }
        
    }
    
    override func setUI() {
        self.addsubViews(hStackView,
                         firstSeperateView,
                         secondSeperateView)
    }
    
    override func setLayout() {
        prizeImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        hStackView.snp.makeConstraints {
            $0.left.top.right.bottom.equalToSuperview()
        }
        
        firstSeperateView.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(firstVStackView.snp.right)
        }
        
        secondSeperateView.snp.makeConstraints {
            $0.width.equalTo(0.3)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(secondVStackView.snp.right)
        }
    }
}

#Preview {
    AppInfoCell()
}
