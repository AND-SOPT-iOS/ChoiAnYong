//
//  DeviceTypeCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class DeviceTypeCell: BaseCollectionViewCell {
    static let identifier: String = "DeviceTypeCell"
    
    private let modelLabel = UILabel()
    private let modelImageView = UIImageView()
    private let seperatorView = UIView()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        modelImageView.do {
            $0.image = .init(systemName: "iphone.gen3")
            $0.tintColor = .systemGray2
        }
        
        modelLabel.do {
            $0.text = "iPhone"
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.textColor = .systemGray2
        }
        
        seperatorView.do {
            $0.backgroundColor = .systemGray2
        }
    }
    
    override func setUI() {
        addsubViews(modelImageView, modelLabel, seperatorView)
    }
    
    override func setLayout() {
        modelImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        modelLabel.snp.makeConstraints {
            $0.centerY.equalTo(modelImageView.snp.centerY)
            $0.left.equalTo(modelImageView.snp.right).offset(10)
        }
        
        seperatorView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(modelLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.4)
            
        }
    }
}

#Preview {
    DeviceTypeCell()
}
