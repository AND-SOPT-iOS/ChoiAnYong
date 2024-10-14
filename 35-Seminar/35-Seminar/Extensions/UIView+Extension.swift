//
//  UIView+Extension.swift
//  35-Seminar
//
//  Created by 최안용 on 10/9/24.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
