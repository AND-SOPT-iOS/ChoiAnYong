//
//  UIView+Extension.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/23/24.
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
