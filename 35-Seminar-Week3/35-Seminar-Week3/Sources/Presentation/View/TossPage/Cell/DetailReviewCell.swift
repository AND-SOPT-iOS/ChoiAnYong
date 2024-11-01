//
//  DetailReviewCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class DetailReviewCell: BaseCollectionViewCell {
    static let identifier: String = "DetailReviewCell"
    
    private let reviewView = UIView()
    private let reviewTitleLabel = UILabel()
    private let reviewRatingLabel = UILabel()
    private let reviewInfoLabel = UILabel()
    private let reviewTextLabel = UILabel()
    private let developerAnswerLabel = UILabel()
    private let answerDateLabel = UILabel()
    private let developerAnswerTextLabel = UILabel()
    private let evaluationTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        updateBackgroundColor()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateBackgroundColor()
        }
    }
    
    private func updateBackgroundColor() {
        reviewView.backgroundColor = traitCollection.userInterfaceStyle == .dark ?
        UIColor.systemGray6 : UIColor.systemBackground
    }
    
    override func setStyle() {
        reviewTitleLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        reviewRatingLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        reviewInfoLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
        }
        
        reviewTextLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
            $0.numberOfLines = 2
        }
        
        reviewView.do {
            $0.backgroundColor = .systemBackground
            $0.layer.cornerRadius = 15
            $0.layer.shadowRadius = 8
            $0.layer.shadowOpacity = 0.1
            $0.layer.shadowOffset = .init(width: 0, height: 0)
        }
        
        developerAnswerLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        answerDateLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
        }
        
        developerAnswerTextLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
            $0.numberOfLines = 2
        }
    }
    
    override func setUI() {
        addSubview(reviewView)
        
        reviewView.addsubViews(reviewTitleLabel, reviewRatingLabel, reviewInfoLabel, reviewTextLabel, developerAnswerLabel, answerDateLabel, developerAnswerTextLabel)
    }
    
    override func setLayout() {
        reviewTitleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(20)
        }
        
        reviewRatingLabel.snp.makeConstraints {
            $0.left.equalTo(reviewTitleLabel.snp.left)
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(5)
        }
        
        reviewInfoLabel.snp.makeConstraints {
            $0.left.equalTo(reviewRatingLabel.snp.right).offset(10)
            $0.centerY.equalTo(reviewRatingLabel.snp.centerY)
        }
        
        reviewTextLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(reviewRatingLabel.snp.bottom).offset(5)
            
        }
        
        developerAnswerLabel.snp.makeConstraints {
            $0.left.equalTo(reviewTextLabel.snp.left)
            $0.top.equalTo(reviewTextLabel.snp.bottom).offset(10)
        }
        
        answerDateLabel.snp.makeConstraints {
            $0.left.equalTo(developerAnswerLabel.snp.right).offset(10)
            $0.centerY.equalTo(developerAnswerLabel.snp.centerY)
        }
        
        developerAnswerTextLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(developerAnswerLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        reviewView.snp.makeConstraints {
            $0.horizontalEdges.verticalEdges.equalToSuperview()
        }
    }
    
    func configure(review: ReviewInfo) {
        reviewTitleLabel.text = review.title
        reviewRatingLabel.text = review.rating
        reviewInfoLabel.text = review.info
        reviewTextLabel.text = review.reviewText
        developerAnswerLabel.text = review.developerAnswer
        developerAnswerTextLabel.text = review.developerAnswerText
        answerDateLabel.text = review.answerDate
    }
}

#Preview {
    DetailReviewCell()
}
