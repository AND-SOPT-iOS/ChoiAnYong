//
//  ViewController.swift
//  35-Seminar-Week2
//
//  Created by 최안용 on 10/16/24.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    private let tossIcon = UIImageView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let appHearderView = AppHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        // Do any additional setup after loading the view.
    }

    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
        
        tossIcon.do {
            $0.image = .tossIcon
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 25
            $0.layer.borderWidth = 0.4
            $0.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubViews(contentView)
        
        contentView.addSubViews(appHearderView)
    }
    
    private func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        appHearderView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

    }
}

#Preview {
    ViewController()
}
