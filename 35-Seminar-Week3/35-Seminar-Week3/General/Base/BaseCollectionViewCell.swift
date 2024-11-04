//
//  BaseCollectionViewCell.swift
//  35-Seminar-Week3
//
//  Created by 최안용 on 10/29/24.
//

import UIKit

import SnapKit
import Then

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() { }
    
    func setUI() { }
    
    func setLayout() { }
}
