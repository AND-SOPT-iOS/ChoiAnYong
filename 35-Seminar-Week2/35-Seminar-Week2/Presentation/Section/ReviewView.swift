//
//  ReviewView.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/25/24.
//

import UIKit

class ReviewView: UIView {
    private let titleLabel = UILabel()
    let seeAllReviewButton = UIButton(type: .system)
    private let reviewAvgLabel = UILabel()
    private let ratingLabel = UILabel()
    private let ratingTextLabel = UILabel()
    private let subTitleLabel = UILabel()
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
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        titleLabel.do {
            $0.text = "평가 및 리뷰"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        seeAllReviewButton.do {
            $0.setTitle("모두 보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
            $0.isUserInteractionEnabled = true
        }
        
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
        
        reviewTitleLabel.do {
            $0.text = "최안용"
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        reviewRatingLabel.do {
            $0.text = "★★★★★"
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        reviewInfoLabel.do {
            $0.text = "10월 25일 • ISFP"
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
        }
        
        reviewTextLabel.do {
            $0.text = "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세"
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
            $0.text = "개발자 대답"
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }
        
        answerDateLabel.do {
            $0.text = "10월 26일"
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
        }
        
        developerAnswerTextLabel.do {
            $0.text = "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 개선하였습니다."
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .systemGray
            $0.numberOfLines = 2
        }
    }
    
    private func setUI() {
        self.addSubViews(titleLabel,
                         seeAllReviewButton,
                         reviewAvgLabel,
                         ratingLabel,
                         ratingTextLabel,
                         subTitleLabel,
                         reviewView)
        
        reviewView.addSubViews(reviewTitleLabel, reviewRatingLabel, reviewInfoLabel, reviewTextLabel, developerAnswerLabel, answerDateLabel, developerAnswerTextLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        seeAllReviewButton.snp.makeConstraints {
            $0.top.right.equalToSuperview()
            
        }
        
        reviewAvgLabel.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.left)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
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
        }
        
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
            $0.left.right.equalToSuperview()
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
        }
    }
}

#Preview {
    ReviewView()
}
