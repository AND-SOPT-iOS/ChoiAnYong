//
//  UIStackView+.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
