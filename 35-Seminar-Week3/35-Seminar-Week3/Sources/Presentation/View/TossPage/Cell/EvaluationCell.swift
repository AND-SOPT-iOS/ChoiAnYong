//
//  EvaluationCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class EvaluationCell: BaseCollectionViewCell {
    static let identifier: String = "EvaluationCell"
    
    private let titleLabel = UILabel()
    private let ratingStarButtons: [UIButton] = (0..<5).map { _ in UIButton(type: .system) }
    private let createReviewButton = UIButton(type: .system)
    private let supportButton = UIButton(type: .system)
    private let hStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "탭하여 평가하기"
            $0.font = .systemFont(ofSize: 15, weight: .bold)
            $0.textAlignment = .center
        }
        
        ratingStarButtons.forEach { button in
            let starImage = UIImage(systemName: "star")
            button.setImage(starImage, for: .normal)
            button.tintColor = .systemBlue
        }
        
        hStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 0
            
            for i in 0..<ratingStarButtons.count {
                $0.addArrangedSubview(ratingStarButtons[i])
            }
        }
        
        createReviewButton.do {
            var configure = UIButton.Configuration.gray()
            configure.cornerStyle = .medium
            configure.title = "리뷰 작성"
            configure.image = UIImage(systemName: "square.and.pencil")
            configure.imagePadding = 5
            configure.contentInsets = .init(
                top: 13,
                leading: 0,
                bottom: 13,
                trailing: 0
            )
            configure.baseBackgroundColor = .systemGray6
            
            $0.configuration = configure
        }
        
        supportButton.do {
            var configure = UIButton.Configuration.gray()
            configure.cornerStyle = .medium
            configure.title = "앱 지원"
            configure.image = UIImage(systemName: "questionmark.circle")
            configure.imagePadding = 5
            configure.contentInsets = .init(
                top: 13,
                leading: 0,
                bottom: 13,
                trailing: 0
            )
            configure.baseBackgroundColor = .systemGray6
            
            $0.configuration = configure
        }
    }
    
    override func setUI() {
        self.addsubViews(titleLabel,
                         hStackView,
                         createReviewButton,
                         supportButton)
        
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        hStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(80)
        }
        
        createReviewButton.snp.makeConstraints {
            $0.top.equalTo(hStackView.snp.bottom).offset(20)
            $0.left.equalToSuperview()
            $0.right.equalTo(hStackView.snp.centerX).offset(-5)
            $0.bottom.equalToSuperview()
        }
        
        supportButton.snp.makeConstraints {
            $0.top.equalTo(createReviewButton.snp.top)
            $0.left.equalTo(hStackView.snp.centerX).offset(5)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

#Preview {
    EvaluationCell()
}
