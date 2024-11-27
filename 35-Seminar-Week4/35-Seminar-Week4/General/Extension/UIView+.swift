//
//  UIView+.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/6/24.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
