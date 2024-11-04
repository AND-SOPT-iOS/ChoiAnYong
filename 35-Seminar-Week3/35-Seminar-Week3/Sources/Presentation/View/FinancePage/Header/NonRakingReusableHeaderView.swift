//
//  NonRakingReusableHeaderView.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/31/24.
//

import UIKit

import SnapKit
import Then

class NonRakingReusableHeaderView: UICollectionReusableView {
    static let identifier: String = "NonRakingReusableHeaderView"
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let arrowImageView = UIImageView()
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subTitleLabel.text = nil
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        subTitleLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .regular)
            $0.textColor = .systemGray
        }
        
        arrowImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .systemGray
        }
    }
    
    private func setUI() {
        addsubViews(titleLabel, arrowImageView, subTitleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.trailing.bottom.equalToSuperview()
        }
    }
    
    func configure(title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}

#Preview {
    NonRakingReusableHeaderView()
}
