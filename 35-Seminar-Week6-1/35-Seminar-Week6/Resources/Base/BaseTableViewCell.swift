//
//  BaseTableViewCell.swift
//  CGV
//
//  Created by 예삐 on 11/18/24.
//

import UIKit

import Then

class BaseTableViewCell: UITableViewCell, ReuseIdentifiable {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    /// UI 컴포넌트 속성 설정 (do 메서드 관련)
    func setStyle() {}
    
    /// UI 위계 설정 (addSubView 등)
    func setUI() {}
    
    /// 오토레이아웃 설정 (SnapKit 코드 관련)
    func setLayout() {}
}
