//
//  EvaluationView.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/25/24.
//

import UIKit
import SnapKit

class EvaluationView: UIView {
    private let titleLabel = UILabel()
    private let ratingStarButtons: [UIButton] = (0..<5).map { _ in UIButton(type: .system) }
    private let createReviewButton = UIButton(type: .system)
    private let supportButton = UIButton(type: .system)
    private let hStackView = UIStackView()
    
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
            $0.setTitle("리뷰 작성", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
            $0.tintColor = .systemBlue
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.contentHorizontalAlignment = .center
            $0.semanticContentAttribute = .forceLeftToRight
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 13
            $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
        
        supportButton.do {
            $0.setTitle("앱 지원", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
            $0.tintColor = .systemBlue
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.contentHorizontalAlignment = .center
            $0.semanticContentAttribute = .forceLeftToRight
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 13
            $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
    }
    
    private func setUI() {
        self.addSubViews(titleLabel,
                         hStackView,
                         createReviewButton,
                         supportButton)
        
    }
    
    private func setLayout() {
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
    EvaluationView()
}
