//
//  FinanceViewController.swift
//  Seminar-3
//
//  Created by 최안용 on 10/27/24.
//

import UIKit

class FinanceViewController: BaseViewController {
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func handleButton() {
        let vc = ChartViewController()
        navigationController?.pushViewController(vc, animated: true)
        navigationItem.title = "금융"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func setStyle() {
        button.do {
            $0.setTitle("인기 차트", for: .normal)
            $0.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
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
}

#Preview {
    FinanceViewController()
}
