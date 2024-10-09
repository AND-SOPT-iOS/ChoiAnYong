//
//  UIViewController+Extension.swift
//  35-Seminar
//
//  Created by 최안용 on 10/9/24.
//

import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
    
    func toPreView() -> some View {
        Preview(viewController: self)
    }
}
