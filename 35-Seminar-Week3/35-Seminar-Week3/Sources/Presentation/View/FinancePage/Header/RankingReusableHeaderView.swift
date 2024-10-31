//
//  RankingReusableHeaderView.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/31/24.
//

import UIKit

import SnapKit
import Then

protocol RankingReusableHeaderViewDelegate: AnyObject {
    func didTapHeader()
}

class RankingReusableHeaderView: UICollectionReusableView {
    static let identifier: String = "RankingReusableHeaderView"
    private let titleLabel = UILabel()
    private let arrowImageView = UIImageView()
    
    weak var delegate: RankingReusableHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setStyle()
        setUI()
        setLayout()
        setGesture()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 21, weight: .bold)
        }
        
        arrowImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .systemGray
        }
    }
    
    private func setUI() {
        addsubViews(titleLabel, arrowImageView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.leading.equalTo(titleLabel.snp.trailing)
            
        }
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTabHeader)
        )
        
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTabHeader() {
        delegate?.didTapHeader()
    }
    
    func configure(title: String) {
        titleLabel.text = title        
    }
}

#Preview {
    RankingReusableHeaderView()
}
