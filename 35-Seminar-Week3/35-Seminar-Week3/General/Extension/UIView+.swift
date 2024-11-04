//
//  UIView+.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

extension UIView {
    func addsubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
