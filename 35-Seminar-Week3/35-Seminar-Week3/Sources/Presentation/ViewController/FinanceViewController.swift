//
//  FinanceViewController.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

class FinanceViewController: BaseViewController {
    private let button = UIButton(type: .system)
    private let navigationTitleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    @objc func handleButton() {
        let vc = ChartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setStyle() {
        button.do {
            $0.setTitle("인기 차트", for: .normal)
            $0.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        }
        
        navigationTitleLabel.do {
            $0.text = "금융"
            
        }
    }
    
    override func setUI() {
        view.addSubview(button)
        
    }
    
    override func setLayout() {
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(100)
        }
    }
    
    private func setNavigationBar() {
        self.navigationItem.titleView = navigationTitleLabel
        self.navigationItem.backButtonTitle = "금융"
    }
}

#Preview {    
    FinanceViewController()
}
