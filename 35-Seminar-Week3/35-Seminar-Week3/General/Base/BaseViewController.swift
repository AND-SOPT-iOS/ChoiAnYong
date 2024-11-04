//
//  BaseViewController.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setStyle()
        setUI()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func setStyle() { }
    
    func setUI() { }
    
    func setLayout() { }
}
