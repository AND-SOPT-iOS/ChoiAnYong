//
//  UITextField+.swift
//  35-Seminar-Week4
//
//  Created by 최안용 on 11/6/24.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ padding: CGFloat) {
        let paddingView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: padding,
                height: self.frame.height
            )
        )
        leftView = paddingView
        leftViewMode = .always
    }
}
