//
//  BannerCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/29/24.
//

import UIKit

class BannerCell: BaseCollectionViewCell {
    static let identifier = "BannerCell"
    
    private let categoryTitleLable = UILabel()
    private let titleLable = UILabel()
    private let subtitleLable = UILabel()
    private lazy var imageView = UIImageView()
    private lazy var iconImageView = UIImageView()
    private let bottomTitleLabel = UILabel()
    private let bottomSubtitleLabel = UILabel()
    private let vStackView = UIStackView()
    private let downloadButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(banner: .sampleBanners[1])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        addsubViews(
            categoryTitleLable,
            titleLable,
            subtitleLable,
            imageView,
            iconImageView,
            vStackView,
            downloadButton
        )
        
        vStackView.addArrangedSubviews(
            bottomTitleLabel,
            bottomSubtitleLabel
        )
    }
    
    override func setStyle() {
        categoryTitleLable.do {
            $0.font = .systemFont(ofSize: 11, weight: .semibold)
            $0.textColor = .systemBlue
            $0.numberOfLines = 1
            $0.setContentCompressionResistancePriority(.required, for: .vertical)
        }
        
        titleLable.do {
            $0.font = .systemFont(ofSize: 22, weight: .regular)
            $0.numberOfLines = 1
            $0.setContentCompressionResistancePriority(.required, for: .vertical)
        }
        
        subtitleLable.do {
            $0.font = .systemFont(ofSize: 20, weight: .regular)
            $0.textColor = .systemGray
            $0.numberOfLines = 1
            $0.setContentCompressionResistancePriority(.required, for: .vertical)
        }
        
        imageView.do {
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        iconImageView.do {
            $0.layer.cornerRadius = 8
            $0.layer.masksToBounds = true
        }
        
        bottomTitleLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.textColor = .white
            $0.numberOfLines = 1
        }
        
        bottomSubtitleLabel.do {
            $0.font = .systemFont(ofSize: 10, weight: .regular)
            $0.textColor = .white
            $0.numberOfLines = 1
        }
        
        vStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.distribution = .fillEqually
        }
        
        downloadButton.do {
            $0.isUserInteractionEnabled = true
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
    }
    
    override func setLayout() {
        categoryTitleLable.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        titleLable.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(categoryTitleLable.snp.bottom)
        }
        
        subtitleLable.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLable.snp.bottom)
            $0.bottom.lessThanOrEqualTo(imageView.snp.top).offset(-12)
        }
        
        imageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(subtitleLable.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().multipliedBy(0.9)
        }
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading).offset(10)
            $0.bottom.equalTo(imageView.snp.bottom).offset(-10)
            $0.size.equalTo(30)
        }
        
        vStackView.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-10)
            $0.centerY.equalTo(iconImageView.snp.centerY)
            $0.verticalEdges.equalTo(iconImageView.snp.verticalEdges)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(vStackView.snp.centerY)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.greaterThanOrEqualTo(68)
            $0.height.equalTo(30)
        }
    }
    
    override func prepareForReuse() {
        downloadButton.configuration = nil
    }
    
    func configure(banner: BannerInfo) {
        categoryTitleLable.text = banner.category
        titleLable.text = banner.title
        subtitleLable.text = banner.subtitle
        imageView.image = banner.bannerImage
        iconImageView.image = banner.iconImage
        bottomTitleLabel.text = banner.bottomTitle
        bottomSubtitleLabel.text = banner.bottomSubtitle
        
        if case .reDownload = banner.downloadState {
            downloadButton.configuration = .plain()
            downloadButton.configuration?.image = banner.downloadState.image
            downloadButton.configuration?.baseForegroundColor = .white
        } else {
            downloadButton.configuration = .gray()
            downloadButton.configuration?.cornerStyle = .capsule
            var attributedTitle = AttributedString("\(banner.downloadState.title!)")
            attributedTitle.font = .systemFont(ofSize: 16, weight: .bold)
            downloadButton.configuration?.baseBackgroundColor = .systemGray5.withAlphaComponent(0.7)
            downloadButton.configuration?.baseForegroundColor = .white
            downloadButton.configuration?.attributedTitle = attributedTitle
        }
    }
}

#Preview {
    BannerCell()
}
