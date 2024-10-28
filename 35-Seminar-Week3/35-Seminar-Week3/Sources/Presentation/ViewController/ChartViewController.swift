//
//  ChartViewController.swift
//  Seminar-3
//
//  Created by 최안용 on 10/26/24.
//

import UIKit

import SnapKit
import Then

class ChartViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let appList = AppInfo.sampleApps
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        view.addSubview(tableView)
    }
    
    private func setUI() {
        tableView.do {            
            $0.register(PopularChartCell.self, forCellReuseIdentifier: PopularChartCell.identifier)
            $0.rowHeight = 80
            $0.delegate = self
            $0.dataSource = self
            $0.separatorInset = .init(top: 0, left: 90, bottom: 0, right: 0)
        }
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.horizontalEdges.verticalEdges.equalToSuperview()
        }
    }
}

extension ChartViewController: UITableViewDelegate {
    
}

extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PopularChartCell.identifier,
            for: indexPath
        ) as? PopularChartCell else { return UITableViewCell() }
        cell.configure(app: appList[indexPath.row])
        return cell
    }
}

#Preview {
    ChartViewController()
}
