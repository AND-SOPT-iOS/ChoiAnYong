//
//  AppPreviewCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 11/1/24.
//

import UIKit

class AppPreviewCell: BaseCollectionViewCell {
    static let identifier: String = "AppPreviewCell"
    
    private let imageView = UIImageView()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setStyle() {
        imageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 25
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray4.cgColor
        }
    }
    
    override func setUI() {
        addSubview(imageView)
    }
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.horizontalEdges.verticalEdges.equalToSuperview()
        }
    }
    
    func configure(previewImage: PreviewInfo) {
        imageView.image = previewImage.image
    }
}

#Preview {
    AppPreviewCell()
}
