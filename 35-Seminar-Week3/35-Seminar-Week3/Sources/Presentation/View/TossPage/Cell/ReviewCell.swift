//
//  ReviewCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class ReviewCell: BaseCollectionViewCell {
    static let identifier: String = "ReviewCell"
    
    private let reviewAvgLabel = UILabel()
    private let ratingLabel = UILabel()
    private let ratingTextLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        reviewAvgLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 50, weight: .bold)
        }
        
        ratingLabel.do {
            $0.text = "★★★★☆"
            $0.font = .systemFont(ofSize: 23, weight: .bold)
        }
        
        ratingTextLabel.do {
            $0.text = "8.4만개의 평가"
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
        }
        
        subTitleLabel.do {
            $0.text = "가장 도움이 되는 리뷰"
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
    }
    
    override func setUI() {
        addsubViews(
            reviewAvgLabel,
            ratingLabel,
            ratingTextLabel,
            subTitleLabel
        )
    }
    
    override func setLayout() {
        reviewAvgLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        ratingLabel.snp.makeConstraints {
            $0.bottom.equalTo(reviewAvgLabel.snp.centerY)
            $0.right.equalToSuperview()
        }
        
        ratingTextLabel.snp.makeConstraints {
            $0.right.equalTo(ratingLabel.snp.right)
            $0.top.equalTo(ratingLabel.snp.bottom).offset(5)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.left.equalTo(reviewAvgLabel.snp.left)
            $0.top.equalTo(reviewAvgLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
        }
    }
}

#Preview {
    ReviewCell()
}
