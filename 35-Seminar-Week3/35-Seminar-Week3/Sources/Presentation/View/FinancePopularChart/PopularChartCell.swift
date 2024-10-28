//
//  ChartCell.swift
//  Seminar-3
//
//  Created by 최안용 on 10/26/24.
//

import UIKit

import SnapKit
import Then

class PopularChartCell: BaseTableViewCell {
    static let identifier: String = "ChartCell"
    
    private let titleLael = UILabel()
    private let subTitleLabel = UILabel()
    private let verticalStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let downloadButton = UIButton(type: .system)
    private let navigationItem = UINavigationItem()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        setStyle()
        setUI()
        setLayout()
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
        
        rankingLabel.do {
            $0.font = .systemFont(ofSize: 17, weight: .semibold)
        }
        
        titleLael.do {
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 17, weight: .regular)
        }

        subTitleLabel.do {
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 13, weight: .light)
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
            var configuration = UIButton.Configuration.gray()
            configuration.cornerStyle = .capsule
            $0.configuration = configuration
        }
        
        navigationItem.do {
            $0.title = "인기 차트"
        }
    }
    
    override func setUI() {
        contentView.addsubViews(iconImageView,
                    rankingLabel,
                    verticalStackView,
                    downloadButton)
        
        verticalStackView.addArrangedSubviews(titleLael,
                                              subTitleLabel)
    }
    
    override func setLayout() {
        
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(60)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.top.equalTo(verticalStackView.snp.top)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(15)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-18)
            $0.centerY.equalTo(iconImageView.snp.centerY)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.greaterThanOrEqualTo(68)
            $0.height.equalTo(30)
        }
    }
    
    func configure(app: AppInfo) {
        titleLael.text = app.title
        subTitleLabel.text = app.subtitle
        iconImageView.image = app.iconImage
        rankingLabel.text = "\(app.ranking)"
        var attributedTitle = AttributedString("\(app.downloadState.rawValue)")
        attributedTitle.font = .systemFont(ofSize: 16, weight: .bold)
        downloadButton.configuration?.attributedTitle = attributedTitle
    }
}


#Preview {
    ChartViewController()
}
