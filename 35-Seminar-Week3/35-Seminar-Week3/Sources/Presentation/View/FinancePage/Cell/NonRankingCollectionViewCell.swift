//
//  NonRankingCollectionViewCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/31/24.
//

import UIKit

class NonRankingCollectionViewCell: BaseCollectionViewCell {
    static let identifier: String = "NonRankingCollectionViewCell"
    
    private let titleLael = UILabel()
    private let subTitleLabel = UILabel()
    private let verticalStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let downloadButton = UIButton(type: .system)
    private let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        iconImageView.do {
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.8
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.masksToBounds = true
        }
        
        titleLael.do {
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 17, weight: .regular)
        }

        subTitleLabel.do {
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 13, weight: .regular)
            $0.textColor = .systemGray
        }
        
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        downloadButton.do {
            $0.isUserInteractionEnabled = true
        }
        
        separatorView.do {
            $0.backgroundColor = .systemGray3
        }
    }
    
    override func setUI() {
        contentView.addsubViews(
            iconImageView,
            verticalStackView,
            downloadButton,
            separatorView
        )
        
        verticalStackView.addArrangedSubviews(
            titleLael,
            subTitleLabel
        )
    }
    
    override func prepareForReuse() {
        downloadButton.configuration = nil
    }
    
    override func setLayout() {
        
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(15)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-18)
            $0.centerY.equalTo(iconImageView.snp.centerY)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.greaterThanOrEqualTo(68)
            $0.height.equalTo(30)
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.3)
            $0.leading.equalTo(verticalStackView.snp.leading)
            $0.trailing.equalTo(downloadButton.snp.trailing)
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(app: AppInfo) {
        titleLael.text = app.title
        subTitleLabel.text = app.subtitle
        iconImageView.image = app.iconImage
        if case .reDownload = app.downloadState {
            downloadButton.configuration = .plain()
            downloadButton.configuration?.image = app.downloadState.image
        } else {
            downloadButton.configuration = .gray()
            downloadButton.configuration?.cornerStyle = .capsule
            var attributedTitle = AttributedString("\(app.downloadState.title!)")
            attributedTitle.font = .systemFont(ofSize: 16, weight: .bold)
            downloadButton.configuration?.attributedTitle = attributedTitle
        }
    }

}

#Preview {
    NonRankingCollectionViewCell()
}
