//
//  BaseUIView.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

import SnapKit
import Then

class BaseUIView: UIView {
    
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
    
    func setStyle() { }
    
    func setUI() { }
    
    func setLayout() { }

}
